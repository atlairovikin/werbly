#!/bin/sh

{
alias | grep -e 'brew' -qv || \
  werb undefine 'brew' <<- 'EndOfHeredoc'
	y
	EndOfHeredoc
unset -v -- 'HOMEBREW_NO_AUTO_UPDATE'
unset -v -- 'HOMEBREW_NO_ANALYTICS'
unset -v -- 'HOMEBREW_CASK_OPTS'
brew config | { grep -e 'HOMEBREW_NO_AUTO_UPDATE' -qv; grep -e 'HOMEBREW_NO_ANALYTICS' -qv; grep -e 'appdir.*fontdir' -qv; } || \
  {
  printf '%s\n' ' error: Enviromental scrub failed; Halting.' 1>&2
  return '3'
  }
} && \
printf '%s\n' ' :un-initialization complete!' 1>&2
return '0'
