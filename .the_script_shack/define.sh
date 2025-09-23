#!/bin/sh

{
test -n "${1}" || \
  {
  set 'brew'
  printf '%s\n' " warning(syntax): Missing argument; Defaulting to '${1}'."
  false
  }
werb hail "Define command(s) '${1}' as executable(s) at [${a_sandbox_dir}/homebrew/bin/], respectively?" || \
  return '1'
while test "${#}" -ge '1'; do
  alias "${1}"="${a_sandbox_dir}/homebrew/bin/${1}" && \
    alias "${1}"
  shift '1'
done
} && \
printf '%s\n' ' :finished defining!' 1>&3
return '0'
