printf 'Working...\n' && {

    set "${werblyPath}/bar"
    test -d "${1}/homebrew" || {
        printf 'Error: Cannot find homebrew; Halting.\n' 1>&2
        return 1
    }

    printf '%s\n' "$(alias)" | grep -e 'brew' -qv && \
        werb define brew 1>/dev/null
    printf '%s\n' "$(alias)" | grep -e 'brew' -q || {
        printf 'Error: Homebrew environmental verification failed; Halting.\n' 1>&2
        return 2
    }

    export HOMEBREW_NO_AUTO_UPDATE='1'
    export HOMEBREW_NO_ANALYTICS='1'
    export HOMEBREW_CASK_OPTS="--appdir=${1} --fontdir=${1}"

    printf 'Please hold...\n'
    set "$(brew config)" "${1}"
    {
        printf '%s\n' "${1}" | grep -e 'HOMEBREW_NO_AUTO_UPDATE' -q
        printf '%s\n' "${1}" | grep -e 'HOMEBREW_NO_ANALYTICS' -q
        printf '%s\n' "${1}" | grep -e 'appdir.*fontdir' -q
    } || {
        printf 'Error: Homebrew environmental verification failed; Halting.' 1>&2
        return 3
    }
    shift 2

} && printf 'Done!\n'
return 0
