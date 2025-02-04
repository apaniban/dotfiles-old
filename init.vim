call plug#begin('~/.config/nvim/bundle')
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'neovimhaskell/haskell-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'evanleck/vim-svelte'
Plug 'andys8/vim-elm-syntax'
" call PlugInstall to install new plugins
call plug#end()
let mapleader=","
" Set tab to 2 spaces
filetype plugin indent on
set number
set tabstop=2
set shiftwidth=2
set expandtab
" Set copy and paste from buffer
set clipboard=unnamed
set cc=100
set ignorecase
set smartcase
set wrap!
set relativenumber
set number
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set termguicolors
set shortmess+=c
" gitgutter config
set updatetime=300
set signcolumn=yes
" Gruvbox config
let g:gruvbox_italic=1
let g:gruvbox_color_column = 'purple'
colorscheme gruvbox
" Deoplete
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Hightlight color for trailing spaces
highlight ExtraWhitespace ctermbg=DarkRed
" NerdTree
map <leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Set tab to 2 spaces
filetype plugin indent on
set number
set tabstop=2
set shiftwidth=2
set expandtab
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap \ :Rg<SPACE>
nnoremap <C-p> :Files<CR>

