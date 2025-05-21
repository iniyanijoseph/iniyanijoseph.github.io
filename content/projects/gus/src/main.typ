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

#set page(background: image("P2.png", height:45%), fill: rgb("5FEFE3"))
He began to count them $abs((1, 2, 3))$ 

And found out the *cardinality*!

#set page(background: image("P3.Base.png", height:80%), fill: rgb("5FB3EF"))
Tomorrow new friends came to play

#space(x: 24)
And some friends had to go away

#set page(background: image("P4.Base.png", height:53%), fill: rgb("5FB3EF"))
This gave a new set: {2, 3, 4}

Looks like Gus has friends galore!

#set page(background: image("P4.Base.png", height:53%), fill: rgb("A36DB9"))
Yesterday, we called friends "$A$"

Today Gus plays with friends called "$J$"

#set page(background: image("P5.Base.png", height:33%), fill: rgb("EAA36DB9"))
What are these two sets put together?

The *union* of these friends forever?

#set page(background: image("P6.Base.png", height:174%), fill: rgb("EAA36DB9"))
We get set $K$ with all of them!

For Gus, the games have just begun. 
//{1, 2, 3, 4}

#set page(background: none, fill: rgb("5FB3EF"))
What about the geese who stayed?

The *intersection* of both days?
// Intersect symbol over the the overlapping geese in gu
#set page(background: none, fill: rgb("5FB3EF"))
We get {2, 3} as you can see,

Its got "2" cardinality!

#set page(background: none, fill: rgb("5FB3EF"))
Just be careful 'bout the count, 

The sum of both may be large amounts!

#set page(background: none, fill: rgb("5FB3EF"))
Soon the geese began to play

Dodgeball would make it a great day!

#set page(background: none, fill: rgb("5FB3EF"))
Lets make teams, two sets, $P$ and $T$

Each one a *subset* of the big group $G$

#set page(background: none, fill: rgb("5FB3EF"))
After they recorded the game

The 

#set page(background: none, fill: rgb("5FB3EF"))
This *relation* between them shows us the game

Who hit who and who stayed the same

#set page(background: none, fill: rgb("5FB3EF"))
A relation like this is also a set

The *cartesian product* is the biggest one yet

#set page(background: none, fill: rgb("5FB3EF"))
After the question, losing team had their doubts

When in the game did each person get out? 

#set page(background: none, fill: rgb("5FB3EF"))
They made a *relation* of each person and times

To find when each person had gone behind. 

#set page(background: none, fill: rgb("5FB3EF"))
Each person could only have once been outed

So there is only one pair (player, time) per player who pouted

#set page(background: none, fill: rgb("5FB3EF"))
Because at the end, every player was outed

This *function* took inputs and then outputted

#set page(background: none, fill: rgb("5FB3EF"))
The time that each goose got knocked out

So that they could see without a doubt

#set page(background: none, fill: rgb("5FB3EF"))
That they had lost and the others had won

But that's OK, they had lots of fun!

#set page(background: none, fill: rgb("5FB3EF"))
Gus was happy

He had had a great day

#set page(background: none, fill: rgb("5FB3EF"))
He wanted to go home 

but couldn't find a way

#set page(background: none, fill: rgb("5FB3EF"))
He needed to get from house to house

But he wanted to travel, as quick as a mouse

#set page(background: none, fill: rgb("5FB3EF"))
He had a list of all the streets

A relation on all the places to eat!

#set page(background: none, fill: rgb("5FB3EF"))
This *graph* he drew as quickly as he could

Carving a tangle of *vertices* and *edges* on wood

#set page(background: none, fill: rgb("5FB3EF"))
How could he get from house $A$ to house $Z$?

Could he make unique paths for each pair $(c, d)$?

#set page(background: none, fill: rgb("5FB3EF"))
Once he made it back home he had an idea

How could he connect all the houses together?

#set page(background: none, fill: rgb("5FB3EF"))
He didn't want to have to become absentee

So the new acyclic graph he called it a tree!

#set page(background: none, fill: rgb("5FB3EF"))
Gus was exhausted, but had had a great day

He went back to bed, and drifted away

#set page(background: none, fill: rgb("5FB3EF"))
When he woke up, refreshed the very next morning

He wondered and wondered what to do with these?

#set page(background: none, fill: rgb("5FB3EF"))
He knew that the graphs had different properties

But how could he know, and be sure as could be?


#set page(background: none, fill: rgb("5FB3EF"))
"I can argue directly '$A$ leads to $B$'

But it may not be easy, its clear to see"

#set page(background: none, fill: rgb("5FB3EF"))
What if I went through another direction?

I start with the opposite and find a contradiction?

#set page(background: none, fill: rgb("5FB3EF"))
That means that the opposite cannot be true

So the statement is done, and we know, woo-hoo!
= Exercises

//#pdf.embed("citations.typ")
