" Pathogen
execute pathogen#infect()
filetype plugin indent on

" Buffer and filetype options
syntax on
set number relativenumber
set scrolloff=3
" " Allow switching between buffers even if there are unsaved changes
set hidden

" NERDCommenter
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" vim-markdown
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_conceal = 1

colorscheme elflord

" Enable italics
set t_ZH=[3m
set t_ZR=[23m

" ansible-vim
au BufRead,BufNewFile */ansible-playbooks/*.yml set filetype=yaml.ansible
