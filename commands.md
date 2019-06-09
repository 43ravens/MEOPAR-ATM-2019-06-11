---
layout: page
title: Version Control with Mercurial
subtitle: Mercurial Command Reminders
---

Edit your user configuration:

~~~ {.bash}
hg config --edit
~~~

Display help text for a Mercurial command:

~~~ {.bash}
hg help command_name
~~~

Initialize the current working directory as a repository:

~~~ {.bash}
hg init
~~~

Display the status of the repository:

~~~ {.bash}
hg status
~~~

Mark specific files to be tracked in the repository:

~~~ {.bash}
hg add filename_1 filename_2
~~~

Mark specific directories to be tracked in the repository:

~~~ {.bash}
hg add directory_1 directory_2
~~~

Mark all untracked files and directories to be tracked in the repository:

~~~ {.bash}
hg add
~~~

Stop tracking a specific file:

~~~ {.bash}
hg forget filename
~~~

Commit changes in all modified files to the repository's history:
(Without `-m` and a message, this command runs a text editor.)

~~~ {.bash}
hg commit -m "Some message"
~~~

Commit changes in specific modified files to the repository's history:
(Without `-m` and a message, this command runs a text editor.)

~~~ {.bash}
hg commit filename_1 filename_2 -m "Some message"
~~~

View the history of the repository:

~~~ {.bash}
hg log
~~~

Display differences between the current state of the repository and the last saved state:

~~~ {.bash}
hg diff
~~~

Display differences between the current state of a specific file and the last saved state:

~~~ {.bash}
hg diff path/to/file
~~~

Display differences between the current state of a specific file and its state in a specific earlier revision:

~~~ {.bash}
hg diff --rev 27 path/to/file
~~~

Display changes made to a specific file in a specific earlier revision:

~~~ {.bash}
hg diff --change 24 path/to/file
~~~

Erase changes to a specific file since the last commit
(modified file is saved with a `.orig` suffix before reverting):

~~~ {.bash}
hg revert path/to/file
~~~

Erase changes to a specific file since the last commit without saving `.orig` backup:

~~~ {.bash}
hg revert --no-backup path/to/file
~~~

Erase all changes since the last commit:

~~~ {.bash}
hg revert --all
~~~

Restore file to its state in a previous revision:

~~~ {.bash}
hg revert --rev 16 path/to/file
~~~

To add the URL of a clone of a repository on Bitbucket,
use

~~~ {.bash}
hg config --local
~~~

to edit (or create) the `.hg/hgrc` in the repository to include:

~~~ {.output}
[paths]
default = URL
~~~

To add the path of a local clone of a repository,
use

~~~ {.bash}
hg config --local
~~~

to edit (or create) the `.hg/hgrc` in the repository to include:

~~~ {.output}
[paths]
nickname = path/to/repository
~~~

Display a repository's clone URLs and/or paths:

~~~ {.bash}
hg paths
~~~

Push changes from a local repository to a (default) Bitbucket clone of the repository:

~~~ {.bash}
hg push
~~~

Pull changes from a (default) Bitbucket clone of the repository:

~~~ {.bash}
hg pull
~~~

Pull changes from a local clone of the repository:

~~~ {.bash}
hg pull /path/to/repository
~~~

Pull changes from a local clone of the repository that you have added a nickname path for:

~~~ {.bash}
hg pull nickname
~~~

Update a repository with the changes pulled from a clone of the repository:

~~~ {.bash}
hg update
~~~

Merge changes pulled from another clone of the repository using the GUI `kdiff3` to view and resolve conflicts:

~~~ {.bash}
hg merge --tool=kdiff3
~~~

Clone a repository from Bitbucket:

~~~ {.bash}
hg clone URL
~~~

Clone a repository from a local path:

~~~ {.bash}
hg clone path/to/repository
~~~

Note that when you clone a repository,
either by a URL or by a path,
the URL/path of the source repository is automatically added to the `[paths]` section of the new repository's `.hg/hgrc` file as the `default` path so that `hg push` and `hg pull` just work.
