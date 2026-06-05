#import "@preview/bullseye:0.1.0": *
#import "../../cv.typ": *

#show: cv.with(subpage: true, root: "../../", fancylist: false)

// #set page(margin: 1.5cm)
#set heading(numbering: none)

#let horizontalrule = [
  #line(start: (25%, 0%), end: (75%, 0%))
] 

#show heading: smallcaps

= Meal Plan <meal-plan>
#strong[Goal:] 1430–1600 cal on regular days | 1000–1100 cal on banking days #strong[Protein target:] 130–150g/day #strong[Style:] Mediterranean + low-carb | Vegetarian | One cook per day, split across 2 meals

#horizontalrule

== Weekly Meal Prep <weekly-meal-prep>
=== Paneer (\~230g per day, 6 portions) <paneer-230g-per-day-6-portions>
#strong[Yield:] \~1.4kg from 2 gallons 2% milk + 1 gallon whole milk

+ Heat 3 gallons of milk (2 gallons 2%, 1 gallon whole) to 185°F, stirring to prevent scorching
+ Remove from heat, slowly stir in 1/2 cup distilled white vinegar
+ Let sit 5–10 minutes until curds fully separate
+ Line a colander with cheesecloth, pour in curdled milk
+ Drain 30 minutes, then press firmly 1–2 hours with a heavy pan on top
+ Unwrap, cut into 6 equal portions (\~230g each), refrigerate up to 6 days

#strong[Macros per 230g portion:] \~490 cal | 38g protein | 10g carbs | 28g fat

#horizontalrule

=== Roasted Vegetable Mix (\~300g per day, 6 portions) <roasted-vegetable-mix-300g-per-day-6-portions>
#strong[Yield:] \~1.8kg roasted veg

+ Preheat oven to 425°F
+ Combine in a large roasting pan:
  - 3x 8oz tubs pre-cut white mushrooms
  - 2 medium onions, roughly chopped
  - 2 cloves garlic, smashed
  - 3 peppers (1 yellow, 1 red, 1 orange), chopped
+ Toss with 2 tbsp EVOO, salt, oregano, chili flakes
+ Roast 50–60 minutes tossing halfway, until caramelized
+ Portion into 6 equal containers (\~300g each), refrigerate up to 6 days

#strong[Macros per 300g portion:] \~110 cal | 5g protein | 18g carbs | 3g fat

#horizontalrule

=== Pizza Dough (8 portions, freeze individually) <pizza-dough-8-portions-freeze-individually>
==== Ingredients 
- 630g bread flour
- 15g sugar
- 10g kosher salt
- 10g instant yeast
- 32g oil
- 420g lukewarm water

#strong[Toppings (per full pizza, not used in this plan's recipe):]
- 24oz tomato sauce jar
- 1 lb mozzarella cheese

==== Method 
+ Combine all dry ingredients (flour, sugar, salt, yeast)
+ Add oil and lukewarm water, mix until shaggy
+ Knead until dough passes the windowpane test (\~10 min by hand, \~6 min by machine)
+ Divide into 8 equal portions (\~142g each)
+ Shape into balls, place in oiled containers, and ferment in the fridge 24–72 hours
+ Freeze individually in zip bags; thaw in fridge overnight before use

#horizontalrule

=== Spinach (\~170g per day) <spinach-170g-per-day>
Use half a 12oz frozen bag daily. Sauté straight from frozen or thaw overnight.

#strong[Macros per 170g:] \~40 cal | 5g protein | 6g carbs | 0g fat

#horizontalrule

=== Snack Options <snack-options>
Always includes #strong[Kirkland whey shake] (\~160 cal | 25g protein | 5g carbs | 3g fat) + optionally one of:

#figure(
  [#table(
      columns: 5,  table.header([Option], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Low fat Greek yogurt 200g], [\~110], [20g], [12g], [2g], [Cheese stick x1], [\~80], [6g], [1g], [6g], [Cheese stick x2], [\~160], [12g], [2g], [11g], [Seasonal fruit (medium piece)], [\~80], [1g], [20g], [0g], [Unsalted peanuts 30g], [\~170], [7g], [5g], [15g],
    )], kind: table,
)

