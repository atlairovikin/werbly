#!/bin/sh

#confirms existance of input
test -n "${1}" || \
  #^else sets "brew" as default
  set 'brew'

#defines (or undefines) all input values
while test "${#}" -ge '1'; do
  #confirms existance of alais
  if alias | grep -e "${1}" -q; then
    #fetches intent
    werb hail "alias [$(alias ${1})] is defined. Undefine '${1}'"
    #processes intent
    case "${?}" in
      #if yes, undefines input
      0) unalias "${1}" && \
      #informs of sucess
      printf '%s\n' "alias '${1}' unset!"
      ;;
      #if no, skips input
      1) :;;
      #^else, return
      *) return '3';;
    esac
  else
    #else inform or error
    printf '%s\n' "err: alias '${1}' does not exist; skipping"
  fi
  shift '1'
done

#informs of completion
printf '%s\n' ' done!'
