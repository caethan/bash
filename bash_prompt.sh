#!/bin/bash

GREY="\[\033[1;37m\]"
GREEN="\[\033[1;32m\]"
RED="\[\033[1;31m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[1;34m\]"
MAGENTA="\[\033[1;35m\]"
CYAN="\[\033[1;36m\]"
NORMAL="\[\033[0m\]"

# Turns off the devault virtual environment display
export VIRTUAL_ENV_DISABLE_PROMPT=1

function prompt() {

    function git_info() {
        local BRANCH="\$(git branch | grep ^* | sed s/\*\ //)"
        local ORIGIN="\$(git remote -v | grep '(fetch)' | sed 's/.*git@//' | sed 's/.*https:\/\///' | sed 's/\.git.*//')"
        local LINE="${YELLOW}---git:($CYAN${ORIGIN}$YELLOW - $MAGENTA$BRANCH$YELLOW)---\n$NORMAL"
        echo "\$(git branch &> /dev/null; if [ \$? -eq 0 ]; then echo "\"$LINE\""; fi)"
    }

    function virtualenv_info() {
        local LINE="$YELLOW--venv:($CYAN\${VIRTUAL_ENV##*/}$YELLOW)--\n$NORMAL"
        echo "\$(if [[ -n \$VIRTUAL_ENV ]]; then echo "\"$LINE\""; fi)"
    }

    export PS1="$GREY(\$(date +'%b %d %Y'), \@) - \
${BLUE}\u${CYAN}@${YELLOW}\h \
${GREEN}\w\n\
$(git_info)$(virtualenv_info)\
${YELLOW}\$>${NORMAL} "
}
