#{
  let castint(x) = int(x.trim())
  let commasplit(x) = x.split("-").map(castint)
  let input = read("input02.txt").trim().split(",").map(commasplit)

  // [#input#linebreak()]

  let count = 0
  let sum = 0
  for (x, y) in input {
    for i in range(x, y + 1) {
      let digitlength = (str(i)).len()
      if calc.rem-euclid(digitlength, 2) == 1 {
        continue
      } else {
        if str(i).slice(0, int(digitlength / 2)) == str(i).slice(int(digitlength / 2)) {
          count += 1
          sum += i
        }
      }
    }
  }
  [#sum]
  linebreak()
  line()

  let sum = 0
  let generated = (:)
  let counted = (:)
  for (x, y) in input {
    let prefixx = int(str(x).slice(0, int(str(x).len()/2)))
    let prefixy = int(str(y).slice(0, int(str(y).len()/2)))
    [(#x #y\; #prefixx #prefixy\; ]

    for i in range(prefixx, prefixy + 1) {
      [#i, ]
    }
    [)]
    line()
  }
  // [#sum ]
}

