#!/bin/sh

{
test -n "${1}" || \
  {
  set 'brew'
  printf '%s\n' " warning(syntax): Missing argument; Defaulting to '${1}'."
  }
werb hail "Undefine command(s) '${1}' as executable(s) at [${a_sandbox_dir}/homebrew/bin/], respectively?" || \
    return '1'
while test "${#}" -ge '1'; do
  if alias | grep -e "${1}" -q; then
    unalias "${1}"
  else
    printf '%s\n' " warning: Alias '${1}' does not exist; Skipping..."
    false
  fi
  shift '1'
done
} && \
printf '%s\n' ' :finished undefining!' 1>&3
return '0'
