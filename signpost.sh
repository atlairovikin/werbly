#!/bin/sh

#variable that script uses to determine the location of the "main" folder
export 'a_playground_dir'="${HOME}/werbly"

#variable that script uses to determine the location of the "install to" folder
export 'a_sandbox_dir'="${a_playground_dir}/the_brewery"
#variable that script uses to determine the location of the 'script' folder
export 'a_script_dir'="${a_playground_dir}"

#variable that script uses to determine the location of the "applications" folder
export 'an_app_dir'="${HOME}/Applications"

#to call all 'werbly' scripts
werb () {
  v_arg="${1}"
  shift '1'
  case "${v_arg}" in
    'help')
      . "${a_script_dir}/werb_help.sh"
    ;;
    'hail'|'define'|'apply'|'undefine'|'unapply')
      . "${a_script_dir}/werb_${v_arg}.sh" "${@}"
    ;;
    'init'|'install'|'uninstall'|'uninit'|'man')
      . "${a_script_dir}/werb_${v_arg}.sh"
    ;;
    *)
      printf '%s\n' "err: syntax; see 'werb help'"
    ;;
  esac
  unset -v -- 'v_arg'
}
