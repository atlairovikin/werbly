printf 'Working...\n' && {

    werb deinit >/dev/null 2>/dev/null
    unset -v 'werblyPath'
    werb abort >/dev/null 2>/dev/null

} && printf 'Done!\n'
