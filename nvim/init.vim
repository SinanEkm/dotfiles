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
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set cursorlineopt=number
set ttyfast                 " Speed up scrolling in Vim
" let g:solarized_termcolors=256  
set background=dark 
set encoding=utf-8
set guifont=Hack\ Nerd\ Font:12
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
imap jj <Esc>
imap ii <Esc>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

:tnoremap <Esc> <C-\><C-n>

nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>]b :BufferLineCyclePrev<CR>

" color schemes
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
" open new split panes to right and below
set splitright
set splitbelow
let g:airline_powerline_fonts = 1
set completeopt=menu,menuone,noselect

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

call plug#begin()
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'bluz71/vim-nightfly-guicolors'
 Plug 'fenetikm/falcon'
 Plug 'dracula/vim', { 'name': 'dracula' }
 Plug 'NLKNguyen/papercolor-theme'
 Plug 'davidhalter/jedi-vim'
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'drewtempelmeyer/palenight.vim'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
 Plug 'lukas-reineke/indent-blankline.nvim'
 Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
 Plug 'morhetz/gruvbox'
 Plug 'rstacruz/vim-closer'
 "Plug 'kyazdani42/nvim-web-devicons'
 call plug#end()

lua << EOF
require("bufferline").setup{}
EOF

 lua << END
 require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END

lua << END
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#405b76 gui=nocombine]]
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    show_end_of_line = true,
    space_char_blankline = " ",
    show_trailing_blankline_indent = false,
    char_list = {
        '|', '¦', '┆', '┊',
    }, 
}
END

lua << END
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },
  indent = {
    enable = true
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
END

" Enable syntax highlighting per default for go_lang
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 0

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Using gopls to find definitions and information.
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

colorscheme gruvbox 
let g:lightline = { 'colorscheme': 'nightfly' }
let g:moonflyIgnoreDefaultColors = 1
let g:python3_host_prog = '/opt/homebrew/bin/python3'

function! FormatOnSave()
    let l:pos = getpos(".") " Store current cursor position
    execute '%!clang-format'
    call setpos('.', l:pos) " Restore cursor position
endfunction

autocmd BufWritePre *.cpp,*.h call FormatOnSave()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
