#!/bin/sh

#prevents command injections
shift "${#}"

#ensure brew is defined
if alias | grep -e 'brew' -q; then
  :
else
  werb define 'brew' <<- 'EndOFHeredoc' 1>/dev/null
	y
	EndOFHeredoc
fi

#inform of processing
printf '%s\n' 'please hold...'
{
#ixnay on the acktray-ings
export HOMEBREW_NO_ANALYTICS='1'
#makes any installed casks (apps/fonts) installed with homebrew in the sandbox
export HOMEBREW_CASK_OPTS="--appdir=${a_sandbox_dir} --fontdir=${a_sandbox_dir}"
#prevents homebrew from just getting up and running away
export HOMEBREW_NO_AUTO_UPDATE='1'
#display homebrews enviroment post-modification
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
