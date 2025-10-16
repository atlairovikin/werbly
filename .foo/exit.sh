printf 'Working...\n' && {

    werb deinit 1>/dev/null 2>/dev/null
    werb abort 1>/dev/null 2>/dev/null

} && printf 'Done!\n'
return 0
