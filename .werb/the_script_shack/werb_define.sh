#!/bin/sh

#confirms existance of input
test -n "${1}" || \
  {
  #^else sets "brew" as default
  set 'brew'
    #'provides alternative to "werb init" that excludes updating':
  export HOMEBREW_NO_ANALYTICS='1'
  export HOMEBREW_CASK_OPTS="--appdir=${a_sandbox_dir} --fontdir=${a_sandbox_dir}"
    #.
  }
#defines (or undefines) all input values
while test "${#}" -ge '1'; do
  #decides action based on alias status of input (if already set or not)
  if alias | grep -e "${1}" -q; then
    #fetches intent
    werb hail "alias [$(alias ${1})] is defined. Undefine '${1}'"
    #processes intent
    case "${?}" in
      #if yes, undefines input
      0) unalias "${1}" && \
      printf '%s\n' "alias '${1}' unset!"
      #if undefining brew
      test "${1}" = 'brew' && \
      #^then prompt to de-initialize Homebrew
      werb hail "Homebrew's enviroment is still initialized. De-initialize" && \
        {
        #cleanup
        unset -v -- 'HOMEBREW_NO_ANALYTICS'
        #cleanup
        unset -v -- 'HOMEBREW_CASK_OPTS'
        #inform of de-initialization
        printf '%s\n' 'brew enviroment de-initialized!'
        }
      ;;
      #if no, skips input
      1) :;;
      #else, return
      *) return '3';;
    esac
  else
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
  fi
  shift '1'
done

#informs of completion
printf '%s\n' ' done!'
