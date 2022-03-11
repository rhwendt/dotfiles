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
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

call plug#end()
