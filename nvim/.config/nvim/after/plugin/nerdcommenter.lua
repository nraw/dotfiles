-- NERDCommenter
-- NERDCOmmenter options
vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters by default
vim.g.NERDDefaultAlign = "left"

-- Disable the default NERDCommenter mappings
vim.g.NERDCreateDefaultMappings = 0

-- Remap the toggle comment shortcut to <leader>c in normal and visual modes
vim.keymap.set("n", "<leader>c<space>", "<Plug>NERDCommenterToggle", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>c<space>", "<Plug>NERDCommenterToggle<CR>", { noremap = true, silent = true })
