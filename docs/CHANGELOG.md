# Changelog

---

## 1.0.0

The first official release.

## 2.0.0

- No longer hails for confirmation (as it was overkill). This effects:
  - installation/uninstallation of homebrew
  - applying/unapplying homebrew-installed applications
  - fetching old Werbly homebrew directories
- Renamed `werb fetch` to `werb get`.
- Standardized error codes.
- Added the `werb abort` and `werb exit` commands.
- Commands now inform you when they start.
- Werbly now only exports one variable to environment (for internal use): `werblyPath`.
  - The command `werb exit` now unsets said variable.
- Reduced overhead.

## 2.1.0

- `werb apply <app>` now checks for existance of <app> first.
- Removed `werb get` as it did not work and was also overkill.
  - Added instructions to 'docs/README.md' to compensate.
- `werb show` the user's application folder in addition the the sandbox folder.
- `werb` `fetch`, `list`, and `uninit` now return their new commands.
- Improved overall code readability.
- Other minor changes.

## 2.2.0 (pending release)

- Touched up code, and clarified some print statements.
- Added `werb perm-define-all` which appends a line to your shell profile that automatically sources heombrew's formulas, and updated `werb help` to reflect such.
- Updated docs.
- Modified `werb uninstall` so that it returns you to your original directory before exiting in case of an error.
- Modified `werb man` to actually use `man`, and to look for Homebrew's actuall ".ssl" manpage files.
- Other minor changes.
