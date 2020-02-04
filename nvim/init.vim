"=== Appearance ===
set number
set termguicolors

"=== Config Files ===
map <leader>so :source $MYVIMRC<CR>
nmap <leader>tm :tabnew ~/.tmux.conf<CR>
nmap <leader>vr :tabnew $MYVIMRC<CR>

"=== Mappings ==
nnoremap <c-a> :update<cr>
inoremap <c-a> <Esc>:update<cr>gi

nmap // /<C-R><C-W><CR>
nnoremap <c-n> :nohlsearch<cr>

nmap <leader>e :Explore<CR>

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set cc=120

map <leader>w :bd<cr>
map ,n :bp<cr>
map ,m :bn<cr>
map <c-b> :Buffers<cr>

vmap <CR> y/<C-R>"<CR>
vmap <C-f> y:Rg <C-R>"
"=== File Search ===
nnoremap <C-p> :Files<CR>

"=== Word Search ===
nmap <C-f> :Rg <C-R><C-W>
nmap ,f :Rg!<space>

" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

command! -bang -nargs=* Rg
   \ call fzf#vim#grep(
   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
   \   <bang>0 ? fzf#vim#with_preview('up:60%')
   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
   \   <bang>0)

nmap <leader>t :Tags<CR>

"=== Window Resizing ===
 " automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
noremap <leader>= :wincmd =<cr>

"=== Plugins ===
"
" Install Plugin Manager
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'janko-m/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'leafgarland/typescript-vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-line'
Plug 'machakann/vim-sandwich'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'bluz71/vim-nightfly-guicolors'
call plug#end()

colorscheme nightfly

" === Plugin Config ===

" Airline theme
let g:airline_theme='nightfly'
let g:airline#extensions#tabline#enabled = 1

" GitGutter Config
set updatetime=100
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•↑'
let g:gitgutter_sign_modified_removed = '•'

" === Test Config vim-test ===
let test#strategy = "vimux"
if !empty(glob("./dev.yml"))
  let test#ruby#rspec#executable = 'dev t'
  let test#ruby#rails#executable = 'dev t'
endif

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
