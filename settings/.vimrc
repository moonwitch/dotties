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
  Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet
  Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown

  " General plugins
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/emmet-vim'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  "Plug 'wakatime/vim-wakatime'
  Plug 'scrooloose/vim-slumlord'          " Previewing PluntUML

  " Syntax highlighting
  Plug 'aklt/plantuml-syntax'                    " PlantUML syntax highlighting
  Plug 'chr4/nginx.vim'                          " nginx syntax highlighting
  Plug 'fishbullet/deoplete-ruby'                " Ruby auto completion
  Plug 'plasticboy/vim-markdown'                 " Markdown syntax highlighting
  Plug 'rodjek/vim-puppet'                       " Puppet syntax highlighting

  " Colorschemes
  Plug 'arcticicestudio/nord-vim'
  Plug 'chriskempson/base16-vim'
  Plug 'morhetz/gruvbox'

  " Actual functionality
  Plug 'ryanoasis/vim-devicons'      " Icons for NerdTree
call plug#end()

colorscheme gruvbox

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
set wildmode=longest,list   " get bash-like tab completions
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

"----------------------------------------------
" Navigation
"----------------------------------------------
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 1

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

" theme for Airline
" let g:airline_theme='base16_eighties'

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.maxlinenr = ''

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

"----------------------------------------------
" Plugin: 'terryma/vim-multiple-cursors'
"----------------------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-b>'

"----------------------------------------------
" Plugin: NerdTree
"----------------------------------------------
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
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


