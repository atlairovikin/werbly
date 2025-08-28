#!/bin/sh

#prevents command injections
shift "${#}"

#ensure brew is defined
if alias | grep -e 'brew' -q; then
  :
else
  #defines it
  werb define 'brew' <<- 'EndOfHeredoc'
	y
	EndOfHeredoc
fi

#ensures brew is installed
if test -d "${a_sandbox_dir}/homebrew"; then
  :
else
  #inform of error
  printf '%s\n' 'err: cannot find homebrew'
  #exit from script
  return '3'
fi

#inform of processing
printf '%s\n' 'please hold...'
{
#display homebrews enviroment post-modification
export HOMEBREW_NO_AUTO_UPDATE='1'
#ixnay on the acktray-ings
export HOMEBREW_NO_ANALYTICS='1'
#makes any installed casks (apps/fonts) installed with homebrew in the sandbox
export HOMEBREW_CASK_OPTS="--appdir=${a_sandbox_dir} --fontdir=${a_sandbox_dir}"
#prevents homebrew from just getting up and running away
brew config
#checks if brew is up to date
brew outdated
} || \
#quick healthcheck on homebrew in case of any errors [disregard any errors about a Teir 3 Configuration]
brew doctor

#inform of completion
printf '%s\n' ' done!'
#exit sucessfully
return '0'
