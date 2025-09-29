#!/bin/sh

{
test -n "${1}" || \
  {
  printf '%s\n' ' error(syntax): Missing required argument; Halting.' 1>&2
  return '2'
  }
werb hail "Remove link(s) at [${an_app_dir}/] of cask(s) '${@}' at [${a_sandbox_dir}/], respectively?" || \
  return '1'
printf '%s\n' 'Application folder, pre- link removal:' && \
  ls -a -- "${an_app_dir}"
while test "${#}" -ge '1'; do
  (
  test "${1%.app}" != "${1}" || \
    set "${1}.app"
  if test -L "${an_app_dir}/${1}"; then
    rm -- "${an_app_dir}/${1}"
  else
    if test -e "${an_app_dir}/${1}"; then
      printf '%s\n' " error: Pathname [${an_app_dir}/${1}] exists, but is not a symlink file; Halting." 1>&2
      return '3'
    else
      printf '%s\n' " warning: Pathname [${an_app_dir}/${1}] does not exist; Skipping..."
      false
    fi
  fi
  )
  shift '1'
done
printf '%s\n' 'Application folder, post- link removal:' && \
  ls -a -- "${an_app_dir}"
} && \
printf '%s\n' ' :unlinking complete!' 1>&2
return '0'
