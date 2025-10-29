printf 'Working...\n' && {

    set "${werblyPath}/bar"
    test -d "${1}" || {
        printf '%s\n' "Error: Cannot find sandbox directory at [${1}]; Halting." 1>&2
        return 1
    }
    printf '%s\n' "--- Werbly's Sandbox Folder ---"
    ls -a "${1}"
    printf '%s\n%s\n' '---+---' "--- User's Applications Folder ---"
    ls -a "${HOME}/Applications"
    printf '%s\n' '---+---'

} && printf 'Done!\n'
return 0
