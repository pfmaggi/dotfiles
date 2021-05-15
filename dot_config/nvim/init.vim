" My own nvim configuration file
"
" Script made by Pietro F. Maggi <pfm@pietromaggi.com>
"

syntax on
filetype plugin indent on
set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
" set ignorecase
" set smartcase
set noswapfile
set nobackup
set undodir='stdpath("data")/undodir'
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set encoding=utf-8

" Give more space for displaying messages.
set cmdheight=2

" Always display the status line, even if only one window is displayed -
" default = 2
" set laststatus=2

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=81

" Start of plug-in section
call plug#begin(stdpath('data') . '/plugged')

" Themes
Plug 'gruvbox-community/gruvbox'

" Customize UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" Telescope requires neovim 0.5
" Plut 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Neovim's built-in language service client requires neovim 0.5
" Plug 'neovim/nvim-lspconfig'

" Undotree
Plug 'mbbill/undotree'

" Treesitter requires nvim nightly
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Git integration - Fugitive
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" Colorscheme options.
set bg=dark
colorscheme gruvbox

highlight Normal guibg=none

let mapleader = " "
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search =
" vim.fn.input("Grep for > ")})<C

nnoremap <F5> :UndotreeToggle<CR>

let g:undotree_WindowLayout = 4

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup PFM
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Plugin Settings {
  " Airline {

    " Add git branch to statusline
    set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

    " use patched fonts for airline arrows/triangles
    let g:airline_powerline_fonts=1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#show_close_button = 0

    " Theme ( github.com/vim-airline/vim-airline-themes
    let g:airline_theme= 'gruvbox'
  " }
  " CtrlP {
    " Open file menu
    nnoremap <Leader>o :CtrlP<CR>
    " Open buffer menu
    nnoremap <Leader>b :CtrlPBuffer<CR>
    " Open most recently used files
    nnoremap <Leader>f :CtrlPMRUFiles<CR>
  " }
  " deoplete {
  "  " Use deoplete
  "  let g:deoplete#enable_at_startup = 1
  " }
  " deoplete-clang {
  "  " Set default paths [REQURIED]
  "  let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
  "  let g:deoplete#sources#clang#clang_header  = '/usr/lib/clang'
  "  " Some CFLAGS/CPPFLAGS [OPTIONAL]
  "  let g:deoplete#souces#clang#std            = {'c': 'c11', 'cpp': 'c++11', 'objc': 'c11', 'objcpp': 'c++1z'}
  " }
" }

set spell spelllang=en_us
map <F7> :setlocal spell! spelllang=en_us<CR>

" Goyo customization
" map <F11> :Goyo <bar> :TogglePencil <CR>
map <F11> : Goyo <CR>

" vim-pencil
" augroup PENCIL
"     autocmd!
"     autocmd FileType markdown, mkd call pencil#init()
"     autocmd FileType text          call pencil#init()
" augroup END
