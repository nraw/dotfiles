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

function ParseLoguruError(error)
	-- 2024-09-06 12:26:21.254 | INFO | {'id': 'system', 'session_id': 'S000'} | project_aurora_middlware.web.api.check_meeting_status.views:check_meeting_status:33 checking meeting status
	local parts = vim.fn.split(error, " | ")
	local message = parts[#parts]
	local msg_parts = vim.fn.split(message, ":")
	local file = msg_parts[1]
	local module = msg_parts[2]
	local line = msg_parts[3]
	line = vim.fn.split(line, " ")[1]
	file = string.gsub(file, "%.", "/")
	-- combine again into one text
	local error_text = 'File "' .. file .. '.py", line ' .. line .. ", in " .. module
	return error_text
end

-- Check if number of "\" in the error is 2 or more
function CheckLoguru(error)
	local parts = vim.fn.split(error, "|")
	local is_more_than_one = #parts > 2
	return is_more_than_one
end

-- Dispatch maps
vim.keymap.set("n", "<leader>cp", function()
	local errors = vim.fn.systemlist("pbpaste")
	local qf_list = {}
	local parent_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":h") .. "/"
	local current_folder_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	for i, error in ipairs(errors) do
		if CheckLoguru(error) then
			error = ParseLoguruError(error)
		end
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