#horizontalrule

== Recipes <recipes>
All recipes use your daily base: #strong[230g paneer + 300g roasted veg + 170g spinach.] Cook once, split into 2 equal portions for both meals.

#horizontalrule

=== Pizza with Eggs <pizza-with-eggs>
#strong[\~1482 cal | \~109g protein | \~95g carbs | \~68g fat]

==== Ingredients
- 150g frozen pizza dough (1/8 recipe), thawed
- 30g Calabrian chili pesto
- 230g paneer, crumbled
- 300g roasted veg
- 170g spinach
- 2 whole eggs
- chili flakes, oregano, salt
- Snack: Kirkland shake + 2 cheese sticks

==== Method
Stretch dough thin on a floured surface. Spread pesto as sauce. Scatter roasted veg, spinach, and crumbled paneer. Crack 2 eggs directly on top. Bake at 475°F for 12–15 min until crust is golden and eggs just set. Slice and split into 2 portions.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Pizza dough 150g], [340], [11g], [53g], [6g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [2 whole eggs], [140], [12g], [0g], [10g], [Pesto 30g], [42], [1g], [1g], [4g], [Shake + 2 cheese sticks], [320], [37g], [7g], [17g], [#strong[Total];], [#strong[\~1482];], [#strong[\~109g];], [#strong[\~95g];], [#strong[\~68g];],
    )], kind: table,
)

#horizontalrule

=== Egg White Omelette <egg-white-omelette>
#strong[\~1450 cal | \~148g protein | \~74g carbs | \~60g fat]

==== Ingredients 
- 400g liquid egg whites
- 2 whole eggs
- 230g paneer, crumbled
- 300g roasted veg
- 170g spinach
- 1 tbsp EVOO 
- cumin, chili flakes, paprika, salt
- Snack: Kirkland shake + 200g Greek yogurt + seasonal fruit

==== Method 
 Heat EVOO in a large pan. Sauté roasted veg and spinach until warmed through. Whisk egg whites and whole eggs together, pour over veg. Scatter crumbled paneer on top. Cook low and slow, folding when edges set. Slide onto a plate and cut in half for 2 meals.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Egg whites 400g], [200], [42g], [3g], [0g], [2 whole eggs], [140], [12g], [0g], [10g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [Shake + Greek yogurt 200g], [270], [45g], [17g], [5g], [Seasonal fruit (medium)], [80], [1g], [20g], [0g], [#strong[Total];], [#strong[\~1450];], [#strong[\~148g];], [#strong[\~74g];], [#strong[\~60g];],
    )], kind: table,
)

#horizontalrule

=== Shakshuka <shakshuka>
#strong[\~1470 cal | \~114g protein | \~62g carbs | \~84g fat]

==== Ingredients 
- 1 x 400g can crushed tomatoes
- 300g roasted veg
- 170g spinach
- 230g paneer, cubed
- 3 whole eggs 
- 1 tbsp EVOO 
- cumin, chili powder, paprika, oregano, chili flakes, salt
- Snack: Kirkland shake + 3 cheese sticks

==== Method 
 Heat EVOO in a deep pan. Add roasted veg and spices, cook 2 min. Add crushed tomatoes and simmer 5 min. Add spinach and stir until wilted. Add paneer cubes. Make 3 wells, crack one egg in each. Cover and cook until whites are set but yolks slightly runny, \~5–7 min. Split into 2 portions.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Crushed tomatoes 400g], [100], [5g], [20g], [1g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [Paneer 230g], [490], [38g], [10g], [28g], [3 whole eggs], [210], [18g], [0g], [15g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [Shake + 3 cheese sticks], [400], [43g], [8g], [23g], [#strong[Total];], [#strong[\~1470];], [#strong[\~114g];], [#strong[\~62g];], [#strong[\~84g];],
    )], kind: table,
)

