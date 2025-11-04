# Changelog

---

## 1.0.0

The first official release.

## 2.0.0

Most notable changes:

- No longer hails for confirmation (as it was overkill). This effects:
  - installation/uninstallation of homebrew
  - applying/unapplying homebrew-installed applications
  - fetching old Werbly homebrew directories
- Renamed `werb fetch` to `werb get`.
- Standardized error codes.
- Added the `werb abort` and `werb exit` commands.
- Commands now inform you when they start.
- Werbly now only exports one variable to environment (for internal use): `werblyPath`.
  - The command `werbly exit` now unsets said variable
- Reduced overhead.

## 2.1.0

Most notable changes:

- `werb apply <app>` now checks for existance of <app> first
- removed `werb get` as it did not work and was also overkill
  - added instructions to 'docs/README.md' to compensate
- `werb show` the user's application folder in addition the the sandbox folder
- `werb` `fetch`, `list`, and `uninit` now return their new commands
- Improved overall code readability
- other minor changes that I am failing to recall (sorry)
