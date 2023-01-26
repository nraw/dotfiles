-- Fugitive
-- Fugitive options
vim.g.github_enterprise_urls = { "https://githuben.intranet.mckinsey.com" }
vim.g.fugitive_gitlab_domains = { "https://git.msv.mckinsey.com", "https://gitlab.tools.leapx.digital" }
-- Fugitive maps
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit!<CR>")
vim.keymap.set("n", "<leader>P", ":Git push<CR>")
vim.keymap.set("n", "<leader>p", ":Git pull<CR>")

local hidden_group = vim.api.nvim_create_augroup("Hidden", { clear = true })
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{ pattern = "Fugitive://*", group = hidden_group, command = "set bufhidden=delete" }
)
