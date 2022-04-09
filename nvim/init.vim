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
syntax on
set number 
set relativenumber
set nowrap

" Netwr
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Enable 24bit colors
set termguicolors

" Make background transparent
" highlight Normal ctermbg=NONE guibg=NONE
" highlight LineNr ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE
" highlight Nontext ctermbg=NONE guibg=NONE
" hi StatusLine ctermbg=NONE guibg=NONE