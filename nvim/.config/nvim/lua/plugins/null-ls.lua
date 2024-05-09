return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", "williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim" },
	},
	config = function()
		local null_ls = require("null-ls")
		require("mason").setup()
		require("mason-null-ls").setup({
			-- Providing an empty handlers will cause all sources to be automatically registered in null-ls
			handlers = {
				-- mypy = function(source_name, methods)
				--   null_ls.builtins.diagnostics.mypy.with({
				--     extra_args = { "--ignore-missing-imports" },
				--   })
				-- end,
			},
		})

		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.isort,
				-- null_ls.builtins.completion.spell,
				-- null_ls.builtins.diagnostics.spellcheck,
			},
		})
	end,
}
