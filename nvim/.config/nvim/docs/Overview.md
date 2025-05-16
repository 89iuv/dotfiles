# Overview

<!--toc:start-->
- [Overview](#overview)
  - [Replace bufferline with barbar](#replace-bufferline-with-barbar)
  - [Configure Snacks](#configure-snacks)
  - [Configure neovim](#configure-neovim)
<!--toc:end-->

## Replace bufferline with barbar

Tasks:

- [x] replace bufferline with barbar
  - [x] ~disable lazyvim mappings for buffer switching~
  - [x] change the size of the tab name
  - [x] add keymaps for
    - [x] close buffers to the left
    - [x] close buffers to the right
    - [x] close others
  - [ ] integrate the look and feel of the plugin
    - [ ] (optional) investigate if neovim tabs can be made to look like bufferline
    - [x] change the Project Explorer fg and bg colors

Note:

- load barbar using lazy loading "BufAdd" event
  - this is needed in order to overwrite lazyvim's buffer keymaps

## Configure Snacks

- [ ] enable snacks bigfile and configure it
- [x] enable snacks input
  - [x] make neo-tree use normal mode on esc key

## Configure neovim

- [ ] open checkhealth in a split window instead of a new nvim tab
