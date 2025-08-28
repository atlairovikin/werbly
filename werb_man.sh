#!/bin/sh

#confirms existance of input
if test "${#}" -gt '0'; then
  #tests if input count is two or more
  test "${#}" -ge '2' || \
    #^else sets 1-?1 as input
    set '1' "${1}"
  #outputs only the lines ?1 through ?2
  sed -n -e "${1},${2}p" -- "${a_sandbox_dir}/homebrew/docs/Manpage.md"
else
  #^else outputs line count (and directory?) of brew's man file
  wc -l "${a_sandbox_dir}/homebrew/docs/Manpage.md"
fi
