#!/bin/sh

{
test -e "${a_sandbox_dir}/homebrew/docs/Manpage.md" || \
  {
  printf '%s\n' " error: Manual at [${a_sandbox_dir}/homebrew/docs/Manpage.md] does not exist; Halting."  1>&3
  return '2'
  }
if test "${#}" -ge '1'; then
  test "${#}" -ge '2' || \
    set '1' "${1}"
  printf '\n%s\n' '------------------------------------------------------------------------'
  sed -n -e "${1},${2}p" -- "${a_sandbox_dir}/homebrew/docs/Manpage.md"
  printf '\n%s\n' '------------------------------------------------------------------------'
else
  wc -l "${a_sandbox_dir}/homebrew/docs/Manpage.md"
fi
} && \
printf '%s\n' ' :manpage fetched!' 1>&3
return '0'
