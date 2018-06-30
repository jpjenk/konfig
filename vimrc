" Vim editor configuration (BSD Unix)
" created by jpjenk

""""""""""""""""""""""""""""""""
" Vim-Plug Management
"
" To install plugin:
"       Plug '[github]/[repo name]'
"       :source %
"       :PlugInstall
"
"""""""""""""""""""""""""""""""" 
" auto-install vim-plug (https://github.com/junegunn/vim-plug)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" General plugins
" Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'kien/ctrlp.vim'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
" Plug 'chrisbra/csv.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'farmergreg/vim-lastplace'

" Colorschemes
" Plug 'altercation/vim-colors-solarized'

" Python only plugins
" Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""
" General 
"""""""""""""""""""""""""""""""" 
" The god key
let mapleader=','

" Use Vim settings, rather than Vi settings
set nocompatible

" Backspace deletes like most programs in insert mode
set backspace=2 

" Toggle visual mode from home row with double-j tap
imap jj <Esc>

" Display incomplete commands
set showcmd

" Use search highlighting and set search clear controls
set incsearch
" set hlsearch
" nnoremap <C-l> :nohlsearch<CR><C-l>
" nnoremap <leader>i :set incsearch!<CR>
" nnoremap <leader>h :set hlsearch!<CR>
" autocmd InsertEnter * :setlocal nohlsearch
" autocmd InsertLeave * :setlocal hlsearch

" Repeat last command line directive
nnoremap <leader>r :@:<CR>

" General shortcuts
nmap <leader>q :qall<cr>
nmap <leader>w :update<cr>

" Don't clear buffer after paste
xnoremap p pgvy

" PEP 8 Python
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

" Always show current position
" set number
" set numberwidth=5
" set ruler

" Display line numbers relative to position
" set relativenumber

" Yank with clipboard
set clipboard+=unnamed

" Text encoding format
set encoding=utf-8

" Buffer backup
set backup
set backupdir=~/.editor-backup
" set nowritebackup
" set noswapfile

" Swapfile location
set dir=/private/tmp

" Recall last edit position
" ???

" Solarized theme
set background=dark
silent! colorscheme solarized
syntax on
set t_Co=32


""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""
" Fugitive shortcuts
nmap <leader>gs :Gstatus<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gp :Gpush<cr>

" Autoclose YCM helper window after user
let g:ycm_autoclose_preview_window_after_completion=1

" YCM default Python 3
let g:ycm_python_binary_path='python'

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>

" Current file in nerdtree
map <F9> :NERDTreeFind<CR>

" Too lazy to type :CtrlP
nmap <leader>p :CtrlP<cr>

" Ignore irrelevant folders in CtrlP
set wildignore+=*.pyc,venv,*.png
let g:ctrlp_custom_ignore = '\v[\/]\.git$'

" Set laststatus for vim-airline
set laststatus=2

" Folding Python code
set foldlevelstart=1
nnoremap <leader> za
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

" NERDCommenter config
let g:NERDSpaceDelims = 2


""""""""""""""""""""""""""""""""
" Filetype specific changes
""""""""""""""""""""""""""""""""
autocmd filetype html,css,htmldjango set shiftwidth=2 tabstop=2 softtabstop=2
autocmd filetype perl set shiftwidth=8 tabstop=8 softtabstop=8
autocmd filetype javascript, rst set shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype yaml,xml,markdown set shiftwidth=2 tabstop=2 softtabstop=2


""""""""""""""""""""""""""""""""
" Quick edit .vimrc
""""""""""""""""""""""""""""""""
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


""""""""""""""""""""""""""""""""
" Buffers navigation
""""""""""""""""""""""""""""""""
" nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <leader>z :buffers<cr>:b<space>


""""""""""""""""""""""""""""""""
" Split navigation
""""""""""""""""""""""""""""""""
set splitbelow
set splitright
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>


""""""""""""""""""""""""""""""""
" Tab navigation
""""""""""""""""""""""""""""""""
nnoremap <leader>t  :tabnew<CR>:CtrlP<CR>
nnoremap H :tabnext<CR>
nnoremap L :tabprev<CR>


""""""""""""""""""""""""""""""""
" Mouse navigation by page
""""""""""""""""""""""""""""""""
set mouse=a

""""""""""""""""""""""""""""""""
" Debugger commands
""""""""""""""""""""""""""""""""
map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>


""""""""""""""""""""""""""""""""
" Save status between sessions
""""""""""""""""""""""""""""""""
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" set viminfo='10,\"100,:20,%,n~/.viminfo


""""""""""""""""""""""""""""""""
" Disable cursor keys
""""""""""""""""""""""""""""""""
" nnoremap <Up> <nop>
" nnoremap <Down> <nop>
" nnoremap <Left> <nop>
" nnoremap <Right> <nop>
" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>

