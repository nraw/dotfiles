-- Personal
-- Perosnal maps
-- Fmake
vim.keymap.set("n", "<leader>kn", ":.w !xargs -I _ fmake _ <CR>", { desc = "fmake" })

-- kubesync
function KubeSync()
	vim.cmd([[Start! ks %]])
	local kube_group = vim.api.nvim_create_augroup("kubesync", {})
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = vim.fn.expand("%:p:h:h") .. "*",
		group = kube_group,
		callback = KubeSync,
	})
end
vim.keymap.set("n", "<leader>ks", KubeSync)

-- OCR
vim.api.nvim_create_user_command("OCR", ":r !ocr", {})

-- Save pic -- make more robust maybe
vim.api.nvim_create_user_command("Pic", function(args)
	local pic_name = args["args"]
	local command = "save_pic " .. pic_name
	print(command)
	local command_output = assert(io.popen(command))
	local pic_link = command_output:read("*a")
	pic_link = string.gsub(pic_link, "\n", "")
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local nline = line:sub(0, pos) .. pic_link .. line:sub(pos + 1)
	vim.api.nvim_set_current_line(nline)
end, { nargs = 1 })