#horizontalrule

=== Quesadillas <quesadillas>
#strong[\~1540 cal | \~117g protein | \~156g carbs | \~49g fat]

==== Ingredients 
- 3 large whole wheat tortillas (1.5 per meal) 
- 230g paneer, crumbled and split evenly 
- 300g roasted veg, split evenly 
- 170g spinach, split evenly 
- 150g canned black beans, drained, split evenly 
- salsa for topping
- Frank's Red Hot
- cumin, chili flakes, oregano
- Snack: Kirkland shake + 200g Greek yogurt (served as sour cream on the side)

==== Method 
 Heat a dry pan over medium-high. For each meal: lay 1 full tortilla flat, add half the paneer, veg, spinach, and black beans on one side, fold over and cook 3–4 min per side until crispy. Cut the half tortilla into 2 triangles and serve alongside. Top with Greek yogurt, salsa, and Frank's.

#quote(block: true)[
  Highest carb day — best on a lifting day.
]

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [3 whole wheat tortillas (\~60g each)], [480], [15g], [78g], [12g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [Black beans 150g drained], [150], [9g], [27g], [1g], [Shake + Greek yogurt 200g], [270], [45g], [17g], [5g], [#strong[Total];], [#strong[\~1540];], [#strong[\~117g];], [#strong[\~156g];], [#strong[\~49g];],
    )], kind: table,
)

#horizontalrule

=== Sandwiches <sandwiches>
#strong[\~1431 cal | \~107g protein | \~103g carbs | \~63g fat]

==== Ingredients 
- 4 slices whole wheat bread (2 per sandwich, 1 sandwich per meal)
- 230g paneer, sliced
- 300g roasted veg
- 170g spinach
- 40g pesto, spread on bread
- 1 tbsp balsamic vinegar
- fresh tomato if available
- dried basil, oregano, chili flakes
- Snack: Kirkland shake + 3 cheese sticks

==== Method 
 Toast bread. Spread pesto on both slices of each sandwich. Layer spinach, paneer, roasted veg, and tomato if using. Drizzle balsamic. Close sandwich. Split veg and paneer evenly for both meals.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [4 slices whole wheat bread], [320], [14g], [56g], [4g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [Pesto 40g], [56], [2g], [2g], [5g], [Balsamic 1 tbsp], [15], [0g], [3g], [0g], [Shake + 3 cheese sticks], [400], [43g], [8g], [23g], [#strong[Total];], [#strong[\~1431];], [#strong[\~107g];], [#strong[\~103g];], [#strong[\~63g];],
    )], kind: table,
)

#horizontalrule

=== Whole Wheat Penne <whole-wheat-penne>
#strong[\~1591 cal | \~117g protein | \~141g carbs | \~61g fat]

==== Ingredients 
- 90g dry whole wheat penne 
- 230g paneer, cubed
- 300g roasted veg 
- 170g spinach 
- 150g canned chickpeas, drained 
- 40g pesto 
- 1 tbsp EVOO 
- 1 tbsp balsamic vinegar 
- chili flakes, oregano, basil, salt
- Snack: Kirkland shake + 200g Greek yogurt

==== Method 
 Cook penne. In the same pan heat EVOO, sear paneer cubes until golden. Add roasted veg, chickpeas, and spinach, toss until wilted. Add drained pasta, pesto, balsamic, and spices. Toss together. Split into 2 portions.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Whole wheat penne 90g dry], [310], [12g], [55g], [3g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [Chickpeas 150g drained], [180], [10g], [30g], [3g], [Pesto 40g], [56], [2g], [2g], [5g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [Balsamic 1 tbsp], [15], [0g], [3g], [0g], [Shake + Greek yogurt 200g], [270], [45g], [17g], [5g], [#strong[Total];], [#strong[\~1591];], [#strong[\~117g];], [#strong[\~141g];], [#strong[\~61g];],
    )], kind: table,
)

#horizontalrule

