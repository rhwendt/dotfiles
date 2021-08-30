let mapleader = " "
let g:mapleader = " "

" pyright
nmap <leader>o :CocCommand pyright.organizeimports<CR>

" bind escape key
inoremap kj <Esc>
vnoremap kj <Esc>
cnoremap kj <C-C><Esc>

" fast commenting
nmap <C-_> :Commentary<cr>
vmap <C-_> :Commentary<cr>

" Quick write/quits
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Easier keybinds for window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Splits
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>

" increments
nnoremap <A-q> <C-a>
nnoremap <A-a> <C-x>

" fzf checkout
nnoremap <leader>gc :GCheckout<cr>

" fix indent in entire file
nnoremap <leader>= gg<cr>=G<cr>

" resizing splits
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Clear searches
nmap <leader><space> :nohlsearch<cr>

" Quickly open buffers and fuzzy find files
nmap <leader>r :Buffers<CR>
nmap <leader>e :FZF<CR>

" copy into system buffer
vnoremap <C-c> "+y<CR>

" Explorer/Sidebar
nmap <leader>1 :CocCommand explorer<CR>

" fugitive stuffs
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent>gy :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Quickly restart coc.nvim
nmap <leader>cr :CocRestart<cr>

" coc-snippets
nmap <leader>cs :CocList snippets<cr>
imap <leader><Tab> <Plug>(coc-snippets-expand)

" Autocomplete
" Remap tab & shift tab for pop out window
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make enter select first item if nothing is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Allow enter to select expanded option
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" semshi stuffs
nmap <silent> <leader>nn :Semshi rename<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>
