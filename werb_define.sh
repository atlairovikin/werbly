#!/bin/sh

#confirms existance of input
test -n "${1}" || \
  #^else sets "brew" as default
  set 'brew'

#defines (or undefines) all input values
while test "${#}" -ge '1'; do
  #fetches intent
  werb hail "Define '${1}' as [${a_sandbox_dir}/homebrew/bin/${1}]"
  #processes intent
  case "${?}" in
    #if yes, defines input
    0) alias "${1}"="${a_sandbox_dir}/homebrew/bin/${1}" && \
    alias "${1}";;
    #if no, skips input
    1) :;;
    #else, return
    *) return '3';;
  esac
  shift '1'
done

#informs of completion
printf '%s\n' ' done!'
