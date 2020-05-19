" Pathogen
execute pathogen#infect()
filetype plugin indent on

" Buffer and filetype options
syntax on
set number relativenumber
set scrolloff=3
" " Allow switching between buffers even if there are unsaved changes
set hidden

" Set indent spacing
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent

" Highlight substitutions as you type
set inccommand=nosplit

" NERDCommenter
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" vim-markdown
let g:markdown_enable_spell_checking = 0

colorscheme elflord

" set list listchars=tab:>>\ ,trail:'
