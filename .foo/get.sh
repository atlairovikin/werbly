printf 'Working...\n' && {

    test -n "${1}" || {
        printf 'Error: Missing argument; Halting.\n' 1>&2
        return 1
    }
    test -d "${1}" || {
        printf 'Error: Argument must be a directory pathname; Halting.\n' 1>&2
        return 2
    }

    set "${1}/bar" "${werblier}/bar"
    test -d "${1}" || {
        printf '%s\n' "Error: Cannot find source sandbox directory at [${1}]; Halting." 1>&2
        return 3
    }

    cp -nav "${1}/." "${2}/"
    test "${?}" != '1' || {
        printf '%s\n' "Warning: Something went wrong while copying files (this may just mean some files could not be copied without overwriting pre-existing files and thus were skipped, e.g. file '.uninstall_brew.sh'. This can only be the case if writing to a pre-existing directory.); please manually confirm the integrity of [${2}/]."
        true
    }

} && printf 'Done!\n'
return 0
