-- Crontab bug
local cron_group = vim.api.nvim_create_augroup("crontab", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "crontab",
	group = cron_group,
	command = "setlocal nobackup nowritebackup",
})

-- Copy current path
vim.api.nvim_create_user_command("CopyPath", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
end, {})

-- Prettify JSON
vim.api.nvim_create_user_command("Json", function()
	vim.api.nvim_exec(":%!python3 -m json.tool", true)
end, {})

-- Go to RC
vim.api.nvim_create_user_command("RC", ":edit ~/dotfiles/nvim/.config/nvim/init.lua", {})

-- Add current date
vim.api.nvim_create_user_command("Date", ":r !date +'%F'", {})

-- function write_here(text)
--   local pos = vim.api.nvim_win_get_cursor(0)[2]
--   local line = vim.api.nvim_get_current_line()
--   local nline = line:sub(0, pos) .. text .. line:sub(pos + 1)
--   vim.api.nvim_set_current_line(nline)
-- end

vim.api.nvim_create_user_command(
	"Event",
	function()
		local command_output = assert(
			io.popen(
				[[icalBuddy -n -li 1 -ps '/ | /' -b '\# ' -nnr -ea -nc -eed -nrd -tf '\%Y-\%b-\%d' -iep title,datetime,attendees -po title,datetime eventsToday]]
			)
		)
		local next_event = command_output:read("*a")
		next_event = string.gsub(next_event, "\n", "")
		next_event = string.gsub(next_event, "\\#", "#")
		local pos = vim.api.nvim_win_get_cursor(0)[2]
		local line = vim.api.nvim_get_current_line()
		local nline = line:sub(0, pos) .. next_event .. line:sub(pos + 1)
		vim.api.nvim_set_current_line(nline)
		-- write_here(next_event)
	end,
	-- ":read !icalBuddy -n -li 1 -ps '/ | /' -b '# ' -nnr -ea -nc -eed -nrd -tf '%Y-%b-%d' -iep title,datetime,attendees -po title,datetime eventsToday",
	{}
)
