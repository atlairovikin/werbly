#!/bin/sh

printf '\n%s' "#:  ${1:-'Are you sure?'}" '%[y/n]:  '
read -r -- '_read'
case "${_read}" in
  [Yy]*) set '0';;
  [Nn]*) set '1';;
  *) printf '%s\n' ' N/A!'; set '2';;
esac
unset -v -- '_read'
exit "${1:-'3'}"
