-- UI
vim.o.termguicolors = true
-- cmd("colorscheme sunbather")
vim.g.enable_bold_font = 1
vim.g.enable_italic_font = 1
vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
-- Example config in Lua
local col = {
	White = "#FFFFFF",
	Black = "#000000",
	DeepBlue200 = "#82A6C9",
	DeepBlue300 = "#5380AC",
	DeepBlue400 = "#386694",
	DeepBlue500 = "#2B5580",
	DeepBlue600 = "#1B456E",
	DeepBlue700 = "#103559",
	DeepBlue800 = "#082644",
	DeepBlue900 = "#051C2C",
	ElectricBlue200 = "#99C4FF",
	ElectricBlue300 = "#5E9DFF",
	ElectricBlue400 = "#2972FF",
	ElectricBlue500 = "#2251FF",
	ElectricBlue600 = "#1C44DC",
	ElectricBlue700 = "#1537BA",
	ElectricBlue800 = "#0E2B99",
	ElectricBlue900 = "#061F79",
	Cyan200 = "#99E6FF",
	Cyan300 = "#6ECBF7",
	Cyan400 = "#34B4F4",
	Cyan500 = "#00A9F4",
	Cyan600 = "#0291DC",
	Cyan700 = "#0679C3",
	Cyan800 = "#0863AA",
	Cyan900 = "#084D91",
	Gray5 = "#F2F2F2",
	Gray10 = "#E6E6E6",
	Gray20 = "#CCCCCC",
	Gray30 = "#B3B3B3",
	Gray54 = "#757575",
	Gray60 = "#656565",
	Gray70 = "#4D4D4D",
	Gray80 = "#333333",
	MarineGreen200 = "#A3F5EF",
	MarineGreen300 = "#75F0E7",
	MarineGreen400 = "#20E9DA",
	MarineGreen500 = "#0BDACB",
	MarineGreen600 = "#10CBBC",
	MarineGreen700 = "#14B8AB",
	MarineGreen800 = "#12A195",
	MarineGreen900 = "#108980",
	AmberYellow200 = "#FFE4B3",
	AmberYellow300 = "#FFCD75",
	AmberYellow400 = "#FFBB48",
	AmberYellow500 = "#FFA800",
	AmberYellow600 = "#EB9B00",
	AmberYellow700 = "#D88F00",
	AmberYellow800 = "#C58200",
	AmberYellow900 = "#B37600",
	OrchidPink200 = "#F7BAF6",
	OrchidPink300 = "#ED97EC",
	OrchidPink400 = "#E479E4",
	OrchidPink500 = "#DB57DB",
	OrchidPink600 = "#CC49C2",
	OrchidPink700 = "#BD3BAA",
	OrchidPink800 = "#AD2E93",
	OrchidPink900 = "#9C217D",
	CrimsonRed200 = "#FAA8A8",
	CrimsonRed300 = "#F17E7E",
	CrimsonRed400 = "#E65656",
	CrimsonRed500 = "#E33B3B",
	CrimsonRed600 = "#CD3030",
	CrimsonRed700 = "#B82525",
	CrimsonRed800 = "#A31919",
	CrimsonRed900 = "#8E0B0B",
	SandNeutral200 = "#F5EAD6",
	SandNeutral300 = "#E6D7BC",
	SandNeutral400 = "#D8C6A6",
	SandNeutral500 = "#CEBA97",
	SandNeutral600 = "#C0AB85",
	SandNeutral700 = "#B39C74",
	SandNeutral800 = "#A58D63",
	SandNeutral900 = "#987F52",
}
require("github-theme").setup({
	theme_style = "dark",
	-- function_style = "italic",
	hide_inactive_statusline = false,
	-- sidebars = { "qf", "vista_kind", "terminal", "packer" },

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	-- ~/.local/share/nvim/site/pack/packer/start/github-nvim-theme/lua/github-theme/palette/dark.lua
	colors = {
		bg = col.DeepBlue900,
		bg2 = col.DeepBlue800,
		fg = col.White,
		-- bg = '#24292e',
		-- bg2 = '#1f2428',

		-- Foreground Colors
		-- fg = '#c9d1d9',
		fg_dark = col.Gray5,
		fg_gutter = col.Gray10,
		fg_light = col.Gray20,
		fg_term = col.Gray30,

		-- Background Highlights Colors
		bg_highlight = col.Gray60,
		bg_search = "#404030",
		bg_visual = "#444c56",
		bg_visual_selection = col.DeepBlue700,
		border = col.White,

		-- Cursor & LineNumber Colors
		cursor = "#c8e1ff",
		cursor_line_nr = col.DeepBlue200,
		line_nr = col.DeepBlue400,

		-- LSP & Diagnostic Colors
		error = col.CrimsonRed400,
		warning = col.AmberYellow500,
		info = col.ElectricBlue300,
		hint = col.AmberYellow200,
		lsp = { ref_txt = "#265459" },
		-- syntax = { func = "#ffab70" },
		syntax = {
			comment = col.Gray50,
			constant = col.Cyan200,
			string = col.Cyan200,
			variable = col.White,
			keyword = col.Cyan500,
			func = col.Cyan300,
			func_param = "#e1e4e8",
			match_paren_bg = "#25686c",
			tag = "#85e89d",
			html_arg = "#fdaeb7",
			param = col.ElectricBlue200,
			json_label = "#79b8ff",
		},
	},
})

require("colorizer").setup()
