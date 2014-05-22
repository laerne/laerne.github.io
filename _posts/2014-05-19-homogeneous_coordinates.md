---
layout: post
title:  "Homogeneous coordinates"
date:   2014-05-19 19:00:00
categories: geometry_and_topology graphic_programming game_design
---

# Definition of the projective plane #

## Quaternions ##

Anyone who tried a little computer graphics must have come sometime and somehow to the notion of _quaternions_.
What is a quaternion ?  The set of quaternions can be view as a 4-dimensional [vector space][w:vector space] over the reals.
But a quaternion itself is a _number_, like is a real or an integer.
One can sum quaternions, negate them, multiply them or invert them and quaternions have an neutral element for both the sum and the product.

Summing quaternions is no surprise since a quaternion number is a also a 4-dimensional vector of real numbers and vector can be summed by definition.
More surprising is that quaternions have a product that is associative, has a neutral element and an inverse element for each quaternion but {{"0"|m}}.
This product has a lot of other nice properties, especially when combined with the sum.
Every graphic programmer knows it; quaternions allow to easily compute a lot of properties of points in 3D space, by using one single matrix product.

## Homogeneous coordinates ##

The niceness of quaternions happens to be a happenstance.
The mathematical concept of using 4-dimensional vectors to represent three dimensions is actually called _homogeneous coordinates_.
By cautiously choosing the axes of the four-dimensional quaternion vector space, the operation of quaternions can correspond to rotations, scalar product or other operators.

Unlike quaternions, homogeneous coordinates are not secluded to 4 dimensions.
This means that the framework of homogeneous coordinates, although less powerful, is more general than quaternions.
Homogeneous coordinates is the encoding of {{"n"|m}}--dimensional spaces using {{"n+1"|m}}--dimensional coordinates.
The coordinates are encoded such that the {%m n%} first values are the regular {%m n%}-dimensional vector values but the last value is a value that has to be divided to all previous values in the end.
For example {{"(-4,8,4,2)"|m}} represents the vector {{"(-2,4,2)"|m}}.
The power of this representation is its ability to handle infinity.
<!--- Homogeneous coordinates do not truly represent vector space, but some extensions with infinite value of; we shall explain it a bit later. --->

## An example ##

Let us take the special case of using 3D coordinates for representing a 2 space.
In this 3D vector space let us consider the plane that spans along the {%m x%} and {%m y%} direction, with a height of 1.
In the following image, it is the blue semi-transparent plane while the gray opaque plane is the plane {%m xy%}--plane that passes through the origin {%m (0,0,0)%}.
Why am I considering this plane ? Simple: dividing by 1 has no effect so the final 2D vector is obtained by dropping the last value.

![Image of an opaque xy-plane of z-value 0, a blue semi-transparent xy-plane of z-value 1 and a line going through the origin and cutting the blue semi-transparent plane a point p.](/public/img/homogeneous_coordinates_in_2D.png)

Let {%m v%} be some {%m 3%}--dimensional vector.
In the above image the {%m 4%}--dimensional coordinate that represents {%m v%} are the points forming the dashed yellow line.
{%m p%} is the one such that the last value is {%m 1%}.
So basically all points of the yellow line represents the same {%m 3%}--dimensional point.
We could say that the {%m 4%}--dimensional line _is_ the {%m 3%}--dimensional point.

Now what happens if the last value is {%m 0%}?
Dividing by {%m 0%} is forbidden so we actually have new types of point.
Such a {%m 4%}--dimensional point represents a {%m 2%}--dimensional point that doesn't really exists and we shall call it a _point at infinity_.
Should some of these points represent the same points? Yes, let me show you how.

Let's take two points from from the yellow dashed line, {%m q = (q_x,q_y,q_z,q_w)%} and {%m q' = (q'_x,q'_y,q'_z,q'_w)%}.
Both of these point correspond to the point {%m p%} so that the following formula holds~:

{%math p = (\frac{q_x}{q_w},\frac{q_y}{q_w},\frac{q_z}{q_w},1) = (\frac{q'_x}{q'_w},\frac{q'_y}{q'_w},\frac{q'_z}{q'_w},1)%}

Thus,

{%math q' = \frac{q'_w}{q_w} q %}

In the end any points {%m q%} and {%m q'%} such that there is some real number {%m \lambda%} such that {%m q' = \lambda \cdot q %} are the homogeneous coordinate of the same point.
We should not behave differently with points at infinity.  If there is some real number such that multiplying one point by this value gives the other, those points represents the same point at infinity.
Since such points always lies on a same line going through the origin {%m (0,0,0)%}, there is as many point at infinity as there is line going through the origin but parallel to the blue semi-transparent plane.

The space obtained by using all the {%m 3%}--dimensional points defined by {%m 4%}--dimensional lines, including the points at infinity, is called the _projective plane.
The name comes by viewing the origin as the focal point of a camera and the blue semi-transparent plane as its screen.

[2D]: two dimensional
[3D]: three dimensional
[w:vector space]: https://en.wikipedia.org/wiki/Vector_space  


