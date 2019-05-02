" Get the defaults that most users want.
filetype off

" Install plugins
  if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    auto VimEnter * PlugInstall
  endif
              
" Vim-Plug package manager
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'

call plug#end()

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

  " Close quickfix window when selecting
  autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
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
set tags=./tags;

" Setting tabs as spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Fzf Config
nnoremap <C-p> :Files<cr>
set grepprg=rg\ --vimgrep
nnoremap K :execute 'grep! "\b"'.expand("<cword>").'"\b"'<CR>:cw<CR>
let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case  --follow --color "always" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command . shellescape(<q-args>), 1, <bang>0)

nmap <leader>vr :sp $MYVIMRC<cr>
map <leader>so :source $MYVIMRC<cr>
map <leader>n :bn<cr> 
map <leader>w :bd<cr>

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
