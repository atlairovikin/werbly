printf 'Working...\n' && {

    set "${werblyPath}/bar" "${PWD}"
    [ -d "${1}/homebrew" ] || {
        printf '%s\n' "Error: Cannot find homebrew at [${1}/homebrew]; Halting." >&2
        return 1
    }

    if [ -z "${POSIXLY_CORRECT+set}" ]; then
        set '0' "$@"
    else 
        unset -v 'POSIXLY_CORRECT'
        set '1' "$@"
    fi

    cd "$1"
    if [ -e '.uninstall_brew.sh' ]; then
        # if already installed
        /bin/bash '.uninstall_brew.sh' --path homebrew
        set "$?" "$@"
        rm -f './.uninstall_brew.sh'
    else
        [ -e 'uninstall.sh' ] || \
	    #"https://docs.brew.sh/Installation":
            curl -fsSLO https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
        /bin/bash uninstall.sh --path homebrew
	    #.
        set "$?" "$@"
        rm -f './uninstall.sh'
    fi

    [ "$2" == '0' ] || \
        export 'POSIXLY_CORRECT'='1'
    [ "$1" == '0' ] || {
        printf 'Error: Uninstall script aborted; Halting.\n' >&2
        return 2
    }
    shift 2

    printf '%s\n' 'Sandbox folder, post-uninstall:' && \
        ls -a .
    {
        [ -d "$2" ] && cd "$2"
    } || cd "$HOME"
    shift 2

} && printf 'Done!\n'
