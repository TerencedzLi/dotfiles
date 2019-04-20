" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has('persistent_undo')
  set undodir=$HOME/.vim/undos/
  set undofile  " keep an undo file (undo changes after closing)
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Custom configurations
syntax enable
set relativenumber
set mouse=a
set statusline+=%F
set autoindent
set laststatus=2

" Setting tabs as spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif