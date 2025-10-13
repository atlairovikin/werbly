printf 'Working...\n' && {

    set "${werblyPath}/bar/homebrew/docs/Manpage.md"
    test -e "${1}" || {
        printf '%s\n' "Error: Manual at [${1}] does not exist; Halting." 1>&2
        return 1
    }
    less -R "${1}"
    shift 1

} && printf 'Done!\n'
return 0
