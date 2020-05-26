" ~/.vimrc
"
" Author: Mitchell Roe

" pathogen {
  execute pathogen#infect()
  filetype plugin indent on
" }

" general {
  syntax enable
  set scrolloff=3
  " Allow switching between buffers even if there are unsaved changes
  set hidden

  set tabstop=2
  set shiftwidth=2
  set expandtab
  set softtabstop=2
  set autoindent
  set smartindent

  set splitbelow
  set splitright
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  set foldmethod=indent
  set foldlevel=99
" }

" filetypes {
  au BufNewFile,BufRead *.py
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set fileformat=unix

  au BufNewFile,BufRead *.js, *.html, *.css
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2

  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h
        \ match BadWhitespace /\s\+$/
" }

" packages {

  " ansible-vim {
  " }

  " csv {
  " }

  " fugitive {
  " }

  " gruvbox {
    set background=dark
    colorscheme gruvbox
  " }

  " nerdcommenter {
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
  " }

  " nerdtree {
    nnoremap <F12> :NERDTreeVCS<cr>
  " }

  " simplyfold {
    let g:SimpylFold_docstring_preview = 1
  " }

  " syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
  " }

  " tabular {
  " }

  " vim-airline {
    let g:airline_powerline_fonts = 1
  " }

  " vim-better-whitespace {
  " }

  " vim-commentary {
  " }

  " vim-markdown {
    filetype plugin on
    let g:markdown_enable_spell_checking = 1
  " }

  " vim-sensible {
  " }

  " vim-surround {
  " }

  " vim-yaml {
  " }

" }
