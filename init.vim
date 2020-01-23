call plug#begin('~/.config/nvim/bundle')
Plug 'preservim/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
" call PlugInstall to install new plugins
call plug#end()

let mapleader=","

" Set copy and paste from buffer
set clipboard=unnamed
set cc=100

" Gruvbox config
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic=1
let g:gruvbox_color_column = 'purple'
colorscheme gruvbox

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
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
