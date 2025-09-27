#!/bin/sh

alias 'werbly'='werb'
werb () {
  _arg="${1}"; shift '1'
  case "${_arg}" in
    '') printf '%s\n' ' Here!';;
    'hail'|'define'|'apply'|'undefine'|'unapply')
      . "${a_script_dir}/${_arg}.sh" "${@}"
    ;;
    'help'|'init'|'install'|'uninstall'|'deinit'|'man'|'uninit')
      test "${_arg}" != 'uninit' || _arg='deinit'
      . "${a_script_dir}/${_arg}.sh"
    ;;
    *) printf "%s\n" ' error(syntax): command not recognized; see <werb help> for additional information'; false;;
  esac
  unset -v -- '_arg'
}
