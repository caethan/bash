#!/bin/bash

function set_prompt
{
local ESC_OPN="\[\033["
local ESC_CLS="\]"

local GREY="\[\033[1;37m\]"
local GREEN="\[\033[1;32m\]"
local RED="\[\033[1;31m\]"
local YELLOW="\[\033[1;33m\]"
local BLUE="\[\033[1;34m\]"
local MAGENTA="\[\033[1;35m\]"
local CYAN="\[\033[1;36m\]"
local NORMAL="\[\033[0m\]"


function git_line
{
  local BRANCH="\$(git branch | grep ^* | sed s/\*\ //)"
  local ORIGIN="\$(git remote -v | grep '(fetch)' | sed 's/.*git@//' | sed 's/\.git.*//')"
  local LINE="${YELLOW}---git:($CYAN${ORIGIN}$YELLOW - $MAGENTA$BRANCH$YELLOW)---\n$NORMAL"
  echo "\$(git branch &> /dev/null; if [ \$? -eq 0 ]; then echo "\"$LINE\""; fi)"
}

export PS1="$GREY(\$(date +'%b %d %Y'), \@) - ${BLUE}\u${CYAN}@${YELLOW}\h ${GREEN}\w\n$(git_line)${YELLOW}\$>${NORMAL} "
}
