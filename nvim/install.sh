#!/bin/bash

nvim --headless +"Lazy! sync" "+sleep 20" "+MasonToolsInstallSync" +qa
git reset --hard HEAD
nvim --headless "+Lazy! restore" +qa
