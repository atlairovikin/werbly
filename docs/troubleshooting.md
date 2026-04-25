## Additional Information

Werbly is rather self sufficient, with the few dependancies it requires being present on most every Mac. In addition, it does not deposit/create/modify/read any files outside of its folder (unless explicitly requested by the user, such as with `werb [un]apply <app>`).

#### Installing:

* You can hide Werbly (so as to reduce clutter) by changing the name of werbly's folder to ".werbly", and then updating your shell profile to reflect such.
    * Alternatively, you can also hide Werbly (just as if it were '.werbly') by using the MacOS-specific command `chflags -hv 'hidden' <path_to_werbly>` (to undo this, simply run the command again but with the argument "hidden" as "nohidden").

Werbly is constructed with the point of installing and running Homebrew in an isolated manner, which Homebrew itself refuses to support. As such, it would be rather uncool of me to not support my code being similarly isolated. So here are some quick tips:

1. __[Pre-creation]__ When setting up Werbly with `make`, you can optionally append `WERBLY=<path>` where \<path\> is the absolute path to Werbly's folder (defualts to "~/werbly") - and/or `PROFILE=<file>` where \<file\> is your shell profile chosen to source Werbly (defualts to "~/.profile"). This allows Werbly (and by extension, Homebrew) to be installed most anywhere.
    * More advanced users may choose to append `CMDLN=<command_line>` where \<command_line\> is what defines `werblyPath` and sources Werbly at "docs/.foo/waystone.sh" (defaults to `{ export "werblyPath"="$(WERBLY)" && . "$${werblyPath}/.foo/waystone.sh"; }`).
    > For Example, to place Werbly in the folder "~/my_miscellany", and source it from "~/.bask_profile", you would run `make PROFILE=~/.bash_profile WERBLY=~/my_miscallany/werbly`
2. __[Post-creation]__ You may edit your shell profile ("~/.profile" for sh, "~/.bash_profile" for bash, etc.) and change the definitions from their default values.
    * A not un-agreeable alternative might be to simply symlink Werbly to your home directory by executing `ln -s -- <path_to_werbly> "${HOME}/werbly"` or something similar.

#### Removing:

If uninstall fails for some reason that you cannot easily identify, or if it has been a long time since you originally installed Homebrew, it might be worth deleting the file "bar/.uninstall_brew.sh" before trying again (you may have to set hidden files as visible to do so). If you do this, ensure you have an internet connection first, as it will attempt to redownload the uninstallation script. **It is recomended that you do not attempt to modify "bar/.uninstall_brew.sh" yourself.**

#### Changing Versions:

* Take the old werbly's sandbox directory and move it to the same place in the new werbly.
    * Said sandbox folder is "werbly/bar". It does not exist until Homebrew is installed using `werb install`.
        * If the sandbox folder is "werbly/the_brewery", you will need to rename it to "werby/bar" once you have moved it.
