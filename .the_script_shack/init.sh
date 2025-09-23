#!/bin/sh

{
printf '%s\n' 'Please hold...'
test -d "${a_sandbox_dir}/homebrew" || \
  {
  printf '%s\n' ' error: Cannot find homebrew; Halting.' 1>&2
  return '2'
  }
alias | grep -e 'brew' -q || \
  werb define 'brew' <<- 'EndOfHeredoc' 1>&2>/dev/null
	y
	EndOfHeredoc
export HOMEBREW_NO_AUTO_UPDATE='1'
export HOMEBREW_NO_ANALYTICS='1'
export HOMEBREW_CASK_OPTS="--appdir=${a_sandbox_dir} --fontdir=${a_sandbox_dir}"
set "$(brew config)"
{
printf "${1}\n" | grep -e 'HOMEBREW_NO_AUTO_UPDATE' -q
printf "${1}\n" | grep -e 'HOMEBREW_NO_ANALYTICS' -q
printf "${1}\n" | grep -e 'appdir.*fontdir' -q
} || \
  {
  printf '%s\n' ' error: Enviromental verification failed; Halting.' 1>&2
  return '3'
  }
} && \
printf '%s\n' ' :initialization complete!' 1>&2
return '0'
