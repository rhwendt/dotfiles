-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.go.background = "dark"
vim.g.python3_host_prog = "$HOME/.pyenv/versions/$(pyenv global)/bin/python"
vim.opt.colorcolumn = "88"

-- disable ai crap
vim.g.ai_cmp = false
