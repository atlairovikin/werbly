#!/usr/bin/env bash

{
test "${#}" -ge '1' || \
  {
  printf '%s\n' ' error: Requires an argument; Halting.' 1>&2
  return '21'
  }
test -n "${1}" || \
  {
  printf '%s\n' ' error: Argument may not be null; Halting.' 1>&2
  return '22'
  }
test -d "${1}" || \
  {
  printf '%s\n' ' error: Argument must be a directory pathname; Halting.' 1>&2
  return '23'
  }
werb hail 'Are you sure?' || \
  return '1'
set "${1}" "${1}/the_brewery"
test -d "${2}" || \
  {
  printf '%s\n' ' error: Cannot find source sandbox directory; Halting.' 1>&2
  return '3'
  }
test ! -d "${a_sandbox_dir}" || \
  {
  printf '%s\n' ' warning: Target sandbox directory already exists.' 1>&2
  werb hail 'Continue anyway?' || \
    return '1'
  }
find "${2}"
werb hail "Copy all above files into [${a_sandbox_dir}]?" || \
  return '1'
{
cp -na "${2}/." "${a_sandbox_dir}/"
test "${?}" != '1' || \
  {
  printf '%s\n' " warning: Something went wrong while copying files (this may just mean some files could not be copied without overwriting pre-existing files and thus were skipped, e.g. file '.uninstall_brew.sh'. This will only possibly be the case if permission to write to a pre-existing directory was given, however.); please manually confirm the integrity of [${a_sandbox_dir}/]."
  true
  }
}
} && \
printf '%s\n' ' :fetch complete!' 1>&2
return '0'
