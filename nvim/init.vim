"=== Appearance ===
set number

"=== Config Files ===
map <leader>so :source $MYVIMRC<CR>
nmap <leader>tm :tabnew ~/.tmux.conf<CR>
nmap <leader>vr :tabnew $MYVIMRC<CR>

"=== Mappings ===
nnoremap <c-a> :update<cr>
inoremap <c-a> <Esc>:update<cr>gi

nmap // /<C-R><C-W><CR>
nnoremap <c-n> :nohlsearch<cr>

map <leader>w :bd<cr>
map ,n :bn<cr>
map ,m :bn<cr>

"=== File Search ===
nnoremap <C-p> :Files<CR>

"=== Word Search ===
nmap <C-f> :Rg <C-R><C-W>
nmap ,f :Rg!<space>

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
Plug 'tpope/vim-fugitive'
Plug 'janko-m/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'pgr0ss/vimux-ruby-test'
Plug 'leafgarland/typescript-vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-line'
Plug 'nelstrom/vim-textobj-rubyblock'
call plug#end()

" === Plugin Config ===

" GitGutter Config
set updatetime=100
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•↑'
let g:gitgutter_sign_modified_removed = '•'
