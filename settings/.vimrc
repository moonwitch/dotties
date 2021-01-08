"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/plugged')
  " Dependencies
  Plug 'honza/vim-snippets'
  " General plugins
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " Git plugins
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " Wonderful completions
  Plug 'mattn/emmet-vim'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  
  Plug 'scrooloose/vim-slumlord'          " Previewing PlantUML
  Plug 'frazrepo/vim-rainbow'
  let g:rainbow_active = 1
  
  " Syntax highlighting all over man
  Plug 'sheerun/vim-polyglot'
  " Markdown
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  " Colorschemes
  Plug 'arcticicestudio/nord-vim'
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/seoul256.vim'

  " Actual functionality
  Plug 'ryanoasis/vim-devicons'      " Icons for NerdTree
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/goyo.vim' " Distraction Free
call plug#end()

colorscheme gruvbox
" Enable italics, Make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494434/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic

"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent              " indent a new line the same amount as the line just typed
set smartindent             " enable smart indentation
set autoread                " reload file if the file changes on the disk
set expandtab               " expands tabs to spaces
set noswapfile              " disable swapfile usage
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2            " width for autoindents
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set number                  " add line numbers
set noshowmode              " hide -- MODE --
set wildmode=longest,list   " get bash-like tab completions
set termguicolors           " Enable true colors if available
set background=dark         " Dark mode?
syntax on                   " syntax highlighting
filetype plugin on

" neovim specific settings
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" Automatically save the file notes when idle
autocmd CursorHold .notes :write

"----------------------------------------------
" Remaps
"----------------------------------------------
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Ctrl-C for yanking to register, Ctrl+P to paste from clipboard
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

" Use comma as leader
let g:mapleader = ','

"----------------------------------------------
" Plugin: lightline
"----------------------------------------------
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }



"----------------------------------------------
" Plugin: vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

"----------------------------------------------
" Plugin: vim-multiple-cursors
"----------------------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-b>'

"----------------------------------------------
" Plugin: NerdTree
"----------------------------------------------
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <F7> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" Open NERDTree if no file is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif



