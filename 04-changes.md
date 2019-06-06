---
layout: page
title: Version Control with Mercurial
subtitle: Making Changes
---
> ## Learning Objectives {.objectives}
>
> * Display the uncommitted changes that have been made to tracked files.
> * Go through the modify-commit cycle for single and multiple files.

Now suppose Susan adds more notes to the file.
(Again, we'll edit with `nano` and then `cat` the file to show its contents;
you may use a different editor, and don't need to `cat`.)

~~~ {.bash}
$ nano plan.txt
$ cat plan.txt
~~~
~~~ {.output}
Goal: Run NEMO everyday to forecast storm surge water levels

Need daily high resolution weather forcing from ECCC
~~~

When we run `hg status` or refresh the file list in TortoiseHg now,
it tells us that a file it already knows about has been modified:

~~~ {.bash}
$ hg status
~~~
~~~ {.output}
M plan.txt
~~~

The `M` at the beginning of the line means that Mercurial has noticed that
we have modified the `plan.txt` file.

In TortoiseHg,
when we select the `plan.txt` file in the file list,
the file's contents appear in the diff pane with the text that we added highlighted in green.

From the command-line,
we can double-check our work using `hg diff`,
which shows us the differences between the current state of the file and the most recently committed version:

~~~ {.bash}
$ hg diff
~~~
~~~ {.output}
diff -r 823fd5e1b20f -r 8b3c15d3bf0f plan.txt
--- a/plan.txt  Wed Jun 05 14:17:06 2019 -0700
+++ b/plan.txt  Wed Jun 05 16:42:43 2019 -0700
@@ -1,2 +1,3 @@
 Goal: Run NEMO every day to forecast storm surge water levels
+
+Need daily high resolution weather forcing from ECCC
~~~

The output is cryptic because it is actually a series of commands for tools like editors and `patch` telling them how to reconstruct one file given the other.
If we can break it down into pieces:

1. The first line tells us that Mercurial is using the Unix `diff` command to compare the last committed and new versions of the file.
2. The next two lines show us the time stamps of the 2 versions of the file that are being compared.
3. The remaining lines show us the actual differences and the lines on which they occur.
   In particular,
   the `+` markers in the first column show where we are adding lines.

Let's commit our change:

~~~ {.bash}
$ hg commit -m "Add note about source for atmospheric forcing"
~~~

Checking our project's status:

~~~ {.bash}
$ hg status
~~~

we get no output because all of the changes have been committed.
We can see our commits with `hg log`:

~~~ {.bash}
$ hg log
~~~
~~~ {.output}
changeset:   1:8b3c15d3bf0f
tag:         tip
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 16:42:43 2019 -0700
summary:     Add note about source for atmospheric forcing

changeset:   0:823fd5e1b20f
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 14:17:06 2019 -0700
summary:     Start to planning the daily NEMO forecast system
~~~

Of course sometimes we may not want to commit everything at once.
For example,
suppose we're adding a few citations to our supervisor's work to our thesis.
We might want to commit those additions,
and the corresponding addition to the bibliography,
but *not* commit the work we're doing on the conclusions
(which we haven't finished yet).
To handle that,
simply do two
(or more)
separate commits,
listing the names of the files to be included in each commit in the `hg commit` command:

~~~ {.bash}
$ hg commit -m "Cite Sastri and Dower (2009)." methods.txt biblio.txt
...
<later>
...
$ hg commit conclusions.txt -m "Update conclusions re: phyto bloom timing mismatches."
~~~

Notice that the list of file names can come before or after the commit comment
in the `hg commit` command.

Let's add another line to the file for practice and to make our revision
history more interesting:

~~~ {.bash}
$ nano plan.txt
$ cat plan.txt
~~~
~~~ {.output}
Goal: Run NEMO everyday to forecast storm surge water levels

Need daily high resolution weather forcing from ECCC
Also need daily average Fraser River flow from ECCC
~~~
~~~ {.bash}
$ hg diff
~~~
~~~ {.output}
diff -r 8b3c15d3bf0f -r 77d20ec178e3 plan.txt
--- a/plan.txt  Wed Jun 05 16:42:43 2019 -0700
+++ b/plan.txt  Wed Jun 05 16:52:52 2019 -0700
@@ -1,3 +1,4 @@
 Goal: Run NEMO every day to forecast storm surge water levels

 Need daily high resolution weather forcing from ECCC
+Also need daily average Fraser River flow from ECCC
~~~

So far, so good:
we've added one line to the end of the file
(shown with a `+` in the first column).
Now,
let's commit our changes:

~~~ {.bash}
$ hg commit plan.txt -m "Add note about data source for Fraser River flow forcing."
~~~

and look at the history of what we've done so far:

~~~ {.bash}
$ hg log
~~~
~~~ {.output}
changeset:   2:77d20ec178e3
tag:         tip
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 16:52:52 2019 -0700
summary:     Add note about data source for Fraser River flow forcing

changeset:   1:8b3c15d3bf0f
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 16:42:43 2019 -0700
summary:     Add note about source for atmospheric forcing

changeset:   0:823fd5e1b20f
user:        Susan Allen <sallen@eoas.ubc.ca>
date:        Wed Jun 05 14:17:06 2019 -0700
summary:     Start to planning the daily NEMO forecast system
~~~


> ## Learning Objectives {.objectives}
>
> * Display the uncommitted changes that have been made to tracked files.
> * Go through the modify-commit cycle for single and multiple files.


> ## `bio` Repository {.challenge}
>
> Create a new Mercurial repository on your computer called `bio`.
> Write a three-line biography for yourself in a file called `me.txt`,
> commit your changes,
> then modify one line,
> add a fourth line,
> and display the differences between the file's updated state and its original state.
