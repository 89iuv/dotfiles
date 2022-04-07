call plug#begin()

" Theme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Initialize plugin system
call plug#end()

lua << EOF
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
	transparent_background = true
})
EOF

" Personalization
colorscheme catppuccin

" Usability
set path+=**
syntax on
set number relativenumber
set nowrap

" disable cursor change
set guicursor=

" enable 24bit colors
set termguicolors

" Make background transparent
" highlight Normal ctermbg=NONE guibg=NONE
" highlight LineNr ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE
" highlight Nontext ctermbg=NONE guibg=NONE
" hi StatusLine ctermbg=NONE guibg=NONE
