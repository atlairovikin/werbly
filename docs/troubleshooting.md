## Additional Information
Werbly is constructed with the point of installing and running homebrew in an isolated manner, which homebrew itself refuses to support. As such, it would be rather uncool of me to not support my code being similarly isolated. So here are some quick tips:
- Werbly is rather self sufficient, with the few dependancies it requires being present on most every Mac. In addition, it does not deposit/create/read any files outside of its folder (unless explicitly requested by the user, such as with `werb [un]apply <cask>`).
- The local file '_signpost.sh' defines the relative paths that are used throughout Werbly's command line. You may edit the file and change the definitions from their default values, allowing Werbly (and by extension, homebrew) to be installed most anywhere.
 - A not un-agreeable alternative might be to simply symlink Werbly to your home directory by executing `ln -s -- <path to werbly> "${HOME}/werbly"` or something similar.
 - Unlike Homebrew, I will do my best to ensure this is a recurring feature of Werbly, and shall accept issues on the topic.
- You can hide werbly (just as if it were '.werbly') by using the MacOS-specific command `chflags -hv 'hidden' <path to werbly>` (to undo this, simply run the command again but with the argument 'hidden' as 'nohidden').
 - This can alternatively, albiet a bit more complicatedly, be done by changing the name of 'werbly's folder to '.werbly', and then updating your shell profile and (the now) '.werbly/_signpost.sh' to reflect such.
