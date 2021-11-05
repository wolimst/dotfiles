#!/bin/bash

for file in bash.bashrc bash.bash_aliases gitconfig
do
  cp "/etc/$file" .
done
