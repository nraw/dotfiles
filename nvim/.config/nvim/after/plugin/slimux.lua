-- Slimux
-- Slimux options
vim.g.slimux_select_from_current_window = 1
vim.keymap.set("n", "<leader>s", ":SlimuxREPLSendLine<CR>")
vim.keymap.set("v", "<leader>s", ":SlimuxREPLSendSelection<CR>")
vim.keymap.set("n", "<leader>eq", ":SlimuxGlobalConfigure<CR>")
vim.keymap.set("n", "<Leader>ew", ":norm viw s<CR>")
vim.keymap.set("n", "<Leader>e=", ":norm ^f=wv$h s<CR>")
vim.keymap.set("n", "<Leader>eb", ":SlimuxREPLSendBuffer<CR>")

-- Python Slimux
local python_slimux_group = vim.api.nvim_create_augroup("python_slimux", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "python",
	group = python_slimux_group,
	callback = function()
		vim.keymap.set("n", "<Leader>ee", ":norm ^viW s<CR>")
		vim.keymap.set("n", "<Leader>e?", ":call SlimuxSendCommand(expand('<cword>') . '??')<CR>")
		vim.keymap.set("n", "<Leader>ec", ":call SlimuxSendCommand(expand('<cword>') . '.columns')<CR>")
		vim.keymap.set("n", "<Leader>ed", ":call SlimuxSendCommand('%debug')<CR>")
		vim.keymap.set("n", "<Leader>eh", ":call SlimuxSendCommand(expand('<cword>') . '.head()')<CR>")
		vim.keymap.set("n", "<Leader>ei", ":call SlimuxSendCommand(expand('<cword>') . '.info()')<CR>")
		vim.keymap.set("n", "<Leader>ek", ":call SlimuxSendCommand(expand('<cword>') . '.keys()')<CR>")
		vim.keymap.set("n", "<Leader>el", ":call SlimuxSendCommand('len(' . expand('<cword>') . ')')<CR>")
		vim.keymap.set("n", "<Leader>en", ":call SlimuxSendCommand('next(iter(' . expand('<cword>') . '))')<CR>")
		vim.keymap.set("n", "<Leader>ep", ":call SlimuxSendCommand(getline('.') . 'pass')<CR>")
		vim.keymap.set("n", "<Leader>eP", [[:call SlimuxSendCommand(getline('.') . 'print("hi")')<CR>]])
		vim.keymap.set("n", "<Leader>er", ":call SlimuxSendCommand('%run ' . expand('%'))<CR>")
		vim.keymap.set("n", "<Leader>es", ":call SlimuxSendCommand(expand('<cword>') . '.size()')<CR>")
		vim.keymap.set("n", "<Leader>e1", ":call SlimuxSendCommand(expand('<cword>') . '.iloc[0]')<CR>")
		vim.keymap.set("n", "<Leader>e_", ":call SlimuxSendCommand(expand('<cword>') . ' = _')<CR>")
		vim.keymap.set("n", "<Leader>eF", ":norm V[[O][ s<CR>")
		vim.keymap.set("n", "<Leader>ef", ":norm V[[%jO][k s<CR>")
		vim.keymap.set("n", "<Leader>ea", [[/if __name__ == "__main__":<CR> <bar> kVgg :SlimuxREPLSendSelection<CR>]])
		vim.keymap.set(
			"n",
			"<Leader>ev",
			":call SlimuxSendCommand('from visidata import vd; vd.view_pandas(' . expand('<cword>') . ')')<CR>"
		)
	end,
})

local sh_slimux_group = vim.api.nvim_create_augroup("sh_slimux", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "sh",
	group = sh_slimux_group,
	callback = function()
		vim.keymap.set("n", "<Leader>ee", ":call SlimuxSendCommand('echo $'.expand('<cword>'))<CR>")
	end,
})
