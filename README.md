# Werbly
A homebrew isolator, with the goal to circumvent Homebrew's innate security concerns.

## general
In doing so, it un-simplifies much of Homebrew's machinations. Do not use if you're unfamiliar with Homebrew or Command Line Interfaces.
This is only suported on MacOS.
Similar to Homebrew, Werbly is rolling release. That means only the current release is suported. However, this is subject to exception at my discretion.

## (un)install
MacOS comes installed with an older version of git, which may be used to install werbly's command line.

To install, follow the following instructions:
1. Use git to clone werbly's command line by using `git clone 'https://github.com/atlairovikin/werbly/tree/4b58b7e480b3a2d276737b68b243b22ba0c6f5f7/.werb' "${HOME}/.werb"`, and can confirm it's sucess by using `ls -a -- "${HOME}"`.
2. Add the line `. "${HOME}/.werb/signpost.sh"` to your shell profile, or create one using `touch "${HOME}/.profile"` and then add it. Again, you can confirm this using `ls -a -- "${HOME}"`.

To uninstall, simply delete the '.werb' file at your home directory and remove the line `. "${HOME}/.werb/signpost.sh"` from your shell profile.
