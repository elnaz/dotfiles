filetype off                                                                   " required by vundle
filetype plugin indent on                                                      " required by vundle

set backspace=indent,eol,start                                                 " make backspace work like normal
set clipboard=unnamed                                                          " use system clipboard
set expandtab                                                                  " tabs
set hlsearch                                                                   " highlight search results
set incsearch                                                                  " live update search results
set nobackup                                                                   " disable backups
set nocompatible                                                               " required by vundle
set noswapfile                                                                 " disable backups
set nowritebackup                                                              " disable backups
set number                                                                     " enable line numbers
set shiftwidth=2                                                               " tabs
set showcmd                                                                    " show current command on bottom line
set shortmess+=c                                                               " fix ycm
set smarttab                                                                   " tabs
set softtabstop=2                                                              " tabs
set textwidth=80                                                               " disable autowrapping
set wrapmargin=0                                                               " disable autowrapping

" PLUGINS: INSTALL -----------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim                                              " set the runtime path to include vundle
call vundle#begin()                                                            " initialize vundle

Plugin 'airblade/vim-gitgutter'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'janko-m/vim-test'
Plugin 'kien/ctrlp.vim'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scwood/vim-hybrid'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'

call vundle#end()

" PLUGINS: CONFIGURATION -----------------------------------------------------

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules\|log\|tmp\|coverage$',
  \ 'file': '\.DS_Store$'
  \ }

let g:go_fmt_command = "goimports"

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" MAPPINGS -------------------------------------------------------------------

:let mapleader = ','

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <leader>ac :Tabularize /:<CR>
nmap <leader>ae :Tabularize /=<CR>
nmap <leader>af :Tabularize /from<CR>
nmap <leader>c :TComment<CR>
vmap <leader>c :TComment<CR>
nmap <leader>C :TCommentBlock<CR>
vmap <leader>C :TCommentBlock<CR>
nmap <leader>l :NERDTreeToggle<CR>
nmap <leader>n :vsp<CR>:CtrlP<CR>
nmap <leader>p :set invpaste<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tn :TestNearest<CR>

inoremap jk <Esc>:w<CR>
inoremap kj <Esc>:w<CR>

nnoremap ; :

" AUTO -----------------------------------------------------------------------

autocmd BufEnter *                                                             " close nerdtree with last tab
  \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
  \ | q
  \ | endif
autocmd BufNewFile,BufRead *.json set ft=javascript                            " json syntax highlighting
autocmd BufRead,BufNewFile *.ex* set filetype=elixir
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif            " remove trailing whitespace
autocmd FileType * setlocal formatoptions-=cro                                 " disable auto commenting
autocmd StdinReadPre * let s:std_in=1                                          " open NERDTree if no files selected
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif    " open NERDTree if no files selected

" STYLE ----------------------------------------------------------------------

colorscheme hybrid

syntax on                                                                      " enable syntax highlighting

highlight ColorColumn ctermbg=235 guibg=#2c2d27                                " highlight line limits
let &colorcolumn="80,".join(range(120,999),",")

highlight ExtraWhitespace ctermbg=red guibg=red                                " highlight trailing whitespace
match ExtraWhitespace /\s\+$/
