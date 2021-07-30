
call plug#begin('~/.config/nvim/plugged')
Plug 'sainnhe/edge'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
call plug#end()


let mapleader = " "

set termguicolors " Uses TrueColor
set hlsearch " Highlights searches

set ignorecase
set smartcase

set noswapfile

norm Q gq

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set fileformat=unix
set encoding=utf-8
set number relativenumber

set wildmode=longest,list,full
set splitbelow splitright

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <silent> <esc><esc> :nohls<cr>

syntax on

let g:edge_style = 'aura' " Sets Edge's flavor
let g:edge_enable_italic = 1 " Enable italics
let g:edge_disable_italic_comment = 1 " Disable italics in comments
let g:edge_transparent_background = 1 " Use transparent background so if you have a transparent background it works
let g:lightline = {'colorscheme' : 'edge'}

set background=dark " Sets dark background just to make sure

colo edge
