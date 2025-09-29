#!/bin/sh

{
printf '%s\n' 'Please hold...'
test -d "${a_sandbox_dir}/homebrew" || \
  {
  printf '%s\n' ' error: Cannot find homebrew; Halting.' 1>&2
  return '2'
  }
unset -v -- 'HOMEBREW_NO_AUTO_UPDATE' 'HOMEBREW_NO_ANALYTICS' 'HOMEBREW_CASK_OPTS'
set "$(brew config)"
{
printf "${1}\n" | grep -e 'HOMEBREW_NO_AUTO_UPDATE' -qv
printf "${1}\n" | grep -e 'HOMEBREW_NO_ANALYTICS' -qv
printf "${1}\n" | grep -e 'appdir.*fontdir' -qv
} || \
  {
  printf '%s\n' ' error: Configuration scrub failed; Halting.' 1>&2
  return '31'
  }
alias | grep -e 'brew' -q && \
  werb undefine 'brew' <<- 'EndOfHeredoc' 1>&2>/dev/null
	y
	EndOfHeredoc
set "$(alias)"
printf "${1}" | grep -e 'brew' -qv || \
  {
  printf '%s\n' ' error: Enviromental scrub failed; Halting.' 1>&2
  return '32'
  }
} && \
printf '%s\n' ' :de-initialization complete!' 1>&2
return '0'
