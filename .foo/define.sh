printf 'Working...\n' && {

    test -n "${1}" || {
        set 'brew'
        printf "Warning: Missing argument; Defaulting to 'brew'.\\n"
    }
    
    while test "${#}" -ge '1'; do
        alias "${1}"="${werblyPath}/bar/homebrew/bin/${1}" && alias "${1}"
        shift 1
    done

} && printf 'Done!\n'
