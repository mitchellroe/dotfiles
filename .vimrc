" ~/.vimrc
"
" Author: Mitchell Roe

" general {

  " vim7 {
    " if v:version < 800
    "   finish
    " endif
  " }

  " vim8 {
    " if v:version >= 800
    "   set inccommand=nosplit
    " endif
  " }

  syntax enable
  set scrolloff=3
  " Allow switching between buffers even if there are unsaved changes
  set hidden

  " Use the system clipboard
  if has('unnamedplus')
    set clipboard=unnamedplus
  end

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

  set ignorecase smartcase

  " Switch to i-beam cursor on insert mode
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
" }

" filetypes {
  function PythonOptions()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=79
    set expandtab
    set autoindent
    set fileformat=unix
  endfunction
  au BufNewFile,BufRead *.py call PythonOptions()

  " au BufNewFile,BufRead *.js
  "       \ set tabstop=2
  "       \ set softtabstop=2
  "       \ set shiftwidth=2

  set number relativenumber
  "noremap <leader>n :set nu! rnu!<CR>

" packages {

  " pathogen {
    execute pathogen#infect()
    filetype plugin indent on
  " }

  " ack.vim {
  " }

  " ansible-vim {
  " }

  " csv {
  " }

  " ctrlp.vim {
  " }

  " fugitive {
  " }

  " fzf {
  " }

  " gruvbox {
    set background=dark
    colorscheme gruvbox
  " }

  " indentLine {
    let g:indentLine_enabled = 0
  " }

  " nerdtree {
    nnoremap <leader>n :NERDTreeVCS<cr>
  " }

  " SimplyFold {
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

  " tmuxline.vim {
  " }

  " vim-airline {
    let g:airline_powerline_fonts = 1
  " }

  " vim-better-whitespace {
  " }

  " vim-commentary {
  " }

  " vim-eunuch {
  " }

  " vim-markdown {
    filetype plugin on
    let g:markdown_enable_spell_checking = 1
    map gf :e <cfile><CR>
  " }

  " vim-sensible {
  " }

  " vim-surround {
  " }

  " vim-toml {
  " }

  " vim-yaml {
  " }

" }
