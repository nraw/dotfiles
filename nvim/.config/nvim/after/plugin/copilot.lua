vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = { markdown = true }
vim.api.nvim_set_keymap("i", "<Right>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("i", "<Down>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<Up>", "<Plug>(copilot-previous)")
