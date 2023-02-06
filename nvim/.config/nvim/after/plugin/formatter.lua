-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").isort,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
	},
})

local formatter_group = vim.api.nvim_create_augroup("formatter", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, { pattern = "*", group = formatter_group, command = "FormatWrite" })
