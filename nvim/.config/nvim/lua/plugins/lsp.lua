return {
	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		event = "VeryLazy",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },          -- Required
			{ "williamboman/mason.nvim" },        -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },      -- Required
			{ "hrsh7th/cmp-nvim-lsp" },  -- Required
			{ "hrsh7th/cmp-buffer" },    -- Optional
			{ "hrsh7th/cmp-path" },      -- Optional
			{ "hrsh7th/cmp-cmdline" },   -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" },  -- Optional
			{ "petertriho/cmp-git" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },          -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
		config = function()
			local lsp = require("lsp-zero")
			-- https://github.com/VonHeikemen/lsp-zero.nvim/wiki/Under-the-hood
			lsp.preset({
				name = "recommended",
				set_lsp_keymaps = false,
				manage_nvim_cmp = true,
				suggest_lsp_servers = true,
			})

			-- (Optional) Configure lua language server for neovim
			lsp.nvim_workspace()

			lsp.on_attach(function(client, bufnr)
				local function opts(desc)
					return { buffer = bufnr, remap = false, desc = desc }
				end

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts("Go to Definition"))

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts("Hover"))

				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts("Workspace Symbol"))

				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts("Open Float"))

				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_next()
				end, opts("Diagnostic Next"))

				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev()
				end, opts("Diagnostic Prev"))

				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts("Code Action"))

				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, opts("References"))

				vim.keymap.set("n", "<leader>rr", function()
					vim.lsp.buf.rename()
				end, opts("Rename"))

				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts("Signature Help"))

				-- Helm charts were horrible, so using plugin
				if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
					vim.diagnostic.disable(bufnr)
					vim.defer_fn(function()
						vim.diagnostic.reset(nil, bufnr)
					end, 1000)
				end

				-- format on save
				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end)

			-- Mason stuff --
			require("mason").setup({})
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				-- ["ruff"] = function ()
				--     require("ruff").setup {}
				-- end
			})

			lsp.setup()
			local luasnip = require("luasnip")
			local cmp = require("cmp")

			-- vim.opt.completeopt = { "menu", "menuone", "noselect" }

			-- local select_opts = { behavior = cmp.SelectBehavior.Select }
			-- Luasnip

			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = false,
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp_signature_help" }, -- doesn't work
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer",                 max_item_count = 6 },
					{ name = "luasnip" },
				},
				window = {
					documentation = cmp.config.window.bordered(),
				},
				completion = {
					completeopt = "menu,menuone,noinsert,noselect",
				},
				experimental = {
					native_menu = false,
					ghost_text = true,
				},
				mapping = {

					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						elseif cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				},
			})

			-- snippets
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./luasnippets" } })

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = "buffer" },
				}),
			})

			-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				-- float = true,
			})
		end,
	},
}
