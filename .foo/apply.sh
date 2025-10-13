printf 'Working...\n' && {

    test -n "${1}" || {
        printf 'Error; Missing argument; Halting.\n' 1>&2
        return 1
    }
    
    while test "${#}" -ge '1'; do
        (
            set "${1%.app}.app" "${HOME}/Applications"
            ln -s -- "${werblyPath}/bar/${1}" "${2}/${1}"
        )
        shift 1
    done

    printf 'User applications folder, post-apply:\n' &&
        ls -a -- "${HOME}/Applications"

} && printf 'Done!\n'
return 0
