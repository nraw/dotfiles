-- UI
vim.o.termguicolors = true
-- cmd("colorscheme sunbather")
vim.g.enable_bold_font = 1
vim.g.enable_italic_font = 1
vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
-- Example config in Lua
require("github-theme").setup({
	theme_style = "dark",
	-- function_style = "italic",
	hide_inactive_statusline = false,
	-- sidebars = { "qf", "vista_kind", "terminal", "packer" },

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	-- ~/.local/share/nvim/site/pack/packer/start/github-nvim-theme/lua/github-theme/palette/dark.lua
	colors = { syntax = { func = "#ffab70" } },
})

require("colorizer").setup()
