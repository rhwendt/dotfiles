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

