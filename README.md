# werbly
A homebrew isolator, with the goal to circumvent Homebrew's innate security concerns using built-in features.

## !
In doing so, it un-simplifies much of Homebrew's machinations. Do not use if you're unfamiliar with Homebrew or Command Line Interfaces.
Please also note that the command line's name is 'werb', not 'werbly', and should be called as such.


# install

## using git:
MacOS comes installed with an older version of git, which may be used to install werbly's command line.

type `git clone 'https://github.com/atlairovikin/werbly.git' "${HOME}/werbly"` into your terminal

## downloading .zip file

rename the now-uncompressed .zip archive folder to 'werbly'


# setup

Add the line `. "${HOME}/werbly/signpost.sh"` to your shell profile. If you do not already have a shell profile, then create one using: `touch "${HOME}/.profile"`
note:	if you are using .profile as your profile, please remember to use `sh --login` from terminal if your default shell is not `sh` or if your terminal is configured to not login automatically


# uninstall

simply delete the 'werbly' file at your home directory and remove the line `. "${HOME}/werbly/signpost.sh"` from your shell profile
