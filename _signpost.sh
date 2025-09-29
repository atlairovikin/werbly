#!/bin/sh

#variable that Werbly uses to find itself
export 'a_playground_dir'="${HOME}/werbly"
#variable that Werbly uses to find the install-to directory
export 'a_sandbox_dir'="${a_playground_dir}/the_brewery"
#variable that Werbly uses to find its scripts
export 'a_script_dir'="${a_playground_dir}/.the_script_shack"
#variable that Werbly uses to determine the location of the "Applications" folder, for use only by 'werb [un]apply <cask>'
export 'an_app_dir'="${HOME}/Applications"
