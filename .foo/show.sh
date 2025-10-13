printf 'Working...\n' && {

    set "${werblyPath}/bar"
    test -d "${1}" || {
        printf '%s\n' "Error: Cannot find sandbox directory at [${1}]; Halting." 1>&2
        return 1
    }
    ls -a "${1}"

} && printf 'Done!\n'
return 0
