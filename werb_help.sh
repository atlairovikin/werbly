#!/bin/sh

#outputs following contents formated for visibility
fold -s -w '66' << 'EndOfHeredoc' | sed -e 's/^[^[:space:]]/      &/'


    #'cask': homebrew's term for 'application' as in software
    #'formula(e)': homebrew's term for 'utility' as in command-line

  werb [[help]|( [hail] <query> )|( [define] brew|<formula> )|( [init] )|( [install] )|( [uninstall] )|( [apply] <cask> )|( [man] [<num1> <num2>]|[] )]:

    help:
      display this message

    hail <query>:
      requests verdict using <query> as prompt -- made for in-line scripting; has few uses otherwise

    define [brew]|<formula>:
      sets either "brew" or <formula> as alias for respective executables -- if argument is left null, then "brew" is assumed

    init:
      updates, initializes, and then verifies brew's enviroment as desired for a sandbox experience

    install:
      intalls brew

    uninstall:
      uninstalls brew -- while this does uninstall formulae, note it does not also uninstall any casks installed by brew - those must be removed via brew prior to uninstall (or manually, afterwards)

    apply <cask>:
      sets (or unsets if already set) a symlink of <cask> as an application. By default, this uses the User's Applications folder, not the System's

    man <num1> <num2>:
      displays brew's manual file as line <num1> through <num2>. If input is null, it ouputs a line-count and path of the brew's manual page -- this command serves as an alternative to brew's "man brew" command, which will not work due to homebrews isolated state.

EndOfHeredoc
