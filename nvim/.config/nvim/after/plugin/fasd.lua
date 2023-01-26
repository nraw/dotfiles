-- fasd
-- fasd commands

local function fasd_update()
	if (vim.o.buftype == "") or (vim.o.filetype == "dirvish") then
		io.popen("fasd -A " .. vim.fn.expand("%:p"))
	end
end

local fasd_group = vim.api.nvim_create_augroup("fasd", {})
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufFilePost" }, {
	pattern = "*",
	group = fasd_group,
	callback = fasd_update,
})

vim.api.nvim_create_user_command("FASD", function()
	vim.fn["fzf#run"](vim.fn["fzf#wrap"]({ source = "fasd -al", options = "--no-sort --tac --tiebreak=index" }))
end, {})
