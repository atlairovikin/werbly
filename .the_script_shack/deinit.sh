#!/bin/sh

{
printf '%s\n' 'Please hold...'
alias | grep -e 'brew' -qv || \
  werb undefine 'brew' <<- 'EndOfHeredoc' 1>&2>/dev/null
	y
	EndOfHeredoc
unset -v -- 'HOMEBREW_NO_AUTO_UPDATE'
unset -v -- 'HOMEBREW_NO_ANALYTICS'
unset -v -- 'HOMEBREW_CASK_OPTS'
set "$(brew config)"
{
printf "${1}\n" | grep -e 'HOMEBREW_NO_AUTO_UPDATE' -qv
printf "${1}\n" | grep -e 'HOMEBREW_NO_ANALYTICS' -qv
printf "${1}\n" | grep -e 'appdir.*fontdir' -qv
} || \
  {
  printf '%s\n' ' error: Enviromental scrub failed; Halting.' 1>&2
  return '3'
  }
} && \
printf '%s\n' ' :un-initialization complete!' 1>&2
return '0'
