#!/bin/sh

export 'a_playground_dir'="${HOME}/.werb"

export 'a_sandbox_dir'="${a_playground_dir}/the_brewery"
export 'a_script_dir'="${a_playground_dir}/the_script_shack"

export 'an_app_dir'="${HOME}/Applications"

werb () {
  v_arg="${1}"
  shift '1'
  case "${v_arg}" in
    'hail'|'define'|'apply')
      . "${a_script_dir}/werb_${v_arg}.sh" "${@}"
      return "${?}"
    ;;
    'init'|'install'|'uninstall')
      . "${a_script_dir}/werb_${v_arg}.sh"
      return "${?}"
    ;;
    'help'|*|'')
      . "${a_script_dir}/werb_help.sh"
      return "${?}"
    ;;
  esac
  unset -v -- 'v_arg'
}
