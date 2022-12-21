vim.g.mapleader = " "
vim.keymap.set("n", "<leader>1", vim.cmd.Explore)

-- bind escape key
vim.keymap.set({ "i", "v", "c" }, "kj", "<Esc>")

-- navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- quick write/quits
vim.keymap.set("n", "<leader>w", ":w!<cr>")
vim.keymap.set("n", "<leader>q", vim.cmd.quit)

-- increments
vim.keymap.set("n", "<A-q>", "<C-a>")
vim.keymap.set("n", "<A-a>", "<C-x>")

-- fix indents on entire file
vim.keymap.set("n", "<leader>=", "gg<cr>=G<cr>")

-- resizig
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<cr>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<cr>", { silent = true })
vim.keymap.set("n", "<C-Up>", ":resize +3<cr>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -3<cr>", { silent = true })

-- sick remap
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- system buffer pasting
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- quick fix window
vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")

-- clear searches
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>")
