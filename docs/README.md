# Werbly

A homebrew isolator, with the goal to circumvent Homebrew's innate security concerns using universally available resources.

---

In doing so, Werbly un-simplifies some of Homebrew's machinations. Do not use if you're unfamiliar with Homebrew or Command Line Interfaces.

> Werbly's command line is `werb` (which is 'brew' spelt backwards).

## Managing Werbly

#### installation:

MacOS comes pre-installed with an older version of git, which may be used to install the current version of Werbly. This is the most recommended method, as not only will you get the current version, but you will also need to be able to do at least this much if you are to operate Werbly and Homebrew. You may also choose to download Werbly as a '.zip' or '.tar.gz' archive from the website directly, which can be useful for downloading a specific release.

> In the following instructions, all occurrences of '\<pathname>' are to be substituted with the desired destination directory for Werbly. For example, if you wish to install Werbly with the name 'not-brew' at your home directory (e.g. '/Users/User'), you would substitute '\<pathname>' with '/Users/User/not-brew'.

- To download via Git, run:

```
git clone 'https://github.com/atlairovikin/werbly.git' <pathname>
```

- To download as an archive:

1.  Download the archive from your desired release.
2.  Move said archive file to the desired directory.
3.  Uncompress the archive file & rename the now-uncompressed archive folder into .

> note1: If you are installing Werbly anywhere other than your home directory, and/or as any name other than 'werbly', be sure to modify Werbly's local file '\_signpost.sh' to reflect said changes. Do this before continuing.

2. Then, to set up, run:

```
cd <pathname>
make
```

> If you operate using any shell other than POSIX sh (such as 'Bash') by default, you may have to run `sh --login` or (`sh` and then `login`) for each new session. Alternatively, more advanced users may try to relocate the fetch command (appended to the hidden file '.profile' in the home directory) to their shell's respective profiles.

Aaand you're done!
To confirm this, call `werb` without any arguments: You should see a response.

> If you do not receive a response, please review the above instructions once more. If the problem persists, please remove and then re-download Werbly. If the problem continues to persist, please report the issue as a bug (refer to 'Feedback' under 'Additional Information').

#### removal:

To remove Werbly, simply delete the 'werbly' folder and remove the line `. "${HOME}/werbly/signpost.sh"` from your shell profile. Be sure to unapply any casks first (as the symlinks will no longer work).

#### changing versions:

- from the new version, run:

```
werb fetch <path_to_old_Werbly>
```

And you, should there have been no errors, now can remove the old version and its contents manually. If there were errors, follow the instructions given before doing anything else.

---

### Feedback

For general feedback, feel free to open a discussion at:
<https://github.com/atlairovikin/werbly/discussions>
For feature requests or bug reports, please open a respective issue at:
<https://github.com/atlairovikin/werbly/issues>
Thank you!

### Security

For any further questions or concerns regarding supported versions, or how to report a vulnerability, please refer to [docs/SECURITY.md](https://github.com/atlairovikin/werbly/blob/main/SECURITY.md)

### Legal

Werbly is part of the public domain, permitting unrestricted access and usage to and of itself.
For details, please refer to [docs/LICENSE.txt](https://github.com/atlairovikin/werbly/blob/main/LICENSE.txt)
