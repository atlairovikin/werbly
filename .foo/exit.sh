printf 'Working...\n' && {

    werb deinit 1>/dev/null 2>/dev/null
    unset -v 'werblyPath'
    werb abort 1>/dev/null 2>/dev/null

} && printf 'Done!\n'
return 0
