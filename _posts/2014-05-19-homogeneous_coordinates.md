---
layout: post
title:  "Homogeneous coordinates"
date:   2014-05-19 19:00:00
categories: geometry_and_topology
---

In this article I introduce the concept of homogeneous coordinates.
Homogeneous is an important tool in computer graphics, to project points from 3D space to screen coordinates.
It is also the basis to defined the _projective plane_ a curious surface with many interesting properties.

## Quaternions ##

Anyone who tried a little computer graphics must have come sometime and somehow to the notion of _quaternions_.
What is a quaternion ?  The set of quaternions can be view as a 4-dimensional [vector space][w:vector space] over the reals.
But a quaternion itself is a _number_, like is a real or an integer.
One can sum quaternions, negate them, multiply them or invert them and quaternions have an neutral element for both the sum and the product.

Summing quaternions is no surprise since a quaternion number is a also a 4-dimensional vector of real numbers and vector can be summed by definition.
More surprising is that quaternions have a product that is associative, has a neutral element and an inverse element for each quaternion but \\(0\\).
This product has a lot of other nice properties, especially when combined with the sum.
Every graphic programmer knows it; quaternions allow to easily compute a lot of properties of points in 3D space, by using one single matrix product.

## Homogeneous coordinates ##

The niceness of quaternions happens to be a happenstance.
The mathematical concept of using 4-dimensional vectors to represent three dimensions is actually called _homogeneous coordinates_.
By cautiously choosing the axes of the four-dimensional quaternion vector space, the operation of quaternions can correspond to rotations, scalar product or other operators.

Unlike quaternions, homogeneous coordinates are not secluded to 4 dimensions.
This means that the framework of homogeneous coordinates, although less powerful, is more general than quaternions.
Homogeneous coordinates is the encoding of \\(n\\)--dimensional spaces using \\(n+1\\)--dimensional coordinates.
The coordinates are encoded such that the \\( n\\) first values are the regular \\( n\\)-dimensional vector values but the last value is a value that has to be divided to all previous values in the end.
For example \\((-4,8,4,2)\\) represents the vector \\((-2,4,2)\\).
The power of this representation is its ability to handle infinity, when that last value is \\(0\\).

## An example ##

Let us take the special case of using 3D coordinates for representing a 2 space.
In this 3D vector space let us consider the plane that spans along the \\( x\\) and \\( y\\) direction, with a height of 1.
In the following image, it is the blue semi-transparent plane while the gray opaque plane is the plane \\( xy\\)--plane that passes through the origin \\( (0,0,0)\\).
Why am I considering this plane ? Simple: dividing by 1 has no effect so the final 2D vector is obtained by dropping the last value.

![Image of an opaque xy-plane of z-value 0, a blue semi-transparent xy-plane of z-value 1 and a line going through the origin and cutting the blue semi-transparent plane a point p.](/public/images/homogeneous_coordinates_in_2D.png)

Let \\( v\\) be some \\( 3\\)--dimensional vector.
In the above image the \\( 4\\)--dimensional coordinate that represents \\( v\\) are the points forming the dashed yellow line.
\\( p\\) is the one such that the last value is \\( 1\\).
So basically all points of the yellow line represents the same \\( 3\\)--dimensional point.
We could say that the \\( 4\\)--dimensional line _is_ the \\( 3\\)--dimensional point.

Now what happens if the last value is \\( 0\\)?
Dividing by \\( 0\\) is forbidden so we actually have new types of point.
Such a \\( 4\\)--dimensional point represents a \\( 2\\)--dimensional point that doesn't really exists and we shall call it a _point at infinity_.
Should some of these points represent the same points? Yes, let me show you how.

Let's take two points from from the yellow dashed line, \\( q = (q_x,q_y,q_z,q_w)\\) and \\( q' = (q'_x,q'_y,q'_z,q'_w)\\).
Both of these point correspond to the point \\( p\\) so that the following formula holds~:

\\[ p = (\frac{q_x}{q_w},\frac{q_y}{q_w},\frac{q_z}{q_w},1) = (\frac{q'_x}{q'_w},\frac{q'_y}{q'_w},\frac{q'_z}{q'_w},1)\\]

Thus,

\\[ q' = \frac{q'_w}{q_w} q \\]

In the end any points \\( q\\) and \\( q'\\) such that there is some real number \\( \lambda\\) such that \\( q' = \lambda \cdot q \\) are the homogeneous coordinate of the same point.
We should not behave differently with points at infinity.  If there is some real number such that multiplying one point by this value gives the other, those points represents the same point at infinity.
Since such points always lies on a same line going through the origin \\( (0,0,0)\\), there is as many point at infinity as there is line going through the origin but parallel to the blue semi-transparent plane.

The space obtained by using all the \\( 2\\)--dimensional points defined by \\( 3\\)--dimensional lines, including the points at infinity, is called the _projective plane_.
The name comes by viewing the origin as the focal point of a camera and the blue semi-transparent plane as its screen.

[2D]: two dimensional
[3D]: three dimensional
[w:vector space]: https://en.wikipedia.org/wiki/Vector_space  
