#!/bin/bash

#prevent= command injections
shift "${#}"
#get current directory
a_dir_var="${PWD}"

#confirm existance of homebrew directory, else fail script
test -d "${a_sandbox_dir}/homebrew" || \
  {
  #inform of failure
  printf '%s\n' "err: Looking for, but cannot find, directory [${a_sandbox_dir}/homebrew]:"
  #show contents of searched directory
  ls -a "${a_sandbox_dir}"
  #return from script
  return '3'
  }
#show contents of sandbox directory pre-uninstall
ls -a -- "${a_sandbox_dir}"
#fetch confirmation to uninstall homebrew
werb hail "Is this(${a_sandbox_dir}) the intended directory to uninstall homebrew" || return '1'
#enter uninstall directory
cd "${a_sandbox_dir}"
#test for unset POSIX variable, else unsets it
test -z "${POSIXLY_CORRECT+set}" || \
  {
  #set flag for re-entering POSIX-mode later
  set 'POSIXflag'
  #exit POSIX-mode
  unset -v -- 'POSIXLY_CORRECT'
  }
#test if preemptive uninstall script is present
if test -e '.uninstall_brew.sh'; then
  #execute uninstall script
  /bin/bash '.uninstall_brew.sh' --path homebrew
else
  #test for different name of uninstall script (in case of error) else re-download it, before executing it
  test -e 'uninstall.sh' || \
	#"https://docs.brew.sh/Installation":
curl -fsSLO https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
/bin/bash uninstall.sh --path homebrew
	#.
  #provide additional info about the following command
  printf '%s\n' "The file 'uninstall.sh' is temporary; it's deletion would not effect any future uninstalls, but it's removal will help to de-clutter the sandbox's enviroment:"
  #remove uninstall.sh file (with prompt)
  rm -i 'uninstall.sh' && \
  #^if sucess, show difference post-removal
  ls -a -- "${a_sandbox_dir}"
fi
#if exited POSIX-mode earlier, then re-enter it
test "${1:-unset}" = 'POSIXflag' && \
  {
  #enter POSIX-mode
  export 'POSIXLY_CORRECT'='1'
  #cleanup flag
  shift '1'
  }
#show contents of sandbox directory post-uninstall
ls -a "${a_sandbox_dir}"

#return to starting directory (if it still exists), else return home [also cleanup]
test -d "${a_dir_var}" && cd "${a_dir_var}" || cd "${HOME}"; unset -v -- 'a_dir_var'

#inform of completion
printf '%s\n' ' done!'
#exit sucessfully
return '0'
