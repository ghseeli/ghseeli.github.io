---
layout: post
title: "An Introduction to Graph Theory"
date: 2019-03-12
---

In this post, I would like to introduce some mathematics rarely taught in primary school even though it is incredibly useful and the basics are easier to understand than many mathematical students are expected to learn. In 1736, the famous mathematician Leonhard Euler posed a seemingly simple problem: is there a walk through the city of Konigsburg that only crosses each of the seven bridges once? Of course, you may want to see a map of the city.

![Map of Seven Bridges of Konigsberg](/img/wiki-1280px-7_bridges.svg.png) Image used under [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/) from [Wikipedia](https://commons.wikimedia.org/w/index.php?curid=990540)

If you try a few different routes, you may feel like this problem is impossible, but might have a hard time explaining *why* if you have not seen problems like this before. Euler had a similar problem because, up to that point, no math had been developed to address these kind of problems. Thus, Euler developed the origins of *graph theory*, a branch of math used to analyze connections between objects. 

In graph theory, there are two fundamental objects: vertices and edges between vertices. For example, we can encode the seven bridges of Konigsburg where there is a vertex for each land mass and an edge for each bridge. In this way, we are building an abstract model that has only the essential information we need to solve the problem.