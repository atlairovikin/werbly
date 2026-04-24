printf 'Working...\n' && {

    set "${werblyPath}/bar"
    [ -d "${1}/homebrew" ] || {
        printf 'Error: Cannot find homebrew; Halting.\n' >&2
        return 1
    }

    unset -v 'HOMEBREW_NO_AUTO_UPDATE' 'HOMEBREW_NO_ANALYTICS' 'HOMEBREW_CASK_OPTS'

    set "$(alias)"
    printf '%s\n' "$1" | grep -e 'brew' -q && \
        werb undefine brew >/dev/null
    set "$(alias)"
    printf '%s\n' "$1" | grep -e 'brew' -qv || {
        printf 'Error: Shell environmental verification failed; Halting.\n' >&2
        return 2
    }
    shift 1

} && printf 'Done!\n'
