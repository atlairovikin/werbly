#!/bin/sh

#test for input
test -n "${1}" || \
#^else defaults
set 'are you sure'

#prints prompt
printf '\012%s\012%s' "Q:  ${1}?" 'A[y/n]:  '
#reads response
read -r -- 'v_hail'
#processes response
case "${v_hail}" in
  #if yes, then set exit code as zero
  [Yy]*) set '0';;
  #if no, then set exit code as one
  [Nn]*) set '1';;
  #if other, then inform of error and exit with code as two
  ''|*) printf '%s\n' ' N/A!'; return '2';;
esac
#cleanup
unset -v -- 'v_hail'

#tests for input
test -n "${1}" || \
#^else defaults as three
return '3'
#return with assigned code
return "${1}"
