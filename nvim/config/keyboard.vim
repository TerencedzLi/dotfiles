let mapleader = " "

" Save file
nnoremap <c-a> :update<cr>
inoremap <c-a> <Esc>:update<cr>gi

nmap // /<C-R><C-W><CR>

nmap <leader>e :Explore<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Buffer management
map <leader>w :bd<cr>
map <leader>q :q<cr>
map ,m :bn<cr>
map ,n :bp<cr>
map <c-b> :Buffers<cr>
map <leader>gg :Gblame<cr>
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
