printf 'Working...\n' && {

    set "${werblyPath}/bar/homebrew/docs/Manpage.md"
    [ -e "$1" ] || {
        printf '%s\n' "Error: Manual at [${1}] does not exist; Halting." >&2
        return 1
    }
    less -R "$1"
    shift 1

} && printf 'Done!\n'
