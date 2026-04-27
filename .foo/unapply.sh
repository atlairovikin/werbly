printf 'Working...\n' && {

    [ -n "$1" ] || {
        printf 'Error; Missing argument; Halting.\n' >&2
        return 1
    }

    while [ "$#" -ge '1' ]; do
        (
            set "${HOME}/Applications/${1%.app}.app"
            if [ -L "$1" ]; then
                rm -- "$1"
            else
                if [ -e "$1" ]; then
                    printf '%s\n' "Error: Pathname [${1}] exists, but is not a symlink file; Halting." >&2
                    return 2
                else
                    printf '%s\n' "Warning: Pathname [${1}] does not exist; Skipping..."
                    false
                fi
            fi
        )
        shift 1
    done

    printf 'User applications folder, post-unapplication:\n' && \
        ls -a -- "${HOME}/Applications"

} && printf 'Done!\n'
