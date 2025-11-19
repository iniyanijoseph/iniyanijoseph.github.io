#import "@preview/bullseye:0.1.0": target

#let __elem(tag, attrs: (:), body) = context if target() == "html" {
  html.elem(tag, attrs: attrs, body)
}

#let is_typki = "typki" in sys.inputs

#let on-typki(body) = {
  if is_typki {
    body
  }
}

#let frame(body, text_color: rgb("#0099FF"), colored_box: none) = context {
  if target() == "html" {
    set text(fill: text_color)
    html.frame(if colored_box == none { body } else { box(inset: 1em, fill: colored_box, body) })
  } else {
    body
  }
}

/// lets all math equations be in a frame on html target
#let math-framed(body) = {
  show math.equation: it => {
    if it.block {
      frame(it)
    } else {
      box(frame(it))
    }
  }
  body
}

#let __grid-to-table(g) = {
  let (children, ..args) = g.fields()
  if args.stroke == (:) {
    args.stroke = none
  }
  if args.inset == (:) {
    args.inset = 0em
  }
  table(
    ..args, ..children.map(g_cell => {
      let (body, ..cell_args) = g_cell.fields()
      table.cell(..cell_args, body)
    })
  )
}

/// converts all grids to tables on html target
#let grids-to-tables(body) = context {
  if target() == "html" {
    show grid: __grid-to-table
    body
  } else {
    body
  }
}

/// replaces aligns to just their body on html target
#let unwrap-aligns(body) = context {
  if target() == "html" {
    show align: it => it.body
    body
  } else {
    body
  }
}

/// applies fixes for html export
#let fix-html(body) = {
  show: math-framed
  show: grids-to-tables
  show: unwrap-aligns
  body
}

// state layout:
// ("deck": (("", false), ("deck1", force), ("deck2", true)), "note-type": (none, "basic", "basic and reverse"))
#let __state = state("typki-data", ("deck": (("Default", false),), "note-type": (none,), "existing-guids": ("",)))

#let __active_deck(state) = {
  let final_deck = state.at("deck").last()
  for deck in state.at("deck") {
    if deck.at(1) {
      final_deck = deck
      break
    }
  }
  final_deck
}

#let displays = (
  field1: (field1, _, typki_body) => {
    field1
    typki_body
  },
  field2: (_, field2, typki_body) => {
    field2
    typki_body
  },
  all: (field1, field2, typki_body) => {
    field1
    field2
    typki_body
  },
  array: (field1, field2, typki_body) => (
    field1,
    {
      field2
      typki_body
    },
  ),
  "none": (_, _, typki_body) => typki_body,
  note: (field1, field2, anki_body) => {
    import "@preview/gentle-clues:1.2.0": question

    question[
      #field1
      #line(length: 100%)
      #field2
    ]

    anki_body
  },
)

#let __replace_ref_default = _ => "@REF"

/// Adds a note to the Anki export for the given name.
#let note(guid, field1, field2, note-type: none, deck: none, display: none, replace-refs: __replace_ref_default) = {
  if guid == "" {
    panic("guid can not be an empty string")
  }
  let display = display
  if display == none {
    display = displays.at("none")
  }
  if type(display) == str {
    if display in displays.keys() {
      display = displays.at(display)
    } else {
      panic("Display with name " + display + " is unknown")
    }
  }
  if is_typki {
    let typki_field = context {
      let data = __state.get()

      let note-deck = deck
      if note-deck == none {
        note-deck = __active_deck(data).at(0)
      }

      let note-type = note-type
      if note-type == none {
        if data.at("note-type").last() == none {
          note-type = ""
        } else {
          note-type = data.at("note-type").last()
        }
      }

      __elem("anki", {
        __elem("meta", attrs: (guid: guid, note-type: note-type, deck: note-deck), [])
        __elem("field1", field1)
        __elem("field2", field2)
      })
    }

    display([], [], {
      show ref: replace-refs
      typki_field
    })
  } else {
    display(field1, field2, {
      context {
        if guid in __state.get().at("existing-guids") {
          panic("Guid " + guid + " already exists!")
        }
      }
      __state.update(state => {
        state.at("existing-guids").push(guid)
        state
      })
    })
  }
}

#let basic-reverse(guid, field1, field2, deck: none, display: none, replace-refs: __replace_ref_default) = note(
  guid,
  field1,
  field2,
  deck: deck,
  note-type: "Basic (and reversed card)",
  display: display,
  replace-refs: replace-refs,
)

#let basic(guid, field1, field2, deck: none, display: none, replace-refs: __replace_ref_default) = note(
  guid,
  field1,
  field2,
  deck: deck,
  note-type: "Basic",
  display: display,
  replace-refs: replace-refs,
)

#let cloze(guid, field1, field2: "", deck: none, display: none, replace-refs: __replace_ref_default) = note(
  guid,
  field1,
  field2,
  deck: deck,
  note-type: "Cloze",
  display: display,
  replace-refs: replace-refs,
)

#let c(number, body, hint: none) = {
  if is_typki {
    // FIXME: this does not escape! Should use elem instead so that the python script can do the escaping
    "{{c" + str(number) + "::"
    body
    if hint != none {
      "::"
      hint
    }
    "}}"
  } else {
    body
  }
}

#let with-note-type(note-type, body) = {
  if is_typki {
    __state.update(state => {
      state.at("note-type").push(note-type)
      state
    })
  }
  body
  if is_typki {
    __state.update(state => {
      let _ = state.at("note-type").pop()
      state
    })
  }
}

#let with-deck(deck, force: false, sub-deck: false, body) = {
  if is_typki {
    __state.update(state => {
      let active_deck = __active_deck(state)
      if not active_deck.at(1) {
        let deck = deck
        if sub-deck {
          if active_deck != "" {
            deck = active_deck.at(0) + "::" + deck
          }
        }
        state.at("deck").push((deck, force))
      }
      state
    })
  }
  body
  if is_typki {
    __state.update(state => {
      let deck = deck
      if state.at("deck").last().at(0) == deck or state.at("deck").last().at(0).ends-with(deck) {
        let _ = state.at("deck").pop()
      }

      state
    })
  }
}
