local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local sources = {
	formatting.black.with({ extra_args = { "--line-length=88" } }),
	formatting.isort.with({ extra_args = { "--profile", "black" } }),
	formatting.jq,
	formatting.djlint,
	formatting.eslint,
	formatting.stylua,
	formatting.terraform_fmt,
	-- formatting.textlint,
	formatting.xmllint,
	formatting.yamlfmt,
	formatting.markdownlint,
	diagnostics.ansiblelint,
	diagnostics.buf,
	diagnostics.djlint,
	diagnostics.eslint,
	diagnostics.flake8.with({
		extra_args = {
			"--max-line-length=88",
			"--ignore=E501,E203,W503,W292",
			"--select=C,E,F,W,B,B950",
		},
	}),
	diagnostics.hadolint,
	diagnostics.mypy,
	diagnostics.markdownlint,
	diagnostics.misspell,
	diagnostics.commitlint,
	diagnostics.jsonlint,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = sources,
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function()
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
