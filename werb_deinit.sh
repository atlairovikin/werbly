#!/bin/sh

#prevents command injections
shift "${#}"

#cleanup
unset -v -- 'HOMEBREW_NO_AUTO_UPDATE'
#cleanup
unset -v -- 'HOMEBREW_NO_ANALYTICS'
#cleanup
unset -v -- 'HOMEBREW_CASK_OPTS'

if alias | grep -e 'brew' -q; then
  werb undefine 'brew' <<- 'EndOfHeredoc'
	y
	EndOfHeredoc
else
  :
fi

#inform of completion
printf '%s\n' ' done!'
#exit sucessfully
return '0'
