#!/bin/bash

nvim --headless "+Lazy! sync" +qa
git reset --hard HEAD
nvim --headless "+Lazy! restore" +qa
