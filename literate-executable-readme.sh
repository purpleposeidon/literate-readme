#!/bin/bash

# As a shell script, README.md runs a sequence of commands in order.
# For our implementation, muting commands lets the script run to completion after it runs some task.

muted=0
mute() {
    muted=1
}

run_prompt() {
    if [ "$muted" == "1" ]; then return 1; fi
    while true; do
        # stdin is a heredoc, so always prompt the controlling terminal.
        read -r -p "Do you want to run '$1'? [y/n]: " yn < /proc/self/fd/2
        case $yn in
            [Nn]*) return 1 ;;
            [Yy]*) return 0 ;;
        esac
    done
}

# Executes the script provided on stdin.
# (The name is punned to be a invisible Markdown link. Shellcheck doesn't like that, but bash doesn't mind.)
[TASK]:() {
    run_prompt "$1" && {
        mute
        bash
    }
}

# A more sophisticated implementation might buffer up all the possible options and present a menu.
# (And then you could have this script just parse the README, but that just wouldn't be as fun.)


# Lets you write prose.
[NOTE]:() { true; }

# Provides a command in the menu without any accompanying prose. Must be a single line,
# but for your own project you could dispatch to a sub-file.
[COMMAND]:() {
    run_prompt "$1" && {
        mute
        echo "${*:2}" | bash
    }
}
