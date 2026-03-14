return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.cmd("call FugitiveDetect(getcwd())") -- needed for Twiggy

			vim.g.github_enterprise_urls = { "org-62409820@github.com:" }
			vim.g.fugitive_gitlab_domains = { "https://git.msv.mckinsey.com", "https://gitlab.tools.leapx.digital" }

			vim.keymap.set("n", "<leader>gd", ":Gdiffsplit!<CR>")
			vim.keymap.set("n", "<leader>P", ":Git push<CR>")
			vim.keymap.set("n", "<leader>FP", ":Git push --force<CR>")
			vim.keymap.set("n", "<leader>p", ":Git pull<CR>")

			local hidden_group = vim.api.nvim_create_augroup("Hidden", { clear = true })
			vim.api.nvim_create_autocmd(
				{ "BufRead", "BufNewFile" },
				{ pattern = "Fugitive://*", group = hidden_group, command = "set bufhidden=delete" }
			)

			local gitcommit_group = vim.api.nvim_create_augroup("gitcommit_group", {})
			vim.api.nvim_create_autocmd({ "FileType" }, {
				pattern = "gitcommit",
				group = gitcommit_group,
				callback = function()
					vim.keymap.set("n", "<Leader>c", ":Llm commit<CR>", { buffer = true })
				end,
			})
		end,
	},
	{ "tpope/vim-rhubarb" },
	{ "shumphrey/fugitive-gitlab.vim", dependencies = { "tpope/vim-fugitive" }, event = "VeryLazy" },
	{ "sodapopcan/vim-twiggy", dependencies = { "tpope/vim-fugitive" }, cmd = "Twiggy" },
	{ "junegunn/gv.vim", cmd = "GV" },
}
