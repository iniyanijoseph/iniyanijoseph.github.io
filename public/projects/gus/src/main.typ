#import "@preview/touying:0.6.0": *
#import themes.simple: *
#import "@preview/diagraph:0.3.1":*

#show: simple-theme.with(
  aspect-ratio: "16-9",

  config-info(
    title: [Gus The Goose],
    subtitle: [Subtitle],
    author: [Iniyan Joseph],
    date: datetime.today(),
    institution: [Institution],
    logo: emoji.duck,
  ),
)

#let space(x : int) = {for i in range(x) {math.space}} 
= Gus the Goose

#set page(background: image("P1.Base.png", height:45%), fill: rgb("5FEFE3"))
Gus the Goose went out to play

Out with friends one sunny day

#align(bottom + right)[
How many? You may wish to ask?

The *set* of friends with whom Gus basked?]

#footnote[A set is a collection of objects]

#set page(background: image("P2.png", height:45%), fill: rgb("5FEFE3"))
He began to count them $abs((1, 2, 3))$ 

And found the *cardinality*!

#set page(background: image("P3.Base.png", height:80%), fill: rgb("5FB3EF"))
The next day new friends came to play

#space(x: 24)
And some friends had to go away

#set page(background: image("P4.Base.png", height:53%), fill: rgb("5FB3EF"))
This gave a new set: {2, 3, 4}

Looks like Gus has friends galore!

#set page(background: image("P4.Base.png", height:53%), fill: rgb("A36DB9"))
The first day, we called friends "$A$"

The next day Gus played with friends called "$J$"

#set page(background: image("P5.Base.png", height:33%), fill: rgb("EAA36DB9"))
What are these two sets put together?

The *union* of these friends forever?

#set page(background: image("P6.Base.png", height:174%), fill: rgb("EAA36DB9"))
We get set $K$ with all of them!

For Gus, the games have just begun. 

What about the geese who stayed?

The *intersection* of both days?

We get {2, 3} as you can see,

Its got "2" cardinality!

Just be careful about amounts

The things in both may double count

Soon the geese began to play

Dodgeball would make it a great day!

Lets make teams, two sets, $P$ and $T$

Each one a *subset* of the big group $G$

After they recorded the game

The 

This *relation* between them shows us the game

Who hit who and who stayed the same

A relation like this is also a set

The *cartesian product* is the biggest one yet

After the question, losing team had their doubts

When in the game did each person get out? 

They made a *relation* of each person and times

To find when each person had gone behind. 

Each person could only have once been outed

So there is only one pair (player, time) per player who pouted

Because at the end, every player was outed

This *function* took inputs and then outputted

The time that each goose got knocked out

So that they could see without a doubt

That they had lost and the others had won

But that's OK, they had lots of fun!

Gus was happy

He had had a great day

Gus the goose was scarcely known

To quickly find the way back home

He took a left and then two rights

And found himself in dead of night

Without a path to get back home

So sat down and began to groan

A stranger heard this passing by

"Hello there goose, why do you cry? "

Gus explained his situation

And asked the person for directions

The stranger said "fear not, don't fret"

"The way back home is not lost yet"

He began to draw a graph of roads

And paths between the many nodes

"Now in the graph there is a way"

"For you to get back home today"

Gus travelled quickly to and fro

And just as soon as you could know

He made it back to his own house

Very quickly, as if a mouse

Gus decided to be more wary

That night was simply much too scary

He took some edges from the graph

So each pair had a unique path

This

// #set page(background: none, fill: rgb("5FB3EF"))
// When he woke up, refreshed the very next morning
// 
// He wondered and wondered what to do with these?
// 
// #set page(background: none, fill: rgb("5FB3EF"))
// He knew that the graphs had different properties
// 
// But how could he know, and be sure as could be?
// 
// 
// #set page(background: none, fill: rgb("5FB3EF"))
// "I can argue directly '$A$ leads to $B$'
// 
// But it may not be easy, its clear to see"
// 
// #set page(background: none, fill: rgb("5FB3EF"))
// What if I went through another direction?
// 
// I start with the opposite and find a contradiction?
// 
// #set page(background: none, fill: rgb("5FB3EF"))
// That means that the opposite cannot be true
// 
// So the statement is done, and we know, woo-hoo!
// = Exercises
// 
// //#pdf.embed("citations.typ")