=== Orzo Skillet <orzo-skillet>
#strong[\~1535 cal | \~114g protein | \~139g carbs | \~55g fat]

==== Ingredients 
- 90g dry whole wheat orzo
- 230g paneer, crumbled
- 300g roasted veg
- 170g spinach
- 150g canned chickpeas, drained
- 1 tbsp EVOO
- 1 tbsp balsamic vinegar
- cumin, paprika, chili flakes, basil, salt
- Snack: Kirkland shake + 200g Greek yogurt

==== Method 
 Cook orzo. Heat EVOO in a wide pan, add roasted veg, chickpeas, and spinach, toss until wilted. Add orzo, crumbled paneer, balsamic, and spices. Toss together 2–3 min. Split into 2 portions.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Whole wheat orzo 90g dry], [310], [11g], [55g], [2g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [Chickpeas 150g drained], [180], [10g], [30g], [3g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [Balsamic 1 tbsp], [15], [0g], [3g], [0g], [Shake + Greek yogurt 200g], [270], [45g], [17g], [5g], [#strong[Total];], [#strong[\~1535];], [#strong[\~114g];], [#strong[\~139g];], [#strong[\~55g];],
    )], kind: table,
)

#horizontalrule

=== Saag Paneer with Bread <saag-paneer-with-bread>
#strong[\~1500 cal | \~103g protein | \~126g carbs | \~61g fat]

==== Ingredients 
- 230g paneer, cubed
- 300g roasted veg
- 170g spinach
- 150g canned chickpeas, drained
- 1 tbsp EVOO
- 4 slices whole wheat bread (2 per meal, served on the side)
- cumin, fenugreek, paprika, chili powder, chili flakes, salt
- Snack: Kirkland shake + 1 cheese stick

==== Method 
 Heat EVOO in a pan, bloom cumin and fenugreek 30 seconds. Add roasted veg and chickpeas, cook 3–4 min. Add spinach and stir until fully wilted. Add paneer cubes, toss gently, season with remaining spices. Cook 3–4 min until paneer is warmed through and coated. Split into 2 portions. Serve each with 2 slices toasted whole wheat bread.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [Chickpeas 150g drained], [180], [10g], [30g], [3g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [4 slices whole wheat bread], [320], [14g], [56g], [4g], [Shake + 1 cheese stick], [240], [31g], [6g], [9g], [#strong[Total];], [#strong[\~1500];], [#strong[\~103g];], [#strong[\~126g];], [#strong[\~61g];],
    )], kind: table,
)

#horizontalrule

=== Frittata Sandwich <frittata-sandwich>
#strong[\~1480 cal | \~143g protein | \~81g carbs | \~62g fat]

==== Ingredients 
- 300g liquid egg whites
- 2 whole eggs
- 230g paneer, crumbled
- 300g roasted veg
- 170g spinach
- 1 tbsp EVOO
- 2 slices whole wheat bread (1 per meal, served on the side) 
- pesto or Frank's to serve
- oregano, chili flakes, salt
- Snack: Kirkland shake + 200g Greek yogurt

==== Method 
 Heat EVOO in an oven-safe pan. Sauté veg and spinach until wilted. Whisk egg whites and whole eggs, pour over veg. Scatter paneer. Cook on stovetop until edges set, then transfer to 375°F oven for 8–10 min until puffed and set through. Slide onto a board, cut into 2 equal portions. Serve each with 1 slice toasted whole wheat bread and pesto or Frank's on the side.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Egg whites 300g], [150], [31g], [2g], [0g], [2 whole eggs], [140], [12g], [0g], [10g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [2 slices whole wheat bread], [160], [7g], [28g], [2g], [Shake + Greek yogurt 200g], [270], [45g], [17g], [5g], [#strong[Total];], [#strong[\~1480];], [#strong[\~143g];], [#strong[\~81g];], [#strong[\~62g];],
    )], kind: table,
)

#horizontalrule

