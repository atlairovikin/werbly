#!/bin/bash

{
set "${PWD}"
test -d "${a_sandbox_dir}" || \
  {
  werb hail "Is [${a_playground_dir}] the intended directory to put homebrew's sandbox?" || \
    return '1'
  mkdir "${a_sandbox_dir}"
  }
werb hail "Is [${a_sandbox_dir}] the intended directory to install homebrew?" || \
  return '1'
printf '%s\n' 'Sandbox folder, pre-installation:' && \
  ls -a -- "${a_sandbox_dir}"
cd "${a_sandbox_dir}"
test -e '.uninstall_brew.sh' || \
  curl -fsSL -o '.uninstall_brew.sh' https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
	#"https://docs.brew.sh/Installation":
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
	#.
printf '%s\n' 'Sandbox folder, post-installation:' && \
  ls -a -- "${a_sandbox_dir}"
{ test -d "${1}" && \
cd "${1}"; } || \
cd "${HOME}"
} && \
printf '%s\n' ' :installation complete!' 1>&2
return '0'
