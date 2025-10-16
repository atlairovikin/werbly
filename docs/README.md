# Werbly

Just another homebrew isolator.
With the goal to circumvent Homebrew's innate security concerns using universally available resources.

---

## Managing Werbly

> Note that werbly's command line is `werb` ('brew' spelt backwards).

#### installation:

MacOS comes pre-installed with an older version of git, which may be used to install the current version of Werbly. This is the most recommended method, as not only will you get the current version, but you will also need to be able to do at least this much if you are to operate Werbly and Homebrew. You may also choose to download Werbly as a '.zip' or '.tar.gz' archive from the website directly, which can be useful for downloading a specific release.

- To download via Git, run (where \<pathname> is the desired destination):

```
git clone 'https://github.com/atlairovikin/werbly.git' <pathname>
```

- To download as an archive:

1.  Download the archive from your desired release from github.
2.  Move said archive file to the desired directory.
3.  Uncompress the archive file & rename the now-uncompressed archive folder into 'werbly' (or some other name).

Then, to set up, run the following (where '\<pathname1>' is the absolute path to your prefered shell's user profile, and '\<pathname2>' is the absolute path to the werbly's folder):

```
cd <pathname>
make PROFILE="<pathname1>" WERBLY="<pathname2>"
```

Aaand you're done!
To confirm this, call `werb` without any arguments: You should see a response.

> If you do not receive a response, please review the above instructions once more. If the problem persists, please remove and then re-download Werbly. If the problem continues to persist, please refer to [docs/SUPPORT.md](https://github.com/atlairovikin/werbly/blob/main/docs/SUPPORT.md).

#### removal:

To remove Werbly, simply delete the 'werbly' folder and remove the line fetch from your shell profile. Be sure to unapply any casks first (as the symlinks will no longer work).

#### changing versions:

- from the new version, run:

```
werb fetch <path_to_old_Werbly>
```

And you, should there have been no errors, now can remove the old version and its contents manually. If there were errors, follow the instructions given before refering to [docs/SUPPORT.md](https://github.com/atlairovikin/werbly/blob/main/docs/SUPPORT.md).

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
