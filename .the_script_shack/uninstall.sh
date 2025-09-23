#!/bin/bash

{
set "${PWD}"
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
else
  test -e 'uninstall.sh' || \
	#"https://docs.brew.sh/Installation":
curl -fsSLO https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
/bin/bash uninstall.sh --path homebrew
	#.
  rm 'uninstall.sh'
fi
test "${_posix:-unset}" == '0' || \
  export 'POSIXLY_CORRECT'='1'
unset -v -- '_posix'
printf '%s\n' 'Sandbox folder, post-uninstall:' && \
  ls -a -- "${a_sandbox_dir}"
{ test -d "${1}" && \
cd "${1}"; } || \
cd "${HOME}"
} && \
printf '%s\n' ' :installation complete!' 1>&3
return '0'