== Banking Days (Calorie Banking: 1000–1100 cal) <banking-days-calorie-banking-10001100-cal>
#emph[Use the day before eating out. High fiber, high volume, low calorie.] #emph[Target \~1000–1100 cal to offset a \~1800–2000 cal restaurant meal, averaging \~1500/day over 2 days.]

#horizontalrule

=== Warm Spinach Salad <warm-spinach-salad>
#strong[\~1030 cal | \~85g protein | \~47g carbs | \~53g fat]

==== Ingredients 
- 230g paneer, crumbled 
- 300g roasted veg 
- 170g spinach 
- 1 tsp EVOO 
- 2 tbsp balsamic vinegar 
- chili flakes, oregano
- Snack: Kirkland shake + 2 cheese sticks

==== Method 
 Heat pan, deglaze roasted veg with balsamic. Pour warm over raw spinach to wilt slightly. Top with crumbled paneer. Drizzle EVOO. Split into 2 portions.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [EVOO 1 tsp], [40], [0g], [0g], [5g], [Balsamic 2 tbsp], [30], [0g], [6g], [0g], [Shake + 2 cheese sticks], [320], [37g], [7g], [17g], [#strong[Total];], [#strong[\~1030];], [#strong[\~85g];], [#strong[\~47g];], [#strong[\~53g];],
    )], kind: table,
)

#horizontalrule

=== Greek-Inspired Cold Salad <greek-inspired-cold-salad>
#strong[\~1010 cal | \~86g protein | \~51g carbs | \~48g fat]

==== Ingredients 
- 230g paneer, cubed
- 300g roasted veg (served cold or room temp)
- 170g spinach
- fresh tomato, sliced
- 2 tbsp balsamic
- chili flakes, oregano, dried basil
- Snack: Kirkland shake + 2 cheese sticks

==== Method 
 Combine all in a large bowl. Dress with balsamic and spices. Split into 2 portions. Serve cold.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [Tomato \~100g], [20], [1g], [4g], [0g], [Balsamic 2 tbsp], [30], [0g], [6g], [0g], [Shake + 2 cheese sticks], [320], [37g], [7g], [17g], [#strong[Total];], [#strong[\~1010];], [#strong[\~86g];], [#strong[\~51g];], [#strong[\~48g];],
    )], kind: table,
)

#horizontalrule

=== Panzanella-Style Salad <panzanella-style-salad>
#strong[\~1010 cal | \~81g protein | \~77g carbs | \~36g fat]

==== Ingredients 
- 230g paneer, cubed 
- 300g roasted veg 
- 170g spinach 
- 2 slices whole wheat bread, toasted and torn into chunks 
- fresh tomato if available 
- 2 tbsp balsamic 
- chili flakes, basil, oregano
- Snack: Kirkland shake only

==== Method 
 Toast and tear bread. Combine all ingredients. Dress with balsamic and spices. Let sit 5 min so bread absorbs juices. Split into 2 portions.

#figure(
    [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [2 slices whole wheat bread], [160], [7g], [28g], [2g], [Tomato \~100g], [20], [1g], [4g], [0g], [Balsamic 2 tbsp], [30], [0g], [6g], [0g], [Kirkland shake], [160], [25g], [5g], [3g], [#strong[Total];], [#strong[\~1010];], [#strong[\~81g];], [#strong[\~77g];], [#strong[\~36g];],
    )], kind: table,
)

#horizontalrule

=== Idaho Potato and Paneer Soup <idaho-potato-and-paneer-soup>
#strong[\~1085 cal | \~84g protein | \~95g carbs | \~40g fat]

==== Ingredients
- 250g Idaho potato, roughly diced
- 230g paneer, cubed
- 300g roasted veg
- 170g spinach
- 1 tbsp EVOO
- 2 cups vegetable broth
- cumin, paprika, turmeric, chili flakes, salt
- Snack: Kirkland shake + 1 cheese stick

