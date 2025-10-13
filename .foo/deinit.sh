printf 'Working...\n' && {

    set "${werblyPath}/bar"
    test -d "${1}/homebrew" || {
        printf 'Error: Cannot find homebrew; Halting.\n' 1>&2
        return 1
    }

    unset -v 'HOMEBREW_NO_AUTO_UPDATE' 'HOMEBREW_NO_ANALYTICS' 'HOMEBREW_CASK_OPTS'

    printf 'Please hold...\n'
    set "$(brew config)" "${1}"
    {
        printf '%s\n' "${1}" | grep -e 'HOMEBREW_NO_AUTO_UPDATE' -qv
        printf '%s\n' "${1}" | grep -e 'HOMEBREW_NO_ANALYTICS' -qv
        printf '%s\n' "${1}" | grep -e 'HOMEBREW_CASK_OPTS' -qv
    } || {
        printf 'Error: Homebrew environmental verification failed; Halting.' 1>&2
        return 2
    }
    shift 2

    set "$(alias)"
    printf '%s\n' "${1}" | grep -e 'brew' -q &&
        werb undefine brew 1>/dev/null
    set "$(alias)"
    printf '%s\n' "${1}" | grep -e 'brew' -qv || {
        printf 'Error: Shell environmental verification failed; Halting.\n' 1>&2
        return 3
    }
    shift 1

} && printf 'Done!\n'
return 0
