-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i", "v", "c" }, "kj", "<Esc>")

-- quick write/quits
vim.keymap.set("n", "<leader>w", ":w!<cr>")
vim.keymap.set("n", "<leader>q", vim.cmd.quit)

-- increments
vim.keymap.set("n", "<A-q>", "<C-a>")
vim.keymap.set("n", "<A-a>", "<C-x>")

-- sick remap
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clear searches
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>")

-- Commentary
vim.keymap.set({ "n", "v" }, "<C-_>", ":Commentary<cr>")
