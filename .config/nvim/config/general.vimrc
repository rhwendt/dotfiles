" colorscheme
colorscheme dracula

" settings
set autoread
set backspace=indent,eol,start
set background=dark
set breakindent
set colorcolumn=79
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

" python syntax highlight
let g:python_highlight_all = 1
syntax enable
