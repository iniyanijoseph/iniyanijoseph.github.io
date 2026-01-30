#import "@preview/bullseye:0.1.0": *
#import "../../cv.typ": *

#show: cv.with(subpage: true, root: "../../")

Recently, I have had the opportunity to make more pizza. This recipe by Lopez-Alt is has been my favorite, and is quite easy @lopez2025nycpizza.

== Ingredients
=== Dough
- 630g$+ epsilon$ bread flour
- 15g sugar
- 10g kosher salt 
- 10g instant yeast
- 32g oil 
- 420g lukewarm water
=== Toppings
- 24 oz tomato sauce jar
- 1 lb mozzarella cheese

== Directions
- Combine dry ingredients
- Add wet ingredients and knead until the dough passes the windowpane test
- Divide into 3 equal parts and cold ferment for 1-5 days.
- Bake in a $550^circle F$ oven on the top rack. If possible, use a pizza stone or large cast iron pan. 

== Cost
=== Dough
- Bread Flour (\$0.69)
- Oil (\$0.14)
- Yeast (\$0.22)
- Salt (\$0.04)
- Sugar (\$0.03)
=== Toppings
- Cheese (\$3.58)
- Tomato Sauce (\$2.96)

This recipe yields 6 half-pizzas. The cost per half-pizza (one meal) is \$1.28 with nutrition: 

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
  
  table.cell(colspan: 3, align: left)[Serving Size: 1/2 Pizza],
  
  table.cell(colspan: 3, align: left)[
    #text(size: 14pt, weight: "bold")[Calories] #h(1fr) #text(size: 14pt, weight: "bold")[-684]
  ],
  
  table.cell(colspan: 3, align: right)[
    #text(size: 9pt)[\% *Daily Value*]
  ],
  
  [*Total Fat* 23g], [], [30%],
  [#h(1em) Saturated Fat 10g], [], [51%],
  
  [*Cholesterol* 60mg], [], [20%],
  [*Sodium* 1,398mg], [], [61%],
  
  [*Total Carbohydrate* 86g], [], [31%],
  [#h(1em) Dietary Fiber 4g], [], [14%],
  [#h(1em) Total Sugars 7g], [], [],
  
  [*Protein* 31g], [], [63%],
  
  table.cell(colspan: 3, align: left)[#v(0.3em)],
  
  [Calcium 382mg], [], [29%],
  [Iron 5.0mg], [], [28%],
  
  table.cell(colspan: 3, align: left)[
    #v(0.5em)
    #text(size: 8pt)[*\** Percent Daily Values are based on a 2,000 calorie diet.]
  ],
)

#bibliography("recipes.bib")
