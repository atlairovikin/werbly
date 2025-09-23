#!/bin/sh

{
test -d "${a_sandbox_dir}/homebrew" || \
  {
  printf '%s\n' ' error: Cannot find homebrew; Halting.' 1>&2
  return '2'
  }
alias | grep -e 'brew' -q || \
  werb define 'brew' <<- 'EndOfHeredoc'
	y
	EndOfHeredoc
export HOMEBREW_NO_AUTO_UPDATE='1'
export HOMEBREW_NO_ANALYTICS='1'
export HOMEBREW_CASK_OPTS="--appdir=${a_sandbox_dir} --fontdir=${a_sandbox_dir}"
brew config | { grep -e 'HOMEBREW_NO_AUTO_UPDATE' -q; grep -e 'HOMEBREW_NO_ANALYTICS' -q; grep -e 'appdir.*fontdir' -q; } || \
  {
  printf '%s\n' ' error: Enviromental verification failed; Halting.'
  return '3'
  }
} && \
printf '%s\n' ' :initialization complete!' 1>&2
return '0'
