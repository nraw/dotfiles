return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "markdown" },
	opts = {
		heading = {
			icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
		},
		code = {
			width = "block",
			border = "thin",
		},
	},
	config = function(_, opts)
		-- Heading highlights: cyan foreground, no background
		vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#6ECBF7", bold = true })
		vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#34B4F4", bold = true })
		vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#00A9F4" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#0291DC" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#0679C3" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#0863AA" })

		vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#6ECBF7", bold = true })
		vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#34B4F4", bold = true })
		vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#00A9F4" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#0291DC" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#0679C3" })
		vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#0863AA" })

		-- Code blocks
		vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#082644" })
		vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { fg = "#0BDACB", bg = "#082644" })

		require("render-markdown").setup(opts)
	end,
}
