printf 'Working...\n' && {

    unset -v 'HOMEBREW_VERBOSE' 'HOMEBREW_NO_AUTO_UPDATE' 'HOMEBREW_NO_ANALYTICS' 'HOMEBREW_NO_INSTALL_CLEANUP' 'HOMEBREW_UPDATE_TO_TAG' 'HOMEBREW_UPGRADE_GREEDY' 'HOMEBREW_CASK_OPTS'

    set "$(alias)"
    printf '%s\n' "$1" | grep -e 'brew' -q && \
        werb undefine brew >/dev/null
    set "$(alias)"
    printf '%s\n' "$1" | grep -e 'brew' -qv || {
        printf 'Error: Shell environmental verification failed; Halting.\n' >&2
        return 1
    }
    shift 1

} && printf 'Done!\n'
