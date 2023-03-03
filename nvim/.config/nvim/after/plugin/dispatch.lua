-- Dispatch
-- Dispatch options
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "python",
	command = "let b:dispatch = 'python3 %'",
})
vim.o.errorformat = vim.o.errorformat .. [[,%*\sFile "%f"\, line %l\, %m]]
vim.o.errorformat = vim.o.errorformat .. [[,%*\sFile "%f"\, line %l]]
vim.o.errorformat = vim.o.errorformat .. [[,%*\s%f(%l)]]
-- Dispatch maps
vim.keymap.set("n", "<leader>cp", ":cexpr system('pbpaste')<CR>", { desc = "Paste to Quickfix" })
-- Doesn't work
vim.keymap.set("n", "<Bslash>", "<plug>window:quickfix:loop", { desc = "Quickfix" })
