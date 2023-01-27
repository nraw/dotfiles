-- VimWiki
-- Vimwiki options
vim.g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } }
vim.g.vimwiki_global_ext = 0 -- Removes <CR> behaviour from random md files
vim.g.vimwiki_table_mappings = 0

-- Vimwiki commands
vim.api.nvim_create_user_command("Diary", "VimwikiDiaryIndex", {})

-- Vimwiki maps
local vimwiki_group = vim.api.nvim_create_augroup("vimwiki", { clear = true })
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{ pattern = "diary.md", group = vimwiki_group, command = "VimwikiDiaryGenerateLinks" }
)
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*/vimwiki/**",
	group = vimwiki_group,
	command = [[execute ':silent ! cd ~/vimwiki && nohup $(if git rev-parse --git-dir > /dev/null 2>&1 ; then git add . && git commit -m "Auto-commit: saved %" && git push; fi > /dev/null 2>&1) &']],
})
