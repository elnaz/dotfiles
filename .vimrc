filetype off                                                                   " required by vundle
filetype plugin indent on                                                      " required by vundle

set expandtab                                                                  " tabs
set nobackup                                                                   " disable backups
set nocompatible                                                               " required by vundle
set noswapfile                                                                 " disable backups
set nowritebackup                                                              " disable backups
set number                                                                     " enable line numbers
set shiftwidth=2                                                               " tabs
set smarttab                                                                   " tabs
set softtabstop=2                                                              " tabs
set textwidth=0                                                                " disable autowrapping
set wrapmargin=0                                                               " disable autowrapping

" PLUGINS: INSTALL -----------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim                                              " set the runtime path to include vundle
call vundle#begin()                                                            " initialize vundle

Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scwood/vim-hybrid'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()

" PLUGINS: CONFIGURATION -----------------------------------------------------

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules\|log\|tmp\|coverage$',
  \ 'file': '\.DS_Store$'
  \ }

let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "m",
  \ "Staged"    : ".",
  \ "Untracked" : "?",
  \ "Renamed"   : "->",
  \ "Deleted"   : "x",
  \ "Dirty"     : "*",
  \ "Unknown"   : "??"
  \ }

" MAPPINGS -------------------------------------------------------------------

:let mapleader = ','

inoremap kj <Esc>:w<CR>
inoremap jk <Esc>:w<CR>

nnoremap ; :

nmap <leader>ae :Tabularize /=<CR>
vmap <leader>ae :Tabularize /=<CR>
map  <leader>l  :NERDTreeToggle<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" AUTO -----------------------------------------------------------------------

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif            " remove trailing whitespace
autocmd FileType * setlocal formatoptions-=cro                                 " disable auto commenting

" STYLE ----------------------------------------------------------------------

colorscheme hybrid

syntax on                                                                      " enable syntax highlighting

highlight ColorColumn ctermbg=235 guibg=#2c2d27                                " highlight line limits
let &colorcolumn="80,".join(range(120,999),",")

highlight ExtraWhitespace ctermbg=red guibg=red                                " highlight trailing whitespace
match ExtraWhitespace /\s\+$/
