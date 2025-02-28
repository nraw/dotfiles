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
local slimux_group = vim.api.nvim_create_augroup("python_slimux", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "python",
	group = slimux_group,
	callback = function()
		vim.keymap.set("n", "<Leader>ee", ":norm ^viW s<CR>", { buffer = true })
		vim.keymap.set("n", "<Leader>e?", ":call SlimuxSendCommand(expand('<cword>') . '??')<CR>", { buffer = true })
		vim.keymap.set(
			"n",
			"<Leader>ec",
			":call SlimuxSendCommand(expand('<cword>') . '.columns')<CR>",
			{ buffer = true }
		)
		vim.keymap.set("n", "<Leader>ed", ":call SlimuxSendCommand('%debug')<CR>", { buffer = true })
		vim.keymap.set(
			"n",
			"<Leader>eH",
			":call SlimuxSendCommand('from pathlib import Path; Path(\"/tmp/temp.html\").write_text(' . expand('<cword>') . '.text)')<CR>",
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>eh",
			":call SlimuxSendCommand(expand('<cword>') . '.head()')<CR>",
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>ei",
			":call SlimuxSendCommand(expand('<cword>') . '.info()')<CR>",
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>ek",
			":call SlimuxSendCommand(expand('<cword>') . '.keys()')<CR>",
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>el",
			":call SlimuxSendCommand('len(' . expand('<cword>') . ')')<CR>",
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>en",
			":call SlimuxSendCommand('next(iter(' . expand('<cword>') . '))')<CR>",
			{ buffer = true }
		)
		vim.keymap.set("n", "<Leader>ep", ":call SlimuxSendCommand(getline('.') . 'pass')<CR>", { buffer = true })
		vim.keymap.set(
			"n",
			"<Leader>eP",
			[[:call SlimuxSendCommand(getline('.') . 'print("hi")')<CR>]],
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>er",
			":call SlimuxSendCommand('print(' . expand('<cword>') . ')')<CR>",
			{ buffer = true }
		)
		vim.keymap.set("n", "<Leader>eR", ":call SlimuxSendCommand('%run ' . expand('%'))<CR>", { buffer = true })
		vim.keymap.set(
			"n",
			"<Leader>es",
			":call SlimuxSendCommand(expand('<cword>') . '.size()')<CR>",
			{ buffer = true }
		)
		vim.keymap.set("n", "<Leader>e1", ":call SlimuxSendCommand(expand('<cword>') . '[0]')<CR>", { buffer = true })
		vim.keymap.set(
			"n",
			"<Leader>e2",
			":call SlimuxSendCommand(expand('<cword>') . '.iloc[0]')<CR>",
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>em",
			":call SlimuxSendCommand(expand('<cword>') . '.model_dump()')<CR>",
			{ buffer = true }
		)
		vim.keymap.set("n", "<Leader>e_", ":call SlimuxSendCommand(expand('<cword>') . ' = _')<CR>", { buffer = true })
		vim.keymap.set("n", "<Leader>eF", ":norm V[[O][ s<CR>", { buffer = true })
		vim.keymap.set("n", "<Leader>ef", ":norm V[[%jO][k s<CR>", { buffer = true })
		vim.keymap.set(
			"n",
			"<Leader>ea",
			[[/if __name__ == "__main__":<CR> <bar> kVgg :SlimuxREPLSendSelection<CR>]],
			{ buffer = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>ev",
			":call SlimuxSendCommand('from visidata import vd; vd.view_pandas(' . expand('<cword>') . ')')<CR>",
			{ buffer = true }
		)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "sh",
	group = slimux_group,
	callback = function()
		vim.keymap.set("n", "<Leader>ee", ":call SlimuxSendCommand('echo $'.expand('<cword>'))<CR>", { buffer = true })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "lua",
	group = slimux_group,
	callback = function()
		vim.keymap.set("n", "<Leader>ee", function()
			local word = vim.fn.expand("<cword>")
			local command = "lua print(vim.inspect(" .. word .. "))"
			vim.cmd(command) -- doesn't work. only prints last line
		end, { buffer = true })
	end,
})
