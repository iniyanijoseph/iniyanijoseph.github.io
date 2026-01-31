#import "@preview/bullseye:0.1.0": *
#import "../../cv.typ": *

#show: cv.with(subpage: true, root: "../../")

This recipe by John Kanell looks good, and is quite easy @kanell2022bread.

== Ingredients
- 450g$+ epsilon$ bread flour
- 10g kosher salt 
- 7g instant yeast
- 360g lukewarm water

== Directions
- Combine dry ingredients. Then add water and mix until a sticky dough forms.
- Cover and place in warm area or refrigerate until doubled in size.
- Preheat the oven to 450°F. Place a large Dutch oven with a lid in the oven for at least 30 minutes.
- Let rest at room temperature for 15 minutes.
- Using lightly floured hands, reach down one side of the dough to the bottom of the bowl, pull up, and stretch the edge of the dough over the center toward the opposite side. Turn the bowl 90 degrees and repeat the folding and turning, working in a circle around the dough until the dough starts to hold its shape, about 8 to 10 rotations. Pinch any seams together at the center of the dough ball.
- Turn out the dough onto a lightly floured surface, placing it seam side down. Shape into a round loaf. Transfer the dough onto parchment paper and sprinkle it with flour. Loosely cover with plastic wrap or a tea towel for 10 minutes.
- Using a sharp knife or bread lame, cut a slit about $1/4$-inch deep across the top of the dough. Very carefully place the dough with the parchment paper directly into the preheated Dutch oven. Cover with the lid.
- Bake for 30 minutes. Remove the lid and bake until deeply golden brown, about 15 to 17 minutes more. Carefully remove the bread from the Dutch oven using the parchment paper to help, and place on a wire rack to cool for at least 20 minutes before slicing.

#table(
  columns: (auto, auto, auto),
  align: (left, right, right),
  stroke: (x, y) => if y == 0 or y == 2 or y == 4 or y == 6 or y == 9 or y == 14 { 2pt } else { 0.5pt },
  inset: 6pt,
  
  table.header(
    table.cell(colspan: 3, align: left)[
      #text(size: 18pt, weight: "black")[Nutrition Facts]
    ],
  ),
  
  table.cell(colspan: 3, align: left)[Serving Size: 1 serving],
  
  table.cell(colspan: 3, align: left)[
    #text(size: 14pt, weight: "bold")[Calories] #h(1fr) #text(size: 14pt, weight: "bold")[222]
  ],
  
  table.cell(colspan: 3, align: right)[
    #text(size: 9pt)[\% *Daily Value*]
  ],
  
  [*Total Fat* 1g], [], [1%],
  [#h(1em) Saturated Fat 1g], [], [5%],
  [#h(1em) Polyunsaturated Fat 1g], [], [],
  [#h(1em) Monounsaturated Fat 1g], [], [],
  
  [*Cholesterol* 0mg], [], [0%],
  [*Sodium* 514mg], [], [22%],
  
  [*Total Carbohydrate* 44g], [], [16%],
  [#h(1em) Dietary Fiber 2g], [], [7%],
  [#h(1em) Total Sugars 1g], [], [],
  
  [*Protein* 8g], [], [],
  
  table.cell(colspan: 3, align: left)[#v(0.3em)],
  
  [Vitamin A 1IU], [], [0%],
  [Vitamin C 1mg], [], [1%],
  [Calcium 11mg], [], [1%],
  [Iron 1mg], [], [6%],
  [Potassium 91mg], [], [2%],
  
  table.cell(colspan: 3, align: left)[
    #v(0.5em)
    #text(size: 8pt)[*\** Percent Daily Values are based on a 2,000 calorie diet.]
  ],
) 

#bibliography("recipes.bib")
