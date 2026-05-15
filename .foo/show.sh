printf 'Working...\n' && {

    set "${HOME}/Applications" "${werblyPath}/bar"
    [ -d "$1" ] || {
        printf '%s\n' "Error: Cannot find applications directory at [${1}]; Halting." >&2
        return 1
    }
    [ -d "$2" ] || {
        printf '%s\n' "Error: Cannot find sandbox directory at [${2}]; Halting." >&2
        return 2
    }
    printf '\n%s\n' "--- User's Applications Folder ---"
    ls -a "$1"
    printf '%s\n' '---+---' "--- Werbly's Sandbox Folder ---"
    ls -a "$2"
    printf '%s\n\n' '---+---'

} && printf 'Done!\n'
