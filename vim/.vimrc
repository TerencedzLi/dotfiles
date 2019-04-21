" Get the defaults that most users want.
filetype off

" Vundle package manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

filetype plugin indent on

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
endif " has("autocmd")

" Custom configurations
syntax enable
set number
set relativenumber
set mouse=a
set statusline+=%F
set autoindent
set laststatus=2

" Setting tabs as spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Setting CtrlP to use ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""' 
  let g:ctrlp_use_caching = 0
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
endif

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
