# Werbly
A homebrew isolator, with the goal to circumvent Homebrew's innate security concerns using universally available resources.

---

In doing so, Werbly un-simplifies some of Homebrew's machinations. DO NOT USE if you're unfamiliar with Homebrew or Command Line Interfaces.

> Werbly's command line is `werb` (which is 'brew' spelt backwards).

## Regarding Installation
#### installation:
MacOS comes (pre)installed with an older version of git, which may be used to install the current version of Werbly. This is the most recommended method, as not only will you get the current version, but you will also need to be able to do at least this much if you are to operate Werbly and Homebrew. You may also choose to download Werbly as a '.zip' or '.tar.gz' archive from the website directly, which can be useful for downloading a specific release.

> In the following instructions, all occurrences of '\<pathname>' are to be substituted with the desired destination directory for Werbly. For example, if you wish to install Werbly with the name 'not-brew' at your home directory (e.g. '/Users/User'), you would substitute '\<pathname>' with '/Users/User/not-brew'.

- To download via Git, run:
```
git clone 'https://github.com/atlairovikin/werbly.git' <pathname>
```
- To download as an archive:
 1. Download the archive from your desired release.
 2. Move said archive file to the desired directory.
 3. Uncompress the archive file & rename the now-uncompressed archive folder into .

> note1: If you are installing Werbly anywhere other than your home directory, and/or as any name other than 'werbly', be sure to modify Werbly's local file '_signpost.sh' to reflect said changes. Do this before continuing.

2. Then, to set up, run:
```
cd <pathname>
make
```

>If you operate using any shell other than POSIX sh (such as 'Bash') by default, you may have to run `sh --login` or (`sh` and then `login`) for each new session. Alternatively, more advanced users may try to relocate the fetch command (appended to the hidden file '.profile' in the home directory) to their shell's respective profiles.

Aaand you're done!
To confirm this, call `werb` without any arguments: You should see a response.

> If you do not receive a response, please review the above instructions once more. If the problem persists, please remove and then re-download Werbly. If the problem continues to persist, please report the issue as a bug (refer to 'Feedback' under 'Additional Information').

#### removal:
To remove Werbly, simply delete the 'werbly' folder and remove the line `. "${HOME}/werbly/signpost.sh"` from your shell profile. Be sure to unapply any casks first (as the symlinks will no longer work).

#### changing versions:
If you wish to change werbly versions without loosing your local homebrew data, follow:

> If you modified the local 'signpost.sh'/'_signpost.sh' file, be sure to transfer it as well. Do not replace the new file with the old one, but rather transfer modified contents on a case-by-case basis, as different versions may contain different code.

```
werb depo <path_to_old_Werbly> <path_to_new_Werbly>
```
And boom! You're done.

---

## Additional Information
Werbly is constructed with the point of installing and running homebrew in an isolated manner, which homebrew refuses to support. As such, it would be rather uncool of me to not support my code to be similarly isolated. So here are some quick tips:
- Werbly is rather self sufficient, with the few dependancies it requires being present on most every Mac. In addition, it does not deposit/create/read any files outside of its folder (unless explicitly requested by the user, such as with `werb [un]apply <cask>`).
- The local file '_signpost.sh' defines the relative paths that are used throughout Werbly's command line. You may edit the file and change the definitions from their default values, allowing Werbly (and by extension, homebrew) to be installed most anywhere.
 - A not un-agreeable alternative might be to simply symlink Werbly to your home directory by executing `ln -s -- <path to werbly> "${HOME}/werbly"` or something similar.
 - Unlike Homebrew, I will do my best to ensure this is a recurring feature of Werbly, and shall accept issues on the topic.
- You can hide werbly (just as if it were '.werbly') by using the MacOS-specific command `chflags -hv 'hidden' <path to werbly>` (to undo this, simply run the command again but with the argument 'hidden' as 'nohidden').
 - This can alternatively, albiet a bit more complicatedly, be done by changing the name of 'werbly's folder to '.werbly', and then updating your shell profile and (the now) '.werbly/signpost.sh' to reflect such.

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
