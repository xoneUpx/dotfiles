#!/usr/bin/env bash
read a
if [[ ! -d "$(pwd)/$a" ]]
then
  mkdir -p "$(pwd)/$a"
fi
tmux neww -c "$(pwd)/$a" -n "$a"
