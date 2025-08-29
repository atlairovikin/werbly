# werbly
A homebrew isolator, with the goal to circumvent Homebrew's innate security concerns using built-in features.

### !
In doing so, it un-simplifies much of Homebrew's machinations. Do not use if you're unfamiliar with Homebrew or Command Line Interfaces.
Please also note that the command line's name is 'werb', not 'werbly', and should be called as such.


# download
### git:
MacOS comes (pre-)installed with an older version of git, which may be used to install the current version of werbly's command line.

- type `git clone 'https://github.com/atlairovikin/werbly.git' "${HOME}/werbly"` into your terminal
### .zip file:
This method may be used to download an older release, should you so desire.
1. download the .zip file from your desired release
2. move said .zip file to your home directory (aka `~`/`"${HOME}"` in cmdln)
3. uncompress the .zip file & rename the now-uncompressed archive folder to 'werbly'

# remove
- simply delete the 'werbly' file at your home directory and remove the line `. "${HOME}/werbly/signpost.sh"` from your shell profile


# change versions
This is very straightforward; Simply download/clone the Werbly version you wish, move the folder 'the_brewery' from the old installation to the new one, and then delete the old one. Once the that is done, just move your new version to where the old version used to be and boom! you're done.


# setup
- Add the line `. "${HOME}/werbly/signpost.sh"` to your shell profile. If you do not already have a shell profile, then create one using: `touch "${HOME}/.profile"`
- note:	if you are using .profile as your profile, please remember to use `sh --login` from terminal if your default shell is not `sh` or if your terminal is configured to not login automatically


## additional information
Werbly is constructed with the point of installing and running brew in an isolated manner, which homebrew refuses to support. As such, it would be rather uncool of me to not support my code to be similarly isolated. So here are some quick tips:
- Werbly is rather self sufficient, with the few dependancies it has being present on most every Mac. In addition, it does not deposit/create/read any files outside of its folder (unless explicitly requested by the user).
- The file 'signpost.sh' defines the relative paths that are used throughout Werbly command line. You may edit the file and change the definitions from their default values, allowing Werbly (and by extension, homebrew) to be installed most anywhere.
 - A not un-agreeable alternative might be to simply symlink Werbly to your home directory by using something like `ln -s -- <path to werbly> "${HOME}/werbly"`.
 - Unlike Homebrew, I will do my best to ensure this is a recurring feature of Werbly, and shall accept issues on the topic.
- You can hide werbly (just as if it were '.werbly') by using the MacOS-specific command `chflags -hv 'hidden' <path to werbly>` (to undo this, simply run the command again but with the argument 'hidden' as 'nohidden').

### Feedback
For general feedback, feel free to open a discussion at <https://github.com/atlairovikin/werbly/issues>
For feature requests or bug reports, please open a respective issue at <https://github.com/atlairovikin/werbly/issues>
Thank you!

### Security
For any questions or concerns regarding supported versions or how to report a vulnerability, please refer to: <https://github.com/atlairovikin/werbly/blob/main/SECURITY.md>

### Legal
Werbly is held with an MIT License: <https://github.com/atlairovikin/werbly/blob/main/LICENSE>
