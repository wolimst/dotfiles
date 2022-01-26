#!bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

apt upgrade

apt install -y \
    bat \
    neovim

# Python3
apt install -y \
    python3 \
    python3-pip \
    python3-pytest \
    python3-numpy \
    python3-scipy \
    python3-pandas \
    python3-matplotlib \
    python3-tqdm \
    ipython3 \
    jupyter-notebook \
    pypy3

# Node.js
apt install -y nodejs npm && npm install -g n && n lts

npm install -g \
    yarn
    tldr
