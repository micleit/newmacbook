return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.prettier,
			},
		})

		-- Leader + gf to format the current buffer using LSP / null-ls
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer (LSP / null-ls)" })
	end,
}
