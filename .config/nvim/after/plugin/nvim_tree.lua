local M = {}
local api = require("nvim-tree.api")

function M.on_attach(bufnr)
	-- make tab open/close items
	vim.keymap.set(
		"n",
		"<TAB>",
		api.node.open.edit,
		{ desc = "Open", buffer = bufnr, noremap = true, silent = true, nowait = true }
	)
	vim.keymap.set(
		"n",
		"<CR>",
		api.node.open.edit,
		{ desc = "Open", buffer = bufnr, noremap = true, silent = true, nowait = true }
	)
end

function M.print_node_path()
	local node = api.tree.get_node_under_cursor()
	print(node.absolute_path)
end

require("nvim-tree").setup({
	on_attach = M.on_attach,
	--
	view = {
		adaptive_size = true,
	},
	renderer = {
		group_empty = false,
	},
	filters = {
		dotfiles = true,
	},
})
