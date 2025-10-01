#!/bin/sh

#buffer
printf '\n\n%s\n\n' '------------------------------------------------------------------------'
#outputs following contents formated for visibility
fold -s -w '66' << 'EndOfHeredoc' | sed -e 's/^[^[:space:]]/      &/'

  werb|werbly [ help | hail [<query>] | [un]define [brew|<formula>] ... | [de|un]init | [un]install | [un]apply <cask> ... | man <num1> [<num2>] | fetch <dir> | list|show ]:

    :
      If no subsequent command is given, or if the subsequent command is null, then the call is treated as a ping and the response 'Here!' will be given.

    help:
      Display this message.

    hail <query>:
      Requests verdict from user, using argument <query> as prompt. Made for internal script use.
      -
      If no argument is provided, or if argument is null, then the prompt 'Are you sure?' is assumed by default.

    define [brew|<formula>] ...:
      Defines argument as respective executable.
      For example, `werb define brew` would define 'brew' as an alias of executable './werbly/the_brewery/homebrew/bin/brew' (assuming path values are defaulted).
    undefine [brew]|<formula>:
      Treats argument as a defined alias and undefines it.
      -
      If no argument is provided, or if argument is null, then the argument 'brew' is assumed by default.
      Accepts multiple arguments and will operate on each argument individually until there are none left.

    init:
      Initializes and then verifies brew's enviroment as desired for a sandbox experience.
    deinit:
      (De/Un)initializes homebrew's sandboxed enviroment.
      'uninit' functionally serves as an alias for 'deinit'.

    install:
      Installs Homebrew, creating directories as needed. Also preemptively downloads Homebrew's official uninstall script.
    uninstall:
      Uninstalls Homebrew using its official uninstall script, downloading it if needed.
      While this does uninstall formulae, note that it does not also uninstall any casks installed by homebrew - those must be removed via brew prior to uninstall, or manually afterwards.

    apply <cask>:
      Treats argument <cask> as a would-be application, creating a link in the User's local Applications folder which then points towards the sandboxed cask, making the cask visable as an app.
    unapply <cask>:
      Removes argument <cask> as an application. This does not remove the cask itself, but rahter removes only the symlink file in the User's local Applications folder, causing the cask to no longer be visible as an app.
      -
      Accepts multiple arguments and will operate on each argument individually until there are none left.

    man [<num1>] [<num2>]:
      Prints homebrew's manual file, lines <num1> through <num2>.
      For example, to review Homebrew terminology (as of writing this), run `werb man 1 70`.
      This command serves as an alternative to homebrew's native `man brew` command, which will not work due to homebrew's isolated state.
      Note that the manual is formated in markdown yet printed as raw text, often resulting in jumbled text (obviously not ideal, but I've yet to realize a better alternative).
      -
      If only one argument is provided, then it is treated as the second argument, and the first argument is assumed as '1'.
      If no arguments are provided, it ouputs the pathname and line count of the manpage.

    fetch <dir>:
      For changing Werbly versions. Copies the entirety of an old Werbly sandbox (specified as <dir>) into the current one. Will not overwrite files, even if permission to write to a pre-existing sandbox is given.

    list|show:
      To show the current sandbox directory's contents. Useful for knowing what to <cask> would be to `werb [un]apply <cask>`.

    exit:
      Undefines the `werb` function, as well as it's `werbly` alias. Note that this does not also undefine or de-inititalize any other previously set variables, functions, or environments related to werbly; Those must be otherwise unset prior to the exit, or manually afterwards. This is not reversable, and you will have to either restart the shell session or manually re-source Werbly in order to use it again.

EndOfHeredoc
#buffer
printf '\n\n%s\n\n' '------------------------------------------------------------------------'
