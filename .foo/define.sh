printf 'Working...\n' && {

    [ -n "$1" ] || {
        set 'brew'
        printf '%s\n' "Warning: Missing argument; Defaulting to 'brew'."
        false
    }
    
    while [ "$#" -ge '1' ]; do
        alias "$1"="${werblyPath}/bar/homebrew/bin/${1}" && alias "$1"
        shift 1
    done

} && printf 'Done!\n'