==== Method
Heat EVOO in a deep pot. Add roasted veg and spices, cook 2 min. Add potato and broth, simmer 15 min until potato is very soft. Add spinach and stir until wilted. Partially blend with a hand blender — leave chunky, not smooth. Add paneer cubes and simmer 3–4 min. Split into 2 portions.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Idaho potato 250g], [215], [5g], [50g], [0g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [Shake + 1 cheese stick], [240], [31g], [6g], [9g], [#strong[Total];], [#strong[\~1215];], [#strong[\~84g];], [#strong[\~90g];], [#strong[\~54g];],
    )], kind: table,
)

#quote(block: true)[
  Runs a little over the 1000–1100 cal target. Drop to 180g potato or skip the cheese stick to pull it back.
]

#horizontalrule

=== Shakshuka-Style Tomato Soup with Paneer <shakshuka-style-tomato-soup-with-paneer>
#strong[\~1180 cal | \~90g protein | \~61g carbs | \~63g fat]

==== Ingredients
- 1 x 400g can crushed tomatoes
- 230g paneer, cubed
- 300g roasted veg
- 170g spinach
- 1 tbsp EVOO
- 1 cup vegetable broth
- cumin, paprika, chili powder, chili flakes, oregano, salt
- Snack: Kirkland shake + 2 cheese sticks

==== Method
Heat EVOO in a deep pot. Add roasted veg and spices, cook 2 min. Add crushed tomatoes and broth, simmer 8–10 min. Add spinach and partially blend with a hand blender. Add paneer cubes and simmer 5 min until warmed through. Split into 2 portions.

#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Crushed tomatoes 400g], [100], [5g], [20g], [1g], [Paneer 230g], [490], [38g], [10g], [28g], [Roasted veg 300g], [110], [5g], [18g], [3g], [Spinach 170g], [40], [5g], [6g], [0g], [EVOO 1 tbsp], [120], [0g], [0g], [14g], [Shake + 2 cheese sticks], [320], [37g], [7g], [17g], [#strong[Total];], [#strong[\~1180];], [#strong[\~90g];], [#strong[\~61g];], [#strong[\~63g];],
    )], kind: table,
)

#quote(block: true)[
  Slightly over 1100 cal — swap 2 cheese sticks for 1 to pull it to \~1100.
]
#horizontalrule
== Breakfast (+300 cal for maintenance)
=== Protein Oats with Berries <protein-oats-with-berries>
#strong[\~300 cal | \~26g protein | \~35g carbs | \~5g fat]
==== Ingredients
- 30g rolled oats
- 30g vanilla pea or hemp protein powder (1 scoop)
- 180ml water (or pea milk for +8g protein)
- 80g mixed berries
- Optional: 15g nut butter
==== Method
Mix oats and protein powder in a microwave-safe bowl. Add water and stir. Microwave on high for 2–3 min, stopping once to stir. Top with berries. Add nut butter if desired.
#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Rolled oats 30g], [110], [3g], [20g], [2g], [Protein powder 30g], [120], [22g], [3g], [2g], [Mixed berries 80g], [45], [1g], [11g], [0g], [Water/pea milk 180ml], [0–70], [0–8g], [0–1g], [0g], [#strong[Total];], [#strong[\~300];], [#strong[\~26g];], [#strong[\~35g];], [#strong[\~5g];],
    )], kind: table,
)

#horizontalrule
=== Greek Yogurt Bowl <greek-yogurt-bowl>
#strong[\~270 cal | \~22g protein | \~18g carbs | \~8g fat]
==== Ingredients
- 170g 0% Greek yogurt
- 15g nut butter
- 80g mixed berries
==== Method
Spoon yogurt into a bowl. Top with berries. Drizzle or dollop nut butter over the top. No cooking required.
#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Greek yogurt 170g], [100], [17g], [6g], [0g], [Nut butter 15g], [95], [4g], [3g], [8g], [Mixed berries 80g], [45], [1g], [11g], [0g], [#strong[Total];], [#strong[\~270];], [#strong[\~22g];], [#strong[\~18g];], [#strong[\~8g];],
    )], kind: table,
)

