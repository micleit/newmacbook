return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			shade_terminals = true,
			shading_factor = 2,
			direction = "horizontal",
			start_in_insert = true,
		})

		-- Normal mode keymaps
		vim.keymap.set("n", "<leader>t", "<Cmd>ToggleTerm<CR>", { desc = "Toggle Terminal (horizontal)" })
		vim.keymap.set("n", "<leader>i", "<Cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle Terminal (vertical)" })
		vim.keymap.set("n", "<leader>n", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Toggle Terminal (float)" })

		-- Run current file with <leader>r
		vim.keymap.set("n", "<leader>r", function()
			local file = vim.fn.expand("%:p") -- full path to current file
			-- You can add logic for different languages here
			local cmd
			if file:match("%.py$") then
				cmd = "python3 " .. file
			elseif file:match("%.js$") then
				cmd = "node " .. file
			elseif file:match("%.ts$") then
				cmd = "ts-node " .. file
			else
				cmd = "echo 'No runner configured for this filetype'"
			end
			require("toggleterm").exec(cmd, 1) -- send to terminal 1
		end, { desc = "Run current file in terminal" })

		-- Terminal mode keymap to go back to normal mode
	end,
}

