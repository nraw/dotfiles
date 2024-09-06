-- Trouble
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
	-- cmd = "Trouble",
	config = function()
		require("trouble").setup({
			focus = true,
		})

		local telescope = require("telescope")

		local trouble = require("trouble.sources.telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble.open },
					n = { ["<c-t>"] = trouble.open },
				},
			},
		})
	end,
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"gR",
			"<cmd>Trouble lsp_references toggle focus=true<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},

	--   -- Move with [t and ]t
	--   vim.keymap.set("n", "]t", function()
	--     require("trouble").next({ skip_groups = true, jump = true })
	--   end, { silent = true, noremap = true, desc = "Trouble Next" })
	--   vim.keymap.set("n", "[t", function()
	--     require("trouble").previous({ skip_groups = true, jump = true })
	--   end, { silent = true, noremap = true, desc = "Trouble Prev" })
	-- end,
}
