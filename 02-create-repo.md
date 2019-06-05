---
layout: page
title: Version Control with Mercurial
subtitle: Creating a Repository
---
> ## Learning Objective {.objectives}
>
> * Explain how to initialize a new Mercurial repository.

We'll start by exploring how version control can be used to keep track of what one person did and when.
We're going to pretend to be a researcher named Susan who wants to start running the Salish Sea NEMO ocean model as a daily forecast system.
If the example in the next few sections seems contrived,
be assured that it is only slightly so to avoid having to do too much typing.
Lots of projects
(and therefore version control repositories)
start with a single text file in which someone writes down some initial ideas.
The repository for this workshop started with a file called [plan.rst](https://bitbucket.org/43ravens/meopar-2019-06-11/src/tip/README.rst).

Now that we have Mercurial [configured](01-configuration.html),
we can start using.
Let's create a directory for Susan's NEMO forecast project:

~~~ {.bash}
$ cd ~/Desktop/
$ hg init forecast
~~~

The `hg init forecast` command tells Mercurial to create a directory (folder) call `forecast` and to make it a **repository**
--- a place where Mercurial can store our files *and* information about the changes that we make to them.

In TortoiseHg,
use `File > New Repository`,
browse to the directory (folder) where you want to create your repository,
and type the repository name as the last element in the `Destination path:` box,
uncheck the `Create special files (.hgignore, ...)` checkbox,
then click the `Create` button.

Mercurial commands are written `hg verb`,
where `verb` is what we actually want it to do.

If we use `ls` to show the directory's contents,
it appears that nothing has changed:

~~~ {.bash}
$ ls
~~~

But if we add the `-a` flag to show everything,
we can see that Mercurial has created a hidden directory called `.hg`:

~~~ {.bash}
$ ls -a
~~~
~~~ {.output}
. ..  .hg
~~~

Mercurial stores information about the project in this special sub-directory.
If we ever delete it,
we will lose the project's history.

We can check that everything is set up correctly
by asking Mercurial to verify the structure of our repository:

~~~ {.bash}
$ hg verify
~~~
~~~ {.output}
checking changesets
checking manifests
crosschecking files in changesets and manifests
checking files
0 files, 0 changesets, 0 total revisions
~~~


> ## Learning Objective {.objectives}
>
> * Explain how to initialize a new Mercurial repository.
