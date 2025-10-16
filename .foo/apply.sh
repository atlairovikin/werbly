printf 'Working...\n' && {

    test -n "${1}" || {
        printf 'Error: Missing argument; Halting.\n' 1>&2
        return 1
    }
    test -d "${werblyPath}/bar" || {
        printf 'Error: Cannot find sandbox directory; Halting.\n' 1>&2
        return 2
    }

    while test "${#}" -ge '1'; do
        (
            set "${1%.app}.app" "${HOME}/Applications"
	    if test ! -e "${2}/${1}"; then
		ln -s -- "${werblyPath}/bar/${1}" "${2}/${1}"
	    else
		printf '%s\n' "Error: Already applied; Skipping..."
		false
	    fi
        )
        shift 1
    done

    printf 'User applications folder, post-apply:\n' &&
        ls -a -- "${HOME}/Applications"

} && printf 'Done!\n'
return 0
