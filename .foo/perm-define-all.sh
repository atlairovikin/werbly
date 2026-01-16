printf 'Working...\n' && {
    
    
    set "${HOME}/.profile" "{ export 'PATH'=\"${werblyPath}/bar/homebrew/bin:\${PATH}\"; }"

    test -f "${1}" || touch "${1}"
    grep -Fq "${2}" "${1}" || printf '\n%s\n' "${2}" >> "${1}";

} && printf 'Done!\n'
