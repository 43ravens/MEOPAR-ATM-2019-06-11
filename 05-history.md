---
layout: page
title: Version Control with Mercurial
subtitle: Exploring History
---
> ## Learning Objectives {.objectives}
>
> * Compare files with older versions of themselves.
> * Display the changes that were made to files in a previous changeset.

If we want to see what we changed when,
we use `hg diff` again,
but refer to old versions using the `--rev` or `-r` flag and the revision numbers:

~~~ {.bash}
$ hg diff --rev 1:2 plan.txt
~~~
~~~ {.output}
diff -r f4bdf87fe83a -r 5a733f6344d7 plan.txt
--- a/plan.txt  Sun Jun 09 10:42:55 2019 -0700
+++ b/plan.txt  Sun Jun 09 10:48:22 2019 -0700
@@ -1,3 +1,4 @@
 Goal: Run NEMO everyday to forecast storm surge water levels

 Need daily high resolution weather forcing from ECCC
+Add note about source for atmospheric forcing
~~~

~~~ {.bash}
$ hg diff -r 0:2 plan.txt
~~~
~~~ {.output}
diff -r 1320339bbcae -r 2e15a7ee29c2 plan.txt
--- a/plan.txt  Sun Jun 09 10:08:53 2019 -0700
+++ b/plan.txt  Sun Jun 09 10:48:22 2019 -0700
@@ -1,1 +1,4 @@
 Goal: Run NEMO everyday to forecast storm surge water levels
+
+Need daily high resolution weather forcing from EC.
+Also need daily average Fraser River flow from EC.
~~~

The most recent end of the chain of commits is the changeset with the highest revision number.

To see what changes were made between a particular changeset and its parent use the `--change` or `-c` flag:

~~~ {.bash}
$ hg diff --change 1
~~~
~~~ {.output}
diff -r 1320339bbcae -r b31241913818 plan.txt
--- a/plan.txt  Sun Jun 09 10:08:53 2019 -0700
+++ b/plan.txt  Sun Jun 09 10:42:55 2019 -0700
@@ -1,1 +1,3 @@
 Goal: Run NEMO everyday to forecast storm surge water levels
+
+Need daily high resolution weather forcing from EC.
~~~


> ## Learning Objectives {.objectives}
>
> * Compare files with older versions of themselves.
> * Display the changes that were made to files in a previous changeset.
