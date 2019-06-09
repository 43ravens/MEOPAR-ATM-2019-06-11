---
layout: page
title: Version Control with Mercurial
subtitle: Recovering Old Versions
---
> ## Learning Objectives {.objectives}
>
> * Restore older versions of files.
> * Jump to different revisions of a repository.
> * Tag a repository revision with a memorable name.

All right:
we can save changes to files and see what we've changed --- how can we restore older versions of things?
Let's suppose we accidentally overwrite Salish Sea NEMO forecast planning file with our grocery list:

~~~ {.bash}
$ nano plan.txt
$ cat plan.txt
~~~
~~~ {.output}
Ricotta
Mushroom Tortellini
Bacon
~~~

`hg status` now tells us that the file has been changed,
but those changes haven't been committed:

~~~ {.bash}
$ hg status
~~~
~~~ {.output}
M plan.txt
~~~

Let's investigate what changed with `hg diff`:

~~~ {.bash}
$ hg diff
~~~
~~~ {.output}
diff -r 77d20ec178e3 plan.txt
--- a/plan.txt  Wed Jun 05 16:52:52 2019 -0700
+++ b/plan.txt  Fri Jun 07 15:09:42 2019 -0700
@@ -1,4 +1,4 @@
-Goal: Run NEMO every day to forecast storm surge water levels
+Ricotta
+Mushroom Tortellini
+Bacon

-Need daily high resolution weather forecing from ECCC
-Also need daily average Fraser River flow from ECCC
~~~

Hmmmm...

We can put things back the way they were by using `hg revert`:

~~~ {.bash}
$ hg revert plan.txt
$ cat plan.txt
~~~
~~~ {.output}
Goal: Run NEMO everyday to forecast storm surge water levels

Need daily high resolution weather forcing from EC.
Also need daily average Fraser River flow from EC.
~~~

In TortoiseHg,
right click on the `plan.txt` file in the file list,
and select `Revert...` from the pop-up menu.

As you might guess from its name,
`hg revert` reverts to (i.e. restores) an old version of a file.
In this case,
we're telling Mercurial that we want to recover the last committed version of the file.
If we want to go back even further,
we can use the `--rev` or `-r` flag and a revision number instead:

~~~ {.bash}
$ hg revert --rev 0 plan.txt
~~~

Mercurial really doesn't want to cause us to lose our work,
so it defaults to making a backup when we use `hg revert`:

~~~ {.bash}
$ hg status
~~~
~~~ {.output}
? plan.txt.orig
~~~

The `plan.txt.orig` file is a copy of `plan.txt` as it stood before the `hg revert` command.
It's not tracked by Mercurial.
It's just there in case we made a mistake and really didn't want to revert,
or in case there's some content from before the revert that we decide that we really do want to copy into `plan.txt`.
When we're sure that we don't need `*.orig` files we can just go ahead and delete them.
If we really don't want Mercurial to create `*.orig` files when we use `hg revert`,
we can use the `--no-backup` option,
or its short version `-C`.

The fact that files can be reverted one by one tends to change the way people organize their work.
If everything is in one large document,
it's hard (but not impossible) to undo changes to the introduction without also undoing changes made later to the conclusion.
If the introduction and conclusion are stored in separate files,
on the other hand,
moving backward and forward in time becomes much easier.

Reverting is useful to recover from editing accidents in uncommitted files,
or to get back to an earlier state of a file to move forward with different content.
But sometimes it is useful to move a whole repository backward for forward in time:

* You have some code that you discover has a bug in it.
  One debugging technique is to go back in time to a commit where you can show that the bug hasn't yet been introduced,
  then move forward,
  one commit at a time,
  testing each one to see when the bug appears.

* You send a draft of a paper containing some analysis results to a colleague who is on vacation.
  You continue working on your analysis code,
  making commits as you go.
  When your colleauge returns from vacation and asks questions about the analysis you want to go have to the version of the code that produced the results in the draft that you send to them.

`hg update` can handle use cases like those for us.

