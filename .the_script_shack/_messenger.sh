#!/bin/sh

alias 'werbly'='werb'
werb () {
  _arg="${1}"; shift '1'
  case "${_arg}" in
    '') printf '%s\n' ' Here!';;
    'hail')
      sh "${a_script_dir}/${_arg}.sh" "${1}"
    ;;
    'define'|'apply'|'undefine'|'unapply')
      . "${a_script_dir}/${_arg}.sh" "${@}"
    ;;
    'help'|'init'|'deinit'|'man'|'uninit')
      test "${_arg}" != 'uninit' || _arg='deinit'
      shift "${#}"
      . "${a_script_dir}/${_arg}.sh"
    ;;
    'fetch')
      . "${a_script_dir}/${_arg}.sh" "${@}"
    ;;
    'install'|'uninstall')
      shift "${#}"
      . "${a_script_dir}/${_arg}.sh"
    ;;
    *) printf "%s\n" ' error(syntax): command not recognized; see <werb help> for additional information.'; false;;
  esac
  set "${?}"
  unset -v -- '_arg'
  return "${1:-'255'}"
}
