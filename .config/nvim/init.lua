-- Options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent= true

vim.cmd("set number")

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- set leader to space

-- make sure <Space> still works as space in insert mode
vim.keymap.set("i", "<Space>", "<Space>", { noremap = true })

-- Lazy.nvim bootstrap + setup
require("config.lazy")

-- Load plugins
require("lazy").setup("plugins")

-- Example mappings that aren’t plugin-specific
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
