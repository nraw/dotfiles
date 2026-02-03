return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- Diagnostic configuration
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
		})

		-- LSP keybindings on attach
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf

				local function opts(desc)
					return { buffer = bufnr, remap = false, desc = desc }
				end

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to Definition"))
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
				vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts("Workspace Symbol"))
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts("Open Float"))
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Diagnostic Next"))
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Diagnostic Prev"))
				vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts("Code Action"))
				vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts("References"))
				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts("Rename"))
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts("Signature Help"))
			end,
		})
	end,
}
