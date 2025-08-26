#!/bin/sh

#confirms existance of input
test -n "${1}" || \
  {
  #^else prints error message
  printf '%s\n' 'err: Missing an argument'
  #and returns from script
  return '2'
  }
#processes all inputs
while test "${#}" -ge '1'; do
  #if input has a symlink at application folder already
  if test -L "${an_app_dir}/${1}"; then
    #prints additional query info for next command
    printf '%s\n' "cask [${a_sandbox_dir}/${1}] is applied(linked) as [${an_app_dir}/${1}]:"
    #removes symlink after pronpt
    rm -i -- "${an_app_dir}/${1}"
  else
    #fetches confirmation
    werb hail "Apply(link) cask at [${a_sandbox_dir}/${1}] as [${an_app_dir}/${1}]" && \
    #make symlink of input cask at application folder
    ln -s -- "${a_sandbox_dir}/${1}" "${an_app_dir}/${1}"
  fi
  shift '1'
done
#displays changes (or lack thereof)
ls -a -- "${an_app_dir}"
#inform of completion
printf '%s\n' ' done!'
