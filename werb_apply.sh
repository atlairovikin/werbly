#!/bin/sh

#confirms existance of input
test -n "${1}" || \
  {
  #^else prints error message
  printf '%s\n' 'err: missing an argument'
  #and returns from script
  return '2'
  }
#processes all inputs
while test "${#}" -ge '1'; do
  #fetches confirmation
  werb hail "Apply(link) cask at [${a_sandbox_dir}/${1}] as [${an_app_dir}/${1}]" && \
  #make symlink of input cask at application folder
  ln -s -- "${a_sandbox_dir}/${1}" "${an_app_dir}/${1}"
  shift '1'
done
#displays changes (or lack thereof)
ls -a -- "${an_app_dir}"
#inform of completion
printf '%s\n' ' done!'
