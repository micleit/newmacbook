return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "basedpyright", "ansiblels", "html" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.diagnostic.config({
				virtual_text = true,
			})

			vim.lsp.enable("basedpyright")
			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.enable("lua_ls", { capabilities = capabilities })
			vim.lsp.enable("ts_ls", { capabilities = capabilities })
			vim.lsp.enable("ansiblels", { capabilities = capabilities })
			vim.lsp.enable("html", { capabilities = capabilities })

			-- Keymaps with descriptions for which-key
      vim.keymap.set("n", "<leader>vn", function()
    local current = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not current })
    print("LSP Virtual Text: " .. (not current and "ON" or "OFF"))
end, { desc = "Toggle LSP Virtual Text" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover documentation" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action" })
		end,
	},
}

