#!/bin/sh

test -n "${1}" || \
  set 'Are you sure?'
printf '\012%s\012%s' "Q:  ${1}" 'A[y/n]:  '
read -r -- '_hail'
case "${_hail}" in
  [Yy]*) set '0';;
  [Nn]*) set '1';;
  *) printf '%s\n' ' N/A!'; set '2';;
esac
unset -v -- '_hail'
return "${1}"
