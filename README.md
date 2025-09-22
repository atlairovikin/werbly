# werbly
A homebrew isolator, with the goal to circumvent Homebrew's innate security concerns using universally available resources.

---

In doing so, Werbly un-simplifies some of Homebrew's machinations. DO NOT USE if you're unfamiliar with Homebrew or Command Line Interfaces.

> Werbly's command line is `werb`, not `werbly`.

## [Un]Install
#### git:
MacOS comes (pre-)installed with an older version of git, which may be used to install the current version of Werbly at the home directory by running:
```
git clone 'https://github.com/atlairovikin/werbly.git' "${HOME}/werbly"
```
> To install somewhere other than the home directory, simple replace the phrase `"${HOME}/werbly"` with the desired destination directory, and then modify the 'werbly/signpost.sh' file to reflect said changes.

#### download as `.zip` archive:
This method may be used to download an older release, should you so desire.
1. download the .zip file from your desired release
2. move said .zip file to your home directory (aka `~`/`"${HOME}"` in cmdln)
3. uncompress the .zip file & rename the now-uncompressed archive folder to 'werbly'

#### remove Werbly
- To remove Werbly, simply delete the 'werbly' folder and remove the line `. "${HOME}/werbly/signpost.sh"` from your shell profile. Be sure to unapply any casks first (as the symlinks will no longer work).
 - To remove Werbly without deleting any homebrew data, simply remove the 'the_brewery' folder prior to removal.
- To change Werbly version while keeping your Homebrew data, execute:
```
werb depo <path_to_old_Werbly> <path_to_new_Werbly>
```
And boom! You're done.



1. download/clone the Werbly version you wish
2. move the folder 'the_brewery' from the old installation to the new one
3. delete the old 'werbly' file
4. move your new version to where the old version used to be


# setup
- Add the line `. "${HOME}/werbly/signpost.sh"` to your shell profile. If you do not already have a shell profile, then create one using: `touch "${HOME}/.profile"`
- note:	if you are using '.profile' as your profile, please remember to use `sh --login` from terminal if your default shell is not (POSIX) `sh` or if your terminal is configured to not login automatically

---

#### Feedback
For general feedback, feel free to open a discussion at:
<https://github.com/atlairovikin/werbly/discussions>
For feature requests or bug reports, please open a respective issue at:
<https://github.com/atlairovikin/werbly/issues>
Thank you!

#### Security

For any further questions or concerns regarding supported versions, or how to report a vulnerability, please refer to:
<https://github.com/atlairovikin/werbly/blob/main/SECURITY.md>

#### Legal
Werbly is part of the public domain, permitting unrestricted access and usage to and of itself.
For details, please refer to:
<https://github.com/atlairovikin/werbly/blob/main/LICENSE.txt>


## additional information
Werbly is constructed with the point of installing and running homebrew in an isolated manner, which homebrew refuses to support. As such, it would be rather uncool of me to not support my code to be similarly isolated. So here are some quick tips:
- Werbly is rather self sufficient, with the few dependancies it requires being present on most every Mac. In addition, it does not deposit/create/read any files outside of its folder (unless explicitly requested by the user, such as with `werb [un]apply <cask>`).
- The file 'signpost.sh' defines the relative paths that are used throughout Werbly's command line. You may edit the file and change the definitions from their default values, allowing Werbly (and by extension, homebrew) to be installed most anywhere.
 - A not un-agreeable alternative might be to simply symlink Werbly to your home directory by executing `ln -s -- <path to werbly> "${HOME}/werbly"` or something similar.
 - Unlike Homebrew, I will do my best to ensure this is a recurring feature of Werbly, and shall accept issues on the topic.
- You can hide werbly (just as if it were '.werbly') by using the MacOS-specific command `chflags -hv 'hidden' <path to werbly>` (to undo this, simply run the command again but with the argument 'hidden' as 'nohidden').
 - This can alternatively, albiet a bit more complicatedly, be done by changing the name of 'werbly's folder to '.werbly', and then updating your shell profile and (the now) '.werbly/signpost.sh' to reflect such.
