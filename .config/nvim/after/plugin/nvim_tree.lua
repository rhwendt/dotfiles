require("nvim-tree").setup({
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
