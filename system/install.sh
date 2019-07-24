#!/bin/bash

# vars
user=`whoami`

# dependencies
sudo apt install -y zsh


# shell configure
sudo chsh -s `which zsh` $user

