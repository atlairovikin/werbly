# Werbly

Just another homebrew isolator.
With the goal to circumvent Homebrew's innate security concerns using universally available resources.

## Management

> Note that werbly's command line is `werb` ("brew" spelt backwards).

> For more information on managing Werbly, see [docs/troubleshooting.md][additional].

#### Installation:

MacOS comes pre-installed with an older version of git, which may be used to install the current version of Werbly. You may alternatively choose to download Werbly as a ".zip" or ".tar.gz" archive from the website directly, which can be useful for downloading a specific release. Note this and other guides only cover the current release.

* To download via Git, run (where \<pathname\> is the desired destination):
  ```
  git clone 'https://github.com/atlairovikin/werbly.git' <pathname>
  ```

* To download as an archive:
  1.  Download the archive from your desired release from github.
  2.  Move said archive file to the desired directory.
  3.  Uncompress the archive file & rename the now-uncompressed archive folder into 'werbly'.

Then, to set up, run the following:
```
cd <pathname>
make
```

Aaand you're done!
To confirm this, call `werb` without any arguments: You should see a response.

> If you do not receive a response, please review the above instructions once more. If the problem persists, please remove and then re-download Werbly. If the problem continues to persist, [docs/SUPPORT.md][support].

#### Removal:

To remove Werbly, simply delete the 'werbly' folder and remove the fetch line from your shell profile (e.g. `{ werblyPath="<path>" && . <path>; }`). Be sure to unapply any homebrew apps/casks first (as said symlinks will no longer work).

---

### Feedback

For general feedback, feel free to open a discussion at:
<https://github.com/atlairovikin/werbly/discussions>
For feature requests or bug reports, please open a respective issue at:
<https://github.com/atlairovikin/werbly/issues>
Thank you!

### Security

For any further questions or concerns regarding supported versions, or how to report a vulnerability, please refer to [docs/SECURITY.md][security].

### Legal (or, the lack thereof)

Werbly is dedicated to the public domain, permitting unrestricted access and usage to and of itself.
For details, please refer to [docs/LICENSE.txt][license].

---

[additional]: https://github.com/atlairovikin/werbly/blob/main/docs/troubleshooting.md
[support]: https://github.com/atlairovikin/werbly/blob/main/docs/SUPPORT.md
[security]: https://github.com/atlairovikin/werbly/blob/main/SECURITY.md
[license]: https://github.com/atlairovikin/werbly/blob/main/LICENSE.txt
