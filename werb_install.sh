#!/bin/bash

#prevents command injections
shift "${#}"
#get current directory
a_dir_var="${PWD}"

#confirm existance of sandbox directory, else attempt to create it
test -d "${a_sandbox_dir}" || \
  {
  #show contents of directory whereas to create sandbox
  ls -a -- "${a_playground_dir}"
  #fetch confirmation to create sandbox
  werb hail "Is this(${a_playground_dir}) the intended directory for homebrew's sandbox" || return '1'
  #create sandbox directory
  mkdir "${a_sandbox_dir}"
  }
#show contents of sandbox directory pre-install
ls -a -- "${a_sandbox_dir}"
#fetch confirmation to install homebrew (at sandbox)
werb hail "Is this(${a_sandbox_dir}) the intended install directory for homebrew" || return '1'
#enter install directory
cd "${a_sandbox_dir}"
#confirm existance of uninstall script
test -e '.uninstall_brew.sh' || \
  #^else preemptively download uninstall script
  curl -fsSL -o '.uninstall_brew.sh' https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
	#"https://docs.brew.sh/Installation":
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
	#.
#show contents of sandbox directory post-install
ls -a -- "${a_sandbox_dir}"

#return to starting directory (if it still exists) else return home [+ cleanup].
test -d "${a_dir_var}" && cd "${a_dir_var}" || cd "${HOME}"; unset -v -- 'a_dir_var'

#inform of completion
printf '%s\n' ' done!'
#exit sucessfully
return '0'
