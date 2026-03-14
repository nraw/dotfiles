return {
	"tpope/vim-dispatch",
	event = "VeryLazy",
	config = function()
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "python",
			command = "let b:dispatch = 'python3 %'",
		})

		-- python errorformat
		vim.o.errorformat = vim.o.errorformat .. [[,%*\sFile "%f"\, line %l\, in %m]]
		vim.o.errorformat = vim.o.errorformat .. [[,%*\sFile "%f"\, line %l]]
		vim.o.errorformat = vim.o.errorformat .. [[,%*\s%f(%l)]]

		function ParseLoguruError(error)
			local parts = vim.fn.split(error, " | ")
			local message = parts[#parts]
			local msg_parts = vim.fn.split(message, ":")
			local file = msg_parts[1]
			local module = msg_parts[2] or ""
			local line = msg_parts[3]
			line = vim.fn.split(line, " ")[1]
			file = string.gsub(file, "%.", "/")
			local error_text = 'File "' .. file .. '.py", line ' .. line .. ", in " .. module
			return error_text
		end

		function CheckLoguru(error)
			local parts = vim.fn.split(error, "|")
			local is_more_than_one = #parts > 2
			return is_more_than_one
		end

		vim.keymap.set("n", "<leader>cp", function()
			local errors = vim.fn.systemlist("pbpaste")
			local qf_list = {}
			local parent_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":h") .. "/"
			local current_folder_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			for i, error in ipairs(errors) do
				if CheckLoguru(error) then
					error = ParseLoguruError(error)
				end
				error = string.gsub(error, "/home/runner/work/.-/", parent_dir, 1) -- Github Actions
				error = string.gsub(error, "/app/src/", parent_dir .. current_folder_name .. "/", 1) -- Splunk
				error = string.gsub(error, "^File", "  File", 1) -- 2 spaces at beginning
				qf_list[i] = error
			end
			local tmpfile = "/tmp/errors.txt"
			vim.fn.writefile(qf_list, tmpfile)
			vim.cmd("cfile " .. tmpfile)
			vim.fn.delete(tmpfile)
		end, { desc = "Paste to Quickfix" })

		vim.keymap.set("n", "<C-q>", "<plug>window:quickfix:loop", { desc = "Quickfix" })
	end,
}
