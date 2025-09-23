#!/bin/sh

{
test -n "${1}" || \
  {
  printf '%s\n' ' error(syntax): Missing argument; Halting.' 1>&3
  return '2'
  }
werb hail "Make link(s) at [${a_sandbox_dir}/] of cask(s) '${@}' at [${an_app_dir}/], respectively?" || \
  return '1'
printf '%s\n' 'Applications folder, pre- link creation:' && \
  ls -a -- "${an_app_dir}"
while test "${#}" -ge '1'; do
  (
  test "${1%.app}" != "${1}" || \
    set "${1}.app"
  ln -s -- "${a_sandbox_dir}/${1}" "${an_app_dir}/${1}"
  )
  shift '1'
done
printf '%s\n' 'Applications folder, post- link creation:' && \
  ls -a -- "${an_app_dir}"
} && \
printf '%s\n' ' :finished linking!' 1>&3
return '0'
