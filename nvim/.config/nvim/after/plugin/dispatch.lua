-- Dispatch
-- Dispatch options
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "python",
	command = "let b:dispatch = 'python3 %'",
})
-- python
vim.o.errorformat = vim.o.errorformat .. [[,%*\sFile "%f"\, line %l\, in %m]]
vim.o.errorformat = vim.o.errorformat .. [[,%*\sFile "%f"\, line %l]]
vim.o.errorformat = vim.o.errorformat .. [[,%*\s%f(%l)]]
-- loguru
-- vim.o.errorformat = vim.o.errorformat .. [[,%t%*[^|]|%m %f:%l]]
-- Dispatch maps
vim.keymap.set("n", "<leader>cp", function()
	local errors = vim.fn.systemlist("pbpaste")
	local qf_list = {}
	local parent_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":h") .. "/"
	local current_folder_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	for i, error in ipairs(errors) do
		error = string.gsub(error, "/home/runner/work/.-/", parent_dir, 1)                 -- Github Actions
		error = string.gsub(error, "/app/src/", parent_dir .. current_folder_name .. "/", 1) -- Splunk
		error = string.gsub(error, "^File", "  File", 1)                                   -- 2 spaces at beginning
		qf_list[i] = error
	end
	-- vim.fn.setqflist(qf_list)
	local tmpfile = "/tmp/errors.txt"
	vim.fn.writefile(qf_list, tmpfile)
	vim.cmd("cfile " .. tmpfile)
	vim.fn.delete(tmpfile)
end, { desc = "Paste to Quickfix" })
-- Doesn't work
vim.keymap.set("n", "<C-q>", "<plug>window:quickfix:loop", { desc = "Quickfix" })
