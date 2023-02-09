-- UI
vim.o.termguicolors = true
-- cmd("colorscheme sunbather")
vim.g.enable_bold_font = 1
vim.g.enable_italic_font = 1
vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
-- Example config in Lua
require("github-theme").setup({
	theme_style = "dark",
	function_style = "italic",
	-- sidebars = { "qf", "vista_kind", "terminal", "packer" },

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	-- colors = { hint = "orange", error = "black" },
})
