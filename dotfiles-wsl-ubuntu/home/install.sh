#!/bin/bash

rsync -r --exclude backup.sh --exclude install.sh . "$HOME/"
