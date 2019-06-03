---
layout: page
title: Version Control with Mercurial
---
Version control is the lab notebook of the digital world:
it's what software developers use to keep track of what they've done and to collaborate with other people.
Every large software development project relies on it,
and most programmers use it for their small jobs as well.
And it isn't just for software:
instructional materials (like this),
papers,
theses,
small data sets,
and anything that changes over time or needs to be shared can and should be stored in a version control system.

Version control is better than emailing files back and forth because:

*   Nothing that is committed to version control is ever lost.
    This means it can be used like the "undo" feature in an editor,
    and since all old versions of files are saved it's always possible to go back in time to see exactly who wrote what on a particular day,
    or what version of a program was used to generate a particular set of results.
*   It keeps a record of who made what changes when,
    so that if people have questions later on they know who to ask.
*   With version control it is hard (but not impossible) to accidentally overlook or overwrite someone's changes:
    the version control system automatically notifies users whenever there's a conflict between one person's work and another's.

This workshop shows how to use a popular open source version control system called [Mercurial][mercurial] (also known as `hg`).
It is widely used,
both because it's easy to set up,
and because of a hosting site called [Bitbucket](https://bitbucket.org).
No matter which version control system you use,
the most important thing to learn is not the details of their more obscure commands,
but the workflow that they encourage.

[mercurial]: https://www.mercurial-scm.org/


> ## Getting Ready {.getready}
>
> Follow the [setup instructions](00-setup.html) to install [Mercurial][mercurial] or [TortoiseHg](https://tortoisehg.bitbucket.io/) on your laptop.


## Topics

### The Basics
0. [Setup Instructions](00-setup.html)
1. [Intro Slides](intro-slides.pdf)
1. [Configuring Mercurial](01-configuration.html)


Some of the instructional material in this workshop is based on the [Software Carpentry][swc] lesson that introduces [Version Control with Mercurial](https://swcarpentry.github.io/hg-novice/).
The design of the web pages is also adapted from an iteration of the [Software Carpentry][swc] lessons pages.

[swc]: https://software-carpentry.org/
