printf 'Working...\n' && {

    test -n "${1}" || {
        printf 'Error; Missing argument; Halting.\n' 1>&2
        return 1
    }

    while test "${#}" -ge '1'; do
        (
            set "${HOME}/Applications/${1%.app}.app"
            if test -L "${1}"; then
                rm -- "${1}"
            else
                if test -e "${1}"; then
                    printf '%s\n' "Error: Pathname [${1}] exists, but is not a symlink file; Halting." 1>&2
                    return 2
                else
                    printf '%s\n' "Warning: Pathname [${1}] does not exist; Skipping..."
                    false
                fi
            fi
        )
        shift 1
    done

    printf 'User applications folder, post-unapply:\n' &&
        ls -a -- "${HOME}/Applications"

} && printf 'Done!\n'
return 0
