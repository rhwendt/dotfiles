" set the runtimepath
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
filetype off

" Download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" plugins
"
call plug#begin('~/.vim/plugged')

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lifepillar/vim-solarized8'

" Utility
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "fuzzy finder
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "code completion
Plug 'tpope/vim-commentary' "commenting addon
Plug 'tpope/vim-surround' "change surrounds
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'itchyny/lightline.vim' "colorscheme for status bar
Plug 'christoomey/vim-tmux-navigator' "tmux navigator
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Snippets
Plug 'honza/vim-snippets'

" Syntax
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'nathanalderson/yang.vim'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" plugin settings
"
" nvim true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" fzf
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" coc extenstions
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-explorer',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-pyright',
  \ 'coc-prettier',
  \ 'coc-marketplace',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]

" keybinds
"
let mapleader = " "
let g:mapleader = " "

" pyright
nmap <leader>o :CocCommand pyright.organizeimports<CR>

" linting errors
nmap <C-q> :CocList diagnostics<CR>

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
nnoremap <leader>gl :Git log --oneline<CR>
nnoremap <leader>gb :Git blame<cr>
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

" general settings
"
"
" colorscheme solarized8
" set background=light
colorscheme dracula
set background=dark

" settings
set autoread
set backspace=indent,eol,start
set breakindent
set colorcolumn=88
set expandtab
set encoding=UTF-8
set foldlevel=2
set foldmethod=indent
set foldnestmax=10
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linespace=15
set list
set mouse=a
set nobackup
set nocompatible
set noerrorbells
set nofoldenable
set noshowmode
set noswapfile
set number
set relativenumber
set ruler
set scrolloff=8
set shiftwidth=2
set shortmess+=c
set scrolloff=8
set smartcase
set smarttab
set splitbelow splitright
set tabstop=2
set termguicolors
set timeout timeoutlen=500 ttimeoutlen=100
set updatetime=100
set visualbell
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" python stuff
let g:python_highlight_all = 1
let g:python3_host_prog = '/Users/rwendt/.pyenv/versions/3.9.12/bin/python'
syntax enable

" set ttp files as jinja
au BufRead,BufNewFile *.ttp set filetype=jinja

" reload lightline
function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" ======== lightline ========
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }
