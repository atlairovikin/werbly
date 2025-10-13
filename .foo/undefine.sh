printf 'Working...\n' && {

    test -n "${1}" || {
        set 'brew'
        printf "Warning: Missing argument; Defaulting to 'brew'.\\n" 1>&2
    }

    while test "${#}" -ge '1'; do
        if alias | grep -e "${1}" -q; then
            unalias "${1}"
        else
            printf '%s\n' "Warning: Alias '${1}' does not exist; Skipping it...\n" 1>&2
        fi
        shift 1
    done

} && printf 'Done!\n'
