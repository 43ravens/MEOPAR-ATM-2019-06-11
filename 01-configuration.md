---
layout: page
title: Version Control with Mercurial
subtitle: Configuring Mercurial
---
> ## Learning Objective {.objectives}
>
> * Explain what configuration steps are required once per machine.

The first time we use Mercurial on a new machine,
we need to configure a few things.
The command

~~~ {.bash}
$ hg config --edit
~~~

should open a template Mercurial configuration file in an editor for you.
On Windows the file will likely appear in `Notepad`.
On OS X and Linux,
if your `EDITOR` environment variable is not set to something else,
the file will likely appear in `vi`.
If that doesn't make you happy,
prefix the command with `EDITOR=<editor-of-your-choice>`.
`nano` is a nice,
safe choice if you don't know what else to choose:

~~~ {.bash}
$ EDITOR=nano hg config --edit
~~~

TortoiseHg users can get to a similar place by selecting `File > Settings` from the menu,
and then clicking the `Edit File` button.

The file should look a lot like:

~~~ {.output}
# example user config (see "hg help config" for more info)
[ui]
# name and email, e.g.
# username = Jane Doe <jdoe@example.com>
username =

[extensions]
# uncomment these lines to enable some popular extensions
# (see "hg help extensions" for more info)
#
# pager =
# progress =
# color =
~~~

Edit the file to set `username` to your own name and email address and add your favourite editor in the `[ui]` section.
Also uncomment the the `pager =`,
`progress =`,
and `color =` lines in the `[extensions]` section.
You can leave or delete the other comment lines (that start with `#`) as you wish.
When you are done your file should look something like:

~~~ {.output}
[ui]
username = Doug Latornell <doug.latornell@43ravens.ca>
editor = nano

[extensions]
pager =
progress =
color =
~~~

When you are finished,
save the file and exit your editor.
You can check that your settings are the way that you want them with the command

~~~ {.bash}
$ hg config ui extensions
~~~
~~~ {.output}
extensions.color=
extensions.progress=
extensions.pager=
ui.username=Doug Latornell <doug.latornell@43ravens.ca>
~~~

When you saved the file stored in your home directory as `.hgrc` on OS X and Linux or as `Mercurial.ini` on Windows.
The fact that these settings are in the Mercurial configuration file in our home directory means that they will be used for every Mercurial repository on this machine.

The above configuration work only needs to be done once per machine.


> ## Learning Objective {.objectives}
>
> * Explain what configuration steps are required once per machine.
