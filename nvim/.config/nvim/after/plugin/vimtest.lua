-- vim-test
-- vim-test options
vim.g["test#strategy"] = "slimux"
vim.g["test#python#runner"] = "pytest"
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