#horizontalrule
=== Protein Pancakes <protein-pancakes>
#strong[\~300 cal | \~25g protein | \~22g carbs | \~8g fat]
==== Ingredients
- 1 scoop vanilla protein powder (30g)
- 1 whole egg
- 1 medium banana (100g), mashed
- Cooking spray or 5g butter
==== Method
Mash banana in a bowl. Add egg and protein powder, mix until combined. Heat a pan over medium heat, spray with cooking spray. Pour small rounds of batter. Cook 2–3 min per side until set. Top with berries if desired.
#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Protein powder 30g], [120], [22g], [3g], [2g], [Egg 1 whole], [70], [6g], [0g], [5g], [Banana 100g], [90], [1g], [23g], [0g], [Butter/spray 5g], [35], [0g], [0g], [4g], [#strong[Total];], [#strong[\~300];], [#strong[\~25g];], [#strong[\~22g];], [#strong[\~8g];],
    )], kind: table,
)

#horizontalrule
=== Chia Pudding <chia-pudding>
#strong[\~280 cal | \~14g protein | \~28g carbs | \~10g fat]
==== Ingredients
- 30g chia seeds
- 240ml milk
- 2–3 drops vanilla extract
- 80g mixed berries
==== Method
Mix chia seeds, milk, and vanilla in a jar or bowl. Stir well, then stir again after 5 minutes to prevent clumping. Cover and refrigerate overnight. Top with berries in the morning.
#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Chia seeds 30g], [140], [5g], [12g], [9g], [Milk 240ml], [125], [8g], [12g], [5g], [Mixed berries 80g], [45], [1g], [11g], [0g], [#strong[Total];], [#strong[\~280];], [#strong[\~14g];], [#strong[\~28g];], [#strong[\~10g];],
    )], kind: table,
)
#horizontalrule
=== Cottage Cheese Bowl <cottage-cheese-bowl>
#strong[\~260 cal | \~28g protein | \~16g carbs | \~6g fat]
==== Ingredients
- 200g low-fat cottage cheese
- 80g mixed berries
- 15g nut butter
- Small drizzle of honey (optional)
==== Method
Spoon cottage cheese into a bowl. Top with berries and nut butter. Drizzle honey if desired. No cooking required.
#figure(
  [#table(
      columns: 5,  table.header([Component], [Cal], [Protein], [Carbs], [Fat]), table.hline(), [Cottage cheese 200g], [140], [24g], [6g], [2g], [Mixed berries 80g], [45], [1g], [11g], [0g], [Nut butter 15g], [95], [4g], [3g], [8g], [Honey drizzle 5g], [15], [0g], [4g], [0g], [#strong[Total];], [#strong[\~260];], [#strong[\~28g];], [#strong[\~16g];], [#strong[\~6g];],
    )], kind: table,
)

#horizontalrule

== Pantry & Fridge Checklist <pantry-fridge-checklist>
==== Meal prep (weekly)
- 2 gallons 2% milk + 1 gallon whole milk 
- 3x 8oz pre-cut white mushroom tubs 
- 2 medium onions, 2 garlic cloves, 3 peppers (yellow/red/orange) 
- 12oz frozen spinach bag x2 
- Liquid egg whites (carton) 
- Kirkland whey protein shake

==== Rotating weekly based on plan
- Whole wheat tortillas 
- Whole wheat bread 
- Dry whole wheat penne or orzo 
- Frozen pizza dough (pre-portioned into 1/8ths) 
- Canned crushed tomatoes 
- Canned black beans 
- Canned chickpeas 
- Vegetable broth
- Idaho potatoes
- Calabrian chili pesto 
- Low fat Greek yogurt (recipe dependent)
- Fresh tomatoes (optional) 
- Seasonal fruit (optional snack)

==== Always in pantry
- EVOO
- balsamic vinegar 
- distilled white vinegar 
- cumin
- paprika
- chili flakes
- chili powder
- fenugreek 
- dried basil
- oregano 
- salt
- Frank's Red Hot 
- onion
- garlic
