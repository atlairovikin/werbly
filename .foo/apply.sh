printf 'Working...\n' && {

    [ -n "$1" ] || {
        printf 'Error: Missing argument; Halting.\n' 1>&2
        return 1
    }
    [ -d "${werblyPath}/bar" ] || {
        printf 'Error: Cannot find sandbox directory; Halting.\n' 1>&2
        return 2
    }

    while [ "$#" -ge '1' ]; do
        (
            set "${1%.app}.app" "${HOME}/Applications"
            if [ -e "${werblyPath}/bar/${1}" ]; then
                if [ ! -e "${2}/${1}" ]; then
                    ln -s -- "${werblyPath}/bar/${1}" "${2}/$(basename "$1")"
                else
                    printf '%s\n' "Warning: [${1}] is already applied; Skipping..."
                    false
                fi
            else
                printf '%s\n' "Warning: [${1}] does not exist; Skipping..."
                false
            fi
        )
        shift 1
    done

    printf 'User applications folder, post-application:\n' && \
        ls -a -- "${HOME}/Applications"

} && printf 'Done!\n'
