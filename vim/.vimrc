call plug#begin()

" Theme
Plug 'nanotech/jellybeans.vim'

" Initialize plugin system
call plug#end()

" Personalization
colorscheme jellybeans

" Usability
syntax on
set number

" enable 24bit colors
set termguicolors

" Make background transparent
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight Nontext ctermbg=NONE guibg=NONE
