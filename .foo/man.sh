printf 'Working...\n' && {

    _manpath="$MANPATH"
    export 'MANPATH'="${werblyPath}/bar/homebrew/share/man"

    [ -n "$*" ] || set -- '-k' '.'
    man "$@" | less -RS

    export 'MANPATH'="$_manpath"
    unset -v '_manpath'

} && printf 'Done!\n'
