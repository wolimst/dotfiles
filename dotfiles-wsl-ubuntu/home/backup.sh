#!/bin/bash

for file in .bashrc .screenrc .vimrc
do
  cp "$HOME/$file" .
done

for dir in .config/nvim
do
  cp -r "$HOME/$dir" "$dir/.."
done
