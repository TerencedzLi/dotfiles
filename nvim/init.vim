source ~/.config/nvim/config/test.vim
source ~/.config/nvim/config/fzf.vim

"=== Options ===
set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set clipboard+=unnamed
set switchbuf+=usetab
set nowrap
set noswapfile
set nobackup
set backspace=2
set mouse=a

"=== Config Files ===
let g:netrw_browse_split=2
let g:netrw_banner = 0

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
Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-endwise'

Plug 'Raimondi/delimitMate'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'sheerun/vim-polyglot'

Plug 'janko-m/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

Plug 'leafgarland/typescript-vim'
" Plug 'alvan/vim-closetag'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-line'
Plug 'machakann/vim-sandwich'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'
Plug 'Shopify/shadowenv.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sainnhe/forest-night'

Plug 'lambdalisue/fern.vim'
call plug#end()

" Important!!
if has('termguicolors')
  set termguicolors
endif
" The configuration options should be placed before `colorscheme forest-night`.
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1

colorscheme forest-night

" Airline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" GitGutter Config
set updatetime=100
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•↑'
let g:gitgutter_sign_modified_removed = '•'

" === Ale ===
" Set specific linters
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['prettier'],
      \}
let g:ale_fixers = {'ruby': ['rubocop']}
let g:ale_fix_on_save = 1

" === YouCompleteMe ===
fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

autocmd FileType javascript,typescript,python :call GoYCM()

" === Closetag ===
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js'

"=== Keyboard ===
let mapleader = " "

" Save file
nnoremap <c-a> :update<cr>
inoremap <c-a> <Esc>:update<cr>gi

nmap // /<C-R><C-W><CR>

nmap <leader>e :Explore<CR>
" nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pv :Fern . -reveal=% -drawer<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Buffer management
map <leader>w :bd<cr>
map <leader>q :q<cr>
map <c-b> :Buffers<cr>
map <leader>gg :Gblame<cr>

nmap <leader>h :bp<cr>
nmap <leader>l :bn<cr>
nmap <leader>bq :bp <BAR> bd #<CR>
map <leader>j mJ
map <leader>k mK


" Search currently selected words
vmap <CR> y/<C-R>"<CR>
vmap <C-f> y:Rg <C-R>"

nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
vnoremap p "_dP

nmap ,v :vsplit<cr>

" Ruby
nmap <leader>m ]m
nmap <leader>M [m

" Python
au BufNewFile,BufRead *.py
      \ set tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ textwidth=79
      \ expandtab
      \ autoindent
      \ fileformat=unix

" Remove highlighted search terms
nmap <BS> :noh<CR>

" Open config files
map <leader>so :source $MYVIMRC<CR>
nmap <leader>tm :tabnew ~/.tmux.conf<CR>
nmap <leader>vr :tabnew $MYVIMRC<CR>

" Fzf
" File search
nnoremap <C-p> :Files<CR>
imap <S-Tab> <plug>(fzf-complete-line)

" Word Search
nmap <C-f> :Rg <C-R><C-W>
nmap ,f :Rg!<space>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
noremap <leader>= :wincmd =<cr>

"=== Window Resizing ===
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Genereate tags
nmap <leader>t :Tags<CR>

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
