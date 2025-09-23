#!/bin/sh

#outputs following contents formated for visibility
fold -s -w '66' << 'EndOfHeredoc' | sed -e 's/^[^[:space:]]/      &/'


    #'cask': homebrew's term for 'application' as in "software"
    #'formula(e)': homebrew's term for 'utility' as in "command line"

  werb [( help )|( [hail] <query> )|( [un]define brew|<formula> )|( [un]init )|( [un]install )|( [un]apply <cask> )|( man [ <num1> <num2> ] )]:

    :
      If no subsequent command is given, or if the subsequent command is null, then the call is treated as a ping, and the response 'Here!' is given.

    help:
      Display this message.

    hail <query>:
      Requests verdict from user, using argument <query> as prompt. Made only for internal use.
      If no argument is provided, or if argument is null, then the prompt 'Are you sure?' is assumed by default.

    define [brew|<formula>]:
      Defines argument as respective executable. For example, `werb define brew` would define 'brew' as an alias of executable './werbly/the_brewery/homebrew/bin/brew'.
      If no argument is provided, or if argument is null, then 'brew' is assumed by default.
    undefine [brew]|<formula>:
      Treats argument as a defined alias and undefines it.
      If no argument is provided, or if argument is null, then 'brew' is assumed by default.

    init:
      Initializes and then verifies brew's enviroment as desired for a sandbox experience.
    deinit:
      Deinitializes homebrew's sandboxed enviroment.

    install:
      Installs Homebrew, creating directories as needed. Also preemptively downloads Homebrew's official uninstall script.
    uninstall:
      Uninstalls Homebrew using its official uninstall script, downloading it if needed.
      While this does uninstall formulae, note that it does not also uninstall any casks installed by homebrew - those must be removed via brew prior to uninstall, or manually afterwards.

    apply <cask>:
      Treats argument <cask> as a would-be application, creating a link in the User's local Applications folder which then points towards the sandboxed cask, making the cask visable as an app.
    unapply <cask>:
      Removes argument <cask> as an application. This does not remove the cask itself, but rahter removes only the symlink file in the User's local Applications folder, causing the cask to no longer be visible as an app.

    man <num1> <num2>:
      Prints homebrew's manual file, lines <num1> through <num2>.
      This command serves as an alternative to homebrew's native `man brew` command, which will not work due to homebrew's isolated state.
      If no arguments are provided, or if the provided arguments are null, then it ouputs the pathname and line count of the manpage.
      Note that the manual is formated in markdown, yet is printed as raw text, often resulting in jumbled text (obviously not ideal, but I've yet to realize a better alternative).

EndOfHeredoc
