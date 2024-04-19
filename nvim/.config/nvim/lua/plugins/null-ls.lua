return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", "williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim" },
	},
	config = function()
		local null_ls = require("null-ls")
		require("mason").setup()
		require("mason-null-ls").setup({
			handlers = {},
		})

		-- null_ls.setup({
		--   sources = {
		--     null_ls.builtins.formatting.stylua,
		--     null_ls.builtins.formatting.isort,
		--     null_ls.builtins.completion.spell,
		--     -- null_ls.builtins.diagnostics.spellcheck,
		--   },
		-- })
	end,
}
