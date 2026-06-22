#import "../src/template/cv_template.typ": *
#import "../src/template/fields.typ": *


#show: cv.with(subpage: true, root: "../")

== Blog
#blog(
  name: "Meal Prep System",
  url: "food/mealprep.html",
)

#blog(
  name: "Applesauce Pie",
  url: "food/applesaucepie.html",
)

#blog(
  name: "Custard Pecan Pie",
  url: "food/custardpecanpie.html",
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
#blog(
  name: "South Texas",
  url: "travel/mcallencorpuschristi.html",
)

=== Hobbies
#blog(
  name: "Kiting",
  url: "hobbies/kites.html",
)

#blog(
  name: "Sock Monkeys",
  url: "hobbies/sockmonkeys.html",
)

=== Other
#blog(
  name: "Advice for PhD Applicants",
  url: "school/phdapplications.html",
)

=== File on Conscience
#blog(
  name: "Statement of Conscience",
  url: "letteronconscience/Iniyan Joseph statement of conscience.pdf",
)
