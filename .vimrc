"__     ___             _____   _     
"\ \   / (_)_ __ ___   |  ___| | |    
" \ \ / /| | '_ ` _ \  | |_    | |    
"  \ V / | | | | | | | |  _|_  | |___ 
"   \_/  |_|_| |_| |_| |_| (_) |_____|


set nocompatible
set number relativenumber 
set encoding=utf-8

set ttyfast

"ilumina el texto buscado
set hlsearch
set incsearch

" compatibilizar el portapapeles
set clipboard=unnamedplus

syntax enable

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" añade una barra de status
set laststatus=2

" atajos con coma
let mapleader = ","

noremap <leader>gs :CocSearch
noremap <silent>fs :Files<cr>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" go to buffers

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  
map ñ :buffers<CR>:buffer<Space>
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

    " Make sure you use single quotes

    " buscador de archivos
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " lecture mode
    Plug 'junegunn/goyo.vim'
    " support for other languages
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}
    " theres also coc-jedi for python

    " autocompletado y busqueda de funciones
    Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
    " barra de estado
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
   
    " aesthetic help
    Plug 'ap/vim-css-color'
    Plug 'dylanaraps/wal.vim'
    Plug 'airblade/vim-gitgutter'
    
    " branch tree
    Plug 'preservim/nerdtree'
call plug#end()

let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:airline_powerline_fonts = 1
let g:AirlineTheme='deus theme'
let g:airline#extensions#tabline#enabled = 1
let g:rainbow_active = 1
let g:goyo_width = 110
colorscheme wal 

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gl <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy :Goyo <Enter>  
:imap ii <Esc>
