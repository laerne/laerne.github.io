---
layout: post
title:  "Closed manifolds"
date:   2014-05-23 19:00:00
categories: geometry_and_topology game_design
---

This article is about non-standard continuous game spaces.
In this article I introduce the notion of a _closed manifold_ and how it allows to design a finite space while avoiding to have a boundary to a world.
I also extensively introduce the projective plane, a non-oriented closed manifold.
This article is not finished yet, but I post the first part now because it might be quite thick to read at once.

# Continuous game spaces #

When designing spaces with videos games we have to cope with the world boundaries, the end of the play space.
Several solutions have been used to design a continuous play space.

* Mark boundaries with walls,
* Generate procedurally an infinite world,
* Work over a closed manifold.

The former solution can be easily added with invisible walls.
But invisible walls are frustrating as it bluntly tells it removed a freedom from the player.
Smarter walls can be design to match natural features of the world, like a big fire, a thick formation of people or a cliff.
These are used extensively in many games.
The drawback is that they require a vast amount of work and a lot of imagination.
It is no surprise that walls are more use in AAA games than any other type of game: those studios have a staff large enough to afford it.

The second solution, using procedural generators, sounds like a recent innovation.  But it is not.
I'm of course speaking about randomly generated dungeons in dungeon-crawler game genre, but not only.
This is also the solution behind many games happening on an island like "The Elder Scrolls III: Morrowind" or "GTA: Vice City".
In those games the playground is bounded by the coastline of the island (or a little further) but this boundary is not a wall: you can cross it.
When you cross the boundary you wander in procedurally generated ocean that extends to the infinity.
The procedure is unsophisticated but effective~: you don't wander off the island because you are forbidden to, but because there is nothing to see there.

Of course the second solution can be used to generate meaningful content, like it does in "Minecraft".
This is also tricky and requires a lot of tweaking and testing, but possibly less repetitive work for the designer.
However beware that what repetitiveness the designer escapes may fall back on the player without some caution.
Indeed a random generator that spawns always different but very similar situations is likely to give a single experience over the player.

The last solution is the least common.
It consists of using non-natural spaces that do not have any boundary, yet are not infinite in the sense that there is a bound of the distance any two points can have together.
This last properties implies that such space do have a finite area in 2D or a finite volume in 3D.
The surface of a ball, a _sphere_, is such an example.
The surface of a doughnut, a _torus_, is another.
Such a space is called a _closed manifold_.
In the 2D case, they are also called a _closed surface_.

# Oriented surfaces #
What types of closed surfaces exist?
It turns out that mathematicians classified closed manifolds, up to reversible deformations.
In the 2D case it is pretty straightforward.
There is the sphere, over which you can dig a hole and have a torus which in turn you can dig another hole and have a torus with two holes, or 2-torus, and so on.

![Image of a torus with two holes, a standard torus and a sphere.](/public/images/orientable_surfaces.png)

The torus is the most common closed surface used in videos games.
Indeed consider the simple 2D world that is made of square and that repeat itself when you reach the boundary of a square, like in the image where each square are copies one of each other.

![Image of the polygonal representation of a torus](/public/images/clones_S1xS1.svg)

One copy of the box looks like the rectangle below[^stretching].

![Image of the polygonal representation of a torus](/public/images/polygon_S1xS1.svg)

A side with an arrow is to be glued with the side with the same arrow, keeping the arrows with the same orientation.
Gluing sides is equivalent to say "when you go through this side, you go out through this other side".
In the above rectangle, gluing the two horizontal gives a tube.
The two circular extremities of the tube have to be glued, which gives a torus.

![Image of the rectangle folded almost like a torus](/public/images/unfinished_torus.png)






#Non-oriented surfaces#

The sphere and the tori are nice surfaces but they are not all possible 2D surfaces.
There are also the _non-oriented_ surfaces.
Oriented surfaces are surfaces such that you can paint one side of the surface in blue and the other in orange without having a boundary between blue and orange paint.
A non-oriented surface is a surface that hasn't this property.
If you start painting one side in blue and proceed to paint the whole side, you will eventually paint both sides of each point.
The typical example of a non-oriented surface is the _Mœbius Strip_, below.

![Image of a Mœbius strip](/public/images/moebius.png)

This surface has a boundary, so it is not closed.
However we can extend it into a closed surface.
Notice how the Mœbius strip has only one circular line for boundary.
You can see it by following the boundary of the picture above.
This is also deducible from the fact that the surface is not orientable.
If you travel along the middle of strip and keep track of where the right border is, after some trip you will go back to the same point, but on the other side of the strip.
There the left side and the right side will be inversed.  Therefore you right side joined the left side.

Now there is a famous surface that also has a single circle as its boundary: I am of course speaking of the _disk_.
So you can theoretically glue the disk with the Mœbius strip along their circular border.
Don't try to do this with paper strips at home: I has been mathematically proven it is impossible to do within a 3D space.
But it is theorically possible to do.

Actually we do not really care to embed the Mœbius in a 3D space.
We're interested to designing our 2D world space.
So like the torus, let us use a polygonal representation of the projective plane so that by folding sides, it is the surface.
First let's start with the polygonal representation of a Mœbius strip.
Side without arrows must not be glued yet: they are the boundary of the Mœbius strip.

![Image of the polygonal representation of a Mœbius strip](/public/images/polygon_moebius.svg)

Now, to have a projective plane, we must join add a simple disk on top of it.
The disk does not do really anything except gluing the two sides that were the boundary of the Mœbius strip.
We obtain the following polygonal representation.

![Image of the polygonal representation of a projective plane](/public/images/polygon_RP2.svg)

The resultant game space would be the following.

![Image of the polygonal representation of a torus](/public/images/clones_RP2.svg)

Notice an issue with this representation: arrow of the same side are pointing to (or away) from each other.
It means that when reaching the corner of the polygon you will actually see the world mirroring itself horizontally and vertically.
This is not desirable.

I will speak of a workaround for this issue in a later post, with something called an _atlas_.
Actually this is all for now I believe the subject can already difficult enough to understand if you have notion in mathematical topology.
Besides it is sure long enough to write!
 

[^stretching]: Stretching horizontally is a reversible deformation, so it doesn't really matter we had a square and now we have a rectangle.


