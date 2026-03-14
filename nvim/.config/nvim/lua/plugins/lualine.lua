return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = {
				{
					function()
						local wc = vim.fn.wordcount()
						return wc.visual_words or wc.words .. " words"
					end,
					cond = function()
						return vim.bo.filetype == "markdown"
					end,
				},
				{
					"encoding",
					cond = function()
						return vim.bo.fileencoding ~= "" and vim.bo.fileencoding ~= "utf-8"
					end,
				},
				{
					"fileformat",
					cond = function()
						return vim.bo.fileformat ~= "unix"
					end,
				},
				"filetype",
			},
			lualine_y = {
				{
					"diagnostics",
					symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
					diagnostics_color = {
						error = { fg = "#ffffff", bg = "#ff6c6b", gui = "bold" },
						warn = { fg = "#1e1e1e", bg = "#ECBE7B", gui = "bold" },
						info = { fg = "#ffffff", bg = "#51afef" },
						hint = { fg = "#ffffff", bg = "#98be65" },
					},
				},
				"progress",
			},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "location" },
		},
	},
}