In TortoiseHg,
right click on the revision that you want to update to
(let's choose revision 1),
and select `Update...` from the pop-up menu,
then click the `Update` button.

At the command-line,
we can get a view of the repository history with a graph on the side like TortoiseHg has with:

~~~ {.bash}
$ hg log --graph
~~~
~~~ {.output}
@  changeset:   2:77d20ec178e3
|  tag:         tip
|  user:        Susan Allen <sallen@eoas.ubc.ca>
|  date:        Wed Jun 05 16:52:52 2019 -0700
|  summary:     Add note about data source for Fraser River flow forcing
|
o  changeset:   1:8b3c15d3bf0f
|  user:        Susan Allen <sallen@eoas.ubc.ca>
|  date:        Wed Jun 05 16:42:43 2019 -0700
|  summary:     Add note about source for atmospheric forcing
|
o  changeset:   0:823fd5e1b20f
   user:        Susan Allen <sallen@eoas.ubc.ca>
   date:        Wed Jun 05 14:17:06 2019 -0700
   summary:     Start planning the daily NEMO forecast system
~~~

The short form for `--graph` is `-G`.
The `@` in the graph shows the revision that our working copy is at.
We can `update` to revision 1 and check where we are with:

~~~ {.bash}
$ hg update -r 1
$ hg log -G
~~~
~~~ {.output}
o  changeset:   2:77d20ec178e3
|  tag:         tip
|  user:        Susan Allen <sallen@eoas.ubc.ca>
|  date:        Wed Jun 05 16:52:52 2019 -0700
|  summary:     Add note about data source for Fraser River flow forcing
|
@  changeset:   1:8b3c15d3bf0f
|  user:        Susan Allen <sallen@eoas.ubc.ca>
|  date:        Wed Jun 05 16:42:43 2019 -0700
|  summary:     Add note about source for atmospheric forcing
|
o  changeset:   0:823fd5e1b20f
   user:        Susan Allen <sallen@eoas.ubc.ca>
   date:        Wed Jun 05 14:17:06 2019 -0700
   summary:     Start planning the daily NEMO forecast system
~~~

Confirm that the contents of `plan.txt` have been changed to what they were at changeset 1 by examining the file:

~~~ {.bash}
$ cat plan.txt
~~~
~~~ {.output}
Goal: Run NEMO everyday to forecast storm surge water levels

Need daily high resolution weather forcing from ECCC
~~~

When you are finished doing whatever you need to do with the past repository state,
return to the present with `hg update -r tip`.
If you make commits while you are udpated to a past repository state you will create a branch.
Branches are an advanced topic that we don't have time to cover today.
You can read about them in [Mercurial: The Definitive Guide](http://hgbook.red-bean.com/).

To make it easier to know that particular changesets are important milestones you can use `hg tag` to give them memorable names.
It is very common to to tag the changesets for each release of software packages that way.
You could also use it to tag the changesets of your model and analysis repositories that you used when you submitted a paper so that they are easy to get back to when you get the reviews back.

At the command-line:

~~~ {.bash}
$ hg tag -r 1 Allen2019-JPO-submit -m"Tag analysis when Allen (2019) was submitted to JPO"
$ hg log
~~~
~~~{.output}
changeset:   3:e081bcf625dc
tag:         tip
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Fri Jun 07 16:06:00 2019 -0700
summary:     Tag analysis when Allen (2019) was submitted to JPO

changeset:   2:77d20ec178e3
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 16:52:52 2019 -0700
summary:     Add note about data source for Fraser River flow forcing

changeset:   1:8b3c15d3bf0f
tag:         Allen2019-JPO-submit
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 16:42:43 2019 -0700
summary:     Add note about source for atmospheric forcing

changeset:   0:823fd5e1b20f
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 14:17:06 2019 -0700
summary:     Start planning the daily NEMO forecast system
~~~

You can see that revision 1 now has the tag `Allen2019-JPO-submit` and that there is a commit message recording the fact that we added a tag.

In TortoiseHg,
right-click on the changeset that you want to tag and choose `Tag...` from the pop-up menu.
In the `Tag` dialog,
type the tag text (`Allen2019-JPO-submit`) into the `Tag:` text box.
Expand the `Options` part of the dialog,
selct the `Use custom commit message:` option,
and type your commit message into the text box.
Finally,
click the `Add` button.

To see the list of tags in a repository and the revisions that they refer to use:

~~~ {.bash}
$ hg tags
~~~
~~~ {.output}
tip                                3:e081bcf625dc
Allen2019-JPO-submit               1:8b3c15d3bf0f
~~~

> ## Learning Objectives {.objectives}
>
> * Restore older versions of files.
> * Jump to different revisions of a repository.
> * Tag a repository revision with a memorable name.
