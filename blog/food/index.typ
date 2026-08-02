#import "../../index.typ":template,margin-note, linked-image, linked-video
#import "@preview/tablem:0.3.0": three-line-table, tablem

#show: template.with(title: "Weekly Meal Prep", root: "../../")

= Weekly
#tablem[
  | Ingredient             | Package bought at Aldi | Amount used/week | Cost per store item | Cost charged to week |
  | ---------------------- | ---------------------- | ---------------: | ------------------: | -------------------: |
  | Great Northern beans   | 32 oz bag              |            16 oz |               \$2.19 |            *\$1.10* |
  | Carrots                | 2 lb bag               |             1 lb |               \$1.99 |            *\$1.00* |
  | Celery                 | 1 lb bag               |             ½ lb |               \$1.89 |            *\$0.95* |
  | Red onions             | 2 lb bag               |             1 lb |               \$2.19 |            *\$1.10* |
  | Cabbage                | 3 lb head              |           1.5 lb |               \$2.37 |            *\$1.19* |
  | Tomato paste           | 6 oz can               |            1 can |               \$0.86 |            *\$0.86* |
  | Garlic                 | 3-pack                 |         1/3 pack |               \$1.69 |            *\$0.56* |
  | Extra virgin olive oil | 17 fl oz bottle        |          4 fl oz |               \$7.25 |            *\$1.71* |
  | Canola oil             | 48 fl oz bottle        |          2 fl oz |               \$3.89 |            *\$0.16* |
  | Full-fat Greek yogurt  | 32 oz tub              |     64 oz needed |           \$2.79/tub |            *\$5.58* |
  | Cottage cheese         | 24 oz tub              |       entire tub |               \$2.85 |            *\$2.85* |
  | Sunflower kernels      | 16 oz bag              |  ~15.8 oz needed |               \$2.55 |            *\$2.55* |
  | MoserRoth chocolate    | 5-bar pack (25 g ea)   |           5 bars |               \$3.00 |            *\$3.00* |
  | Iodized salt           | 26 oz container        |      tiny amount |               \$0.79 |            *\$0.02* |
  | *Total*                |                        |                  |                      |           *\$22.63* |
]

= Daily
== Meals
#tablem[
  | Meal      | Meal part | Food                  | Weight | Calories | Carbs | Protein |  Fat | Fiber | Sat. fat | Mono fat | Poly fat |
  | --------- | --------- | --------------------- | -----: | -------: | ----: | ------: | ---: | ----: | -------: | -------: | -------: |
  | Breakfast | Part 1    | Full-fat Greek yogurt |  240 g |      220 |  10 g |    20 g | 12 g |   0 g |      7 g |      3 g |    0.5 g |
  | Breakfast | Part 2    | Sunflower kernels     |   64 g |      376 |  13 g |    14 g | 33 g |   6 g |      3 g |     10 g |     20 g |
  | Lunch     | Part 1    | Fasolada              |  450 g |     ~390 |  55 g |    11 g | 16 g |  13 g |      2 g |      9 g |      4 g |
  | Lunch     | Part 2    | Cottage cheese        |   68 g |       65 |   3 g |     7 g |  3 g |   0 g |      2 g |      1 g |      0 g |
  | Dinner    | Part 1    | Fasolada              |  450 g |     ~390 |  55 g |    11 g | 16 g |  13 g |      2 g |      9 g |      4 g |
  | Dinner    | Part 2    | Cottage cheese        |   68 g |       65 |   3 g |     7 g |  3 g |   0 g |      2 g |      1 g |      0 g |
  | Snack     | Part 1    | chocolate (5x/week)   |   25 g |      133 |  13 g |     2 g |  8 g |   2 g |      5 g |      3 g |      1 g |
]

== Nutrition (weekly average)
#tablem[
  | Nutrient            |  Daily amount |
  | ------------------- | ------------: |
  | Calories            | *~1,601 kcal* |
  | Protein             |       *~71 g* |
  | Carbohydrates       |      *~149 g* |
  | Fiber               |       *~33 g* |
  | Fat                 |       *~89 g* |
  | Saturated fat       |       *~22 g* |
  | Monounsaturated fat |       *~35 g* |
  | Polyunsaturated fat |       *~29 g* |
  | Omega-3 ALA         |    *~1.5–2 g* |
]
#tablem[
  | Micronutrient           |         Daily amount | % Daily Value (adult) | Main sources                      |
  | ----------------------- | -------------------: | --------------------: | --------------------------------- |
  | Calcium                 |            ~1,000 mg |              ~75–100% | yogurt, cottage cheese            |
  | Iron                    |               ~15 mg |                  ~80% | beans, sunflower seeds            |
  | Magnesium               |              ~600 mg |                 ~140% | beans, sunflower seeds            |
  | Potassium               |            ~4,300 mg |                  ~90% | beans, vegetables, yogurt         |
  | Zinc                    |               ~10 mg |                  ~90% | beans, seeds, dairy               |
  | Selenium                |             ~100 mcg |                 ~180% | beans, dairy, grains/seeds        |
  | Phosphorus              |            ~1,800 mg |                 ~140% | dairy, beans                      |
  | Copper                  |              ~1.5 mg |                 ~170% | beans, sunflower seeds, chocolate |
  | Manganese               |                ~5 mg |                 >200% | beans, seeds                      |
  | Sodium                  |      ~1,500–2,500 mg |              variable | iodized salt, cottage cheese      |
  | Folate                  |         ~600 mcg DFE |                 ~150% | beans, vegetables                 |
  | Vitamin A               | ~1,200–1,500 mcg RAE |                 >100% | carrots                           |
  | Vitamin C               |           ~70–100 mg |              ~80–110% | cabbage, tomato                   |
  | Vitamin E               |               ~30 mg |                 ~200% | sunflower seeds                   |
  | Vitamin K               |         ~150–250 mcg |                 >100% | cabbage                           |
  | Vitamin B1 (thiamin)    |              ~1.5 mg |                 >100% | beans, seeds                      |
  | Vitamin B2 (riboflavin) |                ~2 mg |                 >150% | yogurt, cottage cheese            |
  | Vitamin B3 (niacin)     |             ~8–10 mg |               ~50–60% | beans, seeds                      |
  | Vitamin B6              |              ~1.5 mg |                 >100% | beans, vegetables                 |
  | Vitamin B12             |             ~3–5 mcg |                 >100% | dairy                             |
  | Vitamin D               |             ~2–5 mcg diet + variable from sun | ~10–25% diet-only; sun exposure can close the gap on clear days | dairy (unless fortified); daily outdoor walk (highly variable — season/cloud cover/skin exposed) |
  | Choline                 |          ~150–250 mg |               ~30–45% | beans, dairy                      |
]

= Recipe
== Yogurt
- Eat with Sunflower Seeds and Honey

== Fasolada
+ Wash and soak white beans with salt at least 8 hours, and ideally overnight. Then drain and set aside. (Canned beans work in a pinch, but may be more expensive for the quantity)
+ Dice celery, carrots, and onion, and mince the garlic.
+ In a large pot, sautee the celery, carrots, onion, and garlic until translucent and fragrant.
+ Stir in tomato paste and beans. Cabbage is nontraditional, but bridges much of the nutrition gap and adds flavor, so I like to add it. Cover with water, adding at least an inch of water. Spices vary by region, as well as amount of water. Bay leaves and oregano are typical choices, although no spices are truly required. Salt can also be added at this stage, but I prefer it without. Adding an apple whole into the soup will also thicken it, but is not necessary.
+ Simmer for around 1 hour, or until the beans and vegetables become soft.
+ Enjoy!

