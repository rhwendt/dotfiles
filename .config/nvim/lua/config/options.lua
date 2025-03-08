-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local handle = io.popen("pyenv global", "r")
if handle ~= nil then
  local output = handle:read("*a")
  io.close(handle)
  output = output:gsub("\n[^\n]*$", "")
  vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/" .. output .. "/bin/python"
end
vim.go.background = "dark"
vim.opt.colorcolumn = "88"
vim.opt.updatetime = 50

-- disable ai crap
vim.g.ai_cmp = false
