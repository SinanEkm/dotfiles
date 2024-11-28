" Run the following command to use vim plugins then :PlugInstall
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set smartindent
set cindent
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
" set cursorlineopt=number
set ttyfast                 " Speed up scrolling in Vim
" let g:solarized_termcolors=256
set background=dark
" set encoding=utf-8
"
syntax enable

set splitright
set splitbelow
let g:airline_powerline_fonts = 1

filetype plugin on
set omnifunc=syntaxcomplete#Complete

call plug#begin()
 Plug 'morhetz/gruvbox'
 " Plug 'LunarWatcher/auto-pairs'
 Plug 'scrooloose/nerdtree'
 Plug 'vim-airline/vim-airline'
 Plug 'ryanoasis/vim-devicons'
 Plug 'preservim/nerdcommenter'
 Plug 'honza/vim-snippets'
 " Plug 'neoclide/coc.nvim', {'branch': 'release'}
 " Plug 'SirVer/ultisnips'
call plug#end()
colorscheme gruvbox

let skip_defaults_vim=1
set viminfo=""
