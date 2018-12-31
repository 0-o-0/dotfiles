set nocompatible              " be iMproved, required
filetype off                  " required


" ========== Vundle ==========
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Language agnostic plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/fzf.vim'
Plugin 'valloric/youcompleteme'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ========== General ==========
set clipboard=unnamed " use the OS clipboard by default
set history=10000 " store more of :cmdline history
set backspace=indent,eol,start " allow backspace in insert mode
let mapleader = ","


" ========== Indentation ==========
set nowrap " do not wrap lines


" ========== Color ==========
set t_Co=256
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans=1


" ========== Search ==========
set hlsearch   " hightlight searches
set incsearch  " highlight dynamically as we type
set ignorecase " ignore case when searching
set smartcase  " ...unless we type a capital


" ========== Context ==========
set number relativenumber " enable hybrid line number
set cursorline " highlight current line
set ruler
set showmode
set title
set showcmd
set scrolloff=8
set wildmenu
set wildmode=longest:list,full

" ========== Misc ==========
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" Permanent undo
set undodir=~/.vimdid
set undofile

" Open help page on the right
autocmd FileType help wincmd L


" ========== Plugin Specific ==========
" FZF
" set the runtime path to include fzf
set rtp+=/usr/local/opt/fzf
" add Rg command to search using ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:70%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files!<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>R :Rg!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>B :Buffers!<CR>
nnoremap <leader>* :Rg! <C-R><C-W><CR>

" Rustfmt
let g:rustfmt_autosave = 1

" Racer
let g:racer_cmd = "/Users/lcq/.cargo/bin/racer"
let g:racer_experimental_completer = 1 " show arguments and return types

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" ALE
let g:ale_linters = {'rust': ['cargo']}
let g:ale_completion_enabled = 0
let g:ale_rust_cargo_check_tests = 1
let g:airline#extensions#ale#enabled = 1
nnoremap <silent> K <Plug>(ale_hover)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-]> <Plug>(ale_go_to_definition)
