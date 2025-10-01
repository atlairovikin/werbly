#!/bin/sh

{
test -d "${a_sandbox_dir}" || \
  {
  printf '%s\n' ' error: Cannot find sandbox directory; Halting.'
  return '2'
  }
ls -a "${a_sandbox_dir}"
} && \
printf '%s\n' ' :done listing!'
return '0'
