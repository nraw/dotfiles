-- ALE
-- ALE Options
vim.g.ale_lint_on_enter = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_text_changed = "always"
vim.g.ale_echo_msg_format = "%linter% | %severity% | %s "
-- ALE Linters and Fixers
vim.g.ale_linters = { lua = { "luacheck" } }
vim.g.ale_fixers = {
	python = { "black", "isort" },
	lua = { "stylua" },
	sh = { "shfmt" },
	yaml = { "prettier" },
	css = { "prettier" },
	javascript = { "prettier" },
	html = { "prettier" },
	sql = { "sqlfmt" },
	markdown = { "prettier" },
}

-- ALE Keymaps
-- vim.keymap.set("n", "]e", ":ALENextWrap<CR>", { silent = true })
-- vim.keymap.set("n", "[e", ":ALEPreviousWrap<CR>", { silent = true })
-- vim.keymap.set("n", "[E", ":ALEFirst<CR>", { silent = true })
-- vim.keymap.set("n", "]E", ":ALELast<CR>", { silent = true })

-- ALE Commands
-- vim.api.nvim_create_user_command("ALEDisableFixers", function()
--   vim.g.ale_fix_on_save = 0
-- end, {})
-- vim.api.nvim_create_user_command("ALEEnableFixers", function()
--   vim.g.ale_fix_on_save = 1
-- end, {})

-- ALE Specific Linter options
vim.g.ale_python_flake8_options = "--max-line-length=100"
vim.g.ale_lua_luacheck_options = "--globals vim"
vim.g.ale_css_stylelint_use_global = 1
vim.g.ale_css_stylelint_options = "--config ~/.config/.stylelintrc.json"
vim.g.ale_javascript_eslint_use_global = 1
vim.g.ale_javascript_eslint_options = "--config ~/.config/.eslintrc.json"
