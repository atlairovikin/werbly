#!/usr/bin/env bash

{
_pwd="${PWD}"
test -d "${a_sandbox_dir}/homebrew" || \
  {
  printf '%s\n' " error: Cannot find [${a_sandbox_dir}/homebrew]; Halting." 1>&2
  return '3'
  }
werb hail "Is [${a_sandbox_dir}] the intended directory to uninstall homebrew from?" || \
  return '1'
printf '%s\n' 'Sandbox folder, pre-uninstall:' && \
  ls -a -- "${a_sandbox_dir}"
cd "${a_sandbox_dir}"
if test -z "${POSIXLY_CORRECT+set}"; then
  _posix='0'
else
  _posix='1'
  unset -v -- 'POSIXLY_CORRECT'
fi
if test -e '.uninstall_brew.sh'; then
  /bin/bash '.uninstall_brew.sh' --path homebrew
  set "${?}"
else
  test -e 'uninstall.sh' || \
	#"https://docs.brew.sh/Installation":
curl -fsSLO https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
/bin/bash uninstall.sh --path homebrew
	#.
  set "${?}"
  rm 'uninstall.sh'
fi
test "${1}" == '0' || \
  {
  printf '%s\n' " warning: Uninstall script aborted; Halting." 1>&2
  return '1'
  }
test "${_posix:-unset}" == '0' || \
  export 'POSIXLY_CORRECT'='1'
unset -v -- '_posix'
printf '%s\n' 'Sandbox folder, post-uninstall:' && \
  ls -a -- "${a_sandbox_dir}"
test -e "${_pwd}" && cd "${_pwd}" || cd "${HOME}"
unset -v -- '_pwd'
} && \
printf '%s\n' ' :uninstallation complete!' 1>&2
return '0'
