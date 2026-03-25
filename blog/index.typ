#import "../src/template/cv_template.typ": *
#import "../src/template/fields.typ": *


#show: cv.with(subpage: true, root: "../")

== Blog
=== Recipes
==== Meal
#blog(
  name: "Pizza",
  url: "food/pizza.html",
)
#blog(
  name: "Bread",
  url: "food/bread.html",
)
#blog(
  name: "Dubu Jorim (Braised Tofu)",
  url: "food/tofubanchan.html",
)
#blog(
  name: "Tomato Soup",
  url: "food/tomatosoup.html",
)
==== Pie
#blog(
  name: "Pie Fundamentals",
  url: "food/pie.html",
)

#blog(
  name: "Applesauce Pie",
  url: "food/applesaucepie.html",
)

#blog(
  name: "Custard Pecan Pie",
  url: "food/custardpecanpie.html",
)

#blog(
  name: "Savory Beet Pie",
  url: "food/beetpie.html",
)
==== Other
#blog(
  name: "Applesauce",
  url: "food/applesauce.html",
)

=== Travel
#blog(
  name: "Amtrak Rail Pass",
  url: "travel/train.html",
)

=== Other
#blog(
  name: "Kiting",
  url: "hobbies/kites.html",
)

#blog(
  name: "Sock Monkeys",
  url: "hobbies/sockmonkeys.html",
)

=== School
#blog(
  name: "Advice for PhD Applicants",
  url: "school/phdapplications.html",
)

=== File on Conscience
#blog(
  name: "Statement of Conscience",
  url: "letteronconscience/Iniyan Joseph statement of conscience.pdf",
)
