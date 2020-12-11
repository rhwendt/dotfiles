filetype off

" Download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Themes
Plug 'rafi/awesome-vim-colorschemes'

" Utility
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "fuzzy finder
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "code completion
Plug 'tpope/vim-commentary' "commenting addon
Plug 'tpope/vim-surround' "change surrounds
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'itchyny/lightline.vim' "colorscheme for status bar
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'terryma/vim-multiple-cursors' "multi line editing
Plug 'christoomey/vim-tmux-navigator' "tmux navigator
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'nathanalderson/yang.vim'

" Syntax
Plug 'janko/vim-test'
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'vim-python/python-syntax'
Plug 'Glench/Vim-Jinja2-Syntax'

call plug#end()

" settings
set autoread
set backspace=indent,eol,start
set background=dark
set breakindent
set colorcolumn=79
set expandtab
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
set shiftwidth=2
set shortmess+=c
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
" ======== end settings ========

" ======== key mappings ========
let mapleader = " "
let g:mapleader = " "

"  vim fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

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

" icrements
nnoremap <A-a> <C-x>
nnoremap <A-q> <C-a>

" fzf checkout
nnoremap <leader>gc :GCheckout<cr>

" resizing splits
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Clear searches
nmap <leader><space> :nohlsearch<cr>

" Tabs
nmap <leader>m :tabclose<cr>
nmap <leader>z :tabprevious<cr>
nmap <leader>c :tabnext<cr>
nmap <leader>x :tabnew<cr>

" Shortcuts for testing
nmap <leader>t :TestFile<cr>
nmap <leader>tn :TestNearest<cr>

" Quickly open buffers and fuzzy find files
nmap <leader>r :Buffers<CR>
nmap <leader>e :FZF<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" copy into system buffer
vnoremap <C-c> "+y<CR>
" ======== end key mappings ========

" ======== coc.nvim ========
" Extensions
let g:coc_global_extensions = [
  \ 'coc-css', 
  \ 'coc-explorer',
  \ 'coc-flutter',
  \ 'coc-html', 
  \ 'coc-json', 
  \ 'coc-prettier', 
  \ 'coc-python',
  \ 'coc-marketplace',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]

" Explorer/Sidebar
nmap <leader>1 :CocCommand explorer<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Floating window scroll support
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

" Persistent yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Autocomplete 
" Remap tab & shift tab for pop out window
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make enter select first item if nothing is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Allow enter to select expanded option
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" ======== end coc.nvim ========

" ======== lightline ========
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

" reload lightline
function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" ======== end lightline ========

" ======== misc ========
" Enable python syntax
let g:python_highlight_all = 1
syntax enable

" color scheme
colorscheme gruvbox

" auto reload vimrc
autocmd BufWritePost .vimrc source %

" auto reload lightline
autocmd BufWritePost .vimrc call LightlineReload()

" ======== end misc ========
