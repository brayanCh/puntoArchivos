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
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab autoindent

" añade una barra de status
set laststatus=2

" atajos con coma
let mapleader = ","

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

noremap <leader>gs :CocSearch
noremap <silent>fs :Files<cr>
noremap <silent>rn <Plug>(coc-rename)
nnoremap <C-o> <Plug>(coc-codeaction-selected)<Enter>
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

map fi GVgg=
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  
map ; :buffers<CR>:buffer<Space>
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

    " Copilot plugin
    Plug 'github/copilot.vim'

    " buscador de archivos
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " support for other languages
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}
    Plug 'dart-lang/dart-vim-plugin'

    " autocompletado y busqueda de funciones
    Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
    " barra de estado
    Plug 'vim-airline/vim-airline'
 	  Plug 'vim-airline/vim-airline-themes'
    
    " aesthetic help
    Plug 'ap/vim-css-color'
    Plug 'airblade/vim-gitgutter'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'morhetz/gruvbox'
    
    " branch tree
    Plug 'preservim/nerdtree'
call plug#end()


let g:airline_powerline_fonts = 1
let g:AirlineTheme='onedark'
let g:airline_right_sep = ' '
let g:airline_left_sep = ' '
let g:airline#extensions#tabline#enabled = 1
let g:rainbow_active = 1
let g:goyo_width = 110

colorscheme gruvbox

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gl <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

:imap ii <Esc>

" eslint fix all
map fa :CocCommand eslint.executeAutofix
map fc :CocDisable<Enter> :CocEnable<Enter> 

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
hi Normal guibg=#000000df ctermbg=NONE

" dart config
let g:dart_format_on_save = v:true
let g:dart_style_guide = 2
"let g:dartfmt_options = ["--line-lenght 120"]

" coc config
let g:coc_global_extensions = [
  \  'coc-tsserver',
  \  'coc-eslint',
  \  'coc-json',
  \  'coc-flutter',
  \  'coc-snippets',
  \]


