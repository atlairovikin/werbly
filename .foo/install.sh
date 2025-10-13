printf 'Working...\n' && {

    set "${werblyPath}/bar" "${PWD}"
    test ! -d "${1}/homebrew" || {
        printf '%s\n' "Error: Homebrew directory [${1}/homebrew] already exists; Halting." 1>&2
        return 1
    }
    test -d "${1}" || mkdir "${1}"

    cd "${1}"
    test -e '.uninstall_brew.sh' || \
        curl -fsSLo '.uninstall_brew.sh' https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh
	#"https://docs.brew.sh/Installation":
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
	#.
    printf 'Sandbox folder, post-install:\n' && \
        ls -a .
    {
        test -d "${2}" && cd "${2}"
    } || cd "${HOME}"
    shift 2

} && printf 'Done!\n'
return 0
