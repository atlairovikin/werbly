printf 'Working...\n' && {

    set "${1:-.profile}" "{ export 'PATH'=\"${werblyPath}/bar/homebrew/bin:\${PATH}\"; }" "$PWD"
    cd "$HOME"

    [ -f "$1" ] || \
        touch "$1"
    grep -Fq "$2" "$1" || \
        printf '\n%s\n' "$2" >> "$1"
    cd "$3"

} && printf 'Done!\n'
