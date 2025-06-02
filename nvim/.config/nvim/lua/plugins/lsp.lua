return {
	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		event = "VeryLazy",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			-- { "williamboman/mason-lspconfig.nvim" }, -- Temporarily disabled due to compatibility issues

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "petertriho/cmp-git" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			-- lsp_zero v3.x setup
			lsp_zero.on_attach(function(client, bufnr)
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

			-- Mason setup (without mason-lspconfig)
			require("mason").setup({})

			-- Note: You'll need to manually install LSP servers through Mason
			-- Run :Mason and install: lua-language-server, pyright, etc.

			-- Manual server setup - this bypasses all mason-lspconfig issues
			local lspconfig = require("lspconfig")

			-- Setup servers manually
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			lspconfig.pyright.setup({})

			-- Add other servers as needed
			-- lspconfig.tsserver.setup({})
			-- lspconfig.rust_analyzer.setup({})

			-- Completion setup
			local cmp = require("cmp")
			local luasnip = require("luasnip")

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
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer", max_item_count = 6 },
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
				mapping = cmp.mapping.preset.insert({
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
				}),
			})

			-- Load snippets
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./luasnippets" } })

			-- Git completion
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Command line completion
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
			})
		end,
	},
}
