#!/bin/zsh

QUERY_ARG=""

if [ -n $1 ]; then 
  QUERY_ARG="-q $1"
fi

SELECTED_REPO=$(ghq list | fzf $QUERY_ARG --layout reverse --tmux right,50% --preview "bat --color=always --style=numbers ~/ghq/{}/README.*" --preview-window "~3")

if [ $? -eq 1 ]; then
  echo "Canceled"
  exit
fi

cd ~/ghq/$SELECTED_REPO

