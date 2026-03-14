return {
	-- UI related
	-- "kristijanhusak/vim-hybrid-material",
	-- lualine: configured in lua/plugins/lualine.lua
	{ "stevearc/dressing.nvim",          event = "VeryLazy" },

	-- Treesitter

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "python", "markdown", "markdown_inline" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{ "nvim-treesitter/playground",      cmd = "TSPlaygroundToggle" }, -- :TSPlaygroundToggle
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			bigfile = {
				size = 0.9 * 1024 * 1024, -- 0.9MB
				line_length = 1000,   -- average line length (useful for minified files)
			},
		},
	},
	{
		"github/copilot.vim",
		event = "VeryLazy",
		init = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_filetypes = { markdown = true }
		end,
		keys = {
			{ "<Right>", 'copilot#Accept("<CR>")', mode = "i", expr = true, silent = true },
			{ "<Down>", "<Plug>(copilot-next)", mode = "i" },
			{ "<Up>", "<Plug>(copilot-previous)", mode = "i" },
		},
	},
	-- Moving around
	{ "tpope/vim-unimpaired", event = "VeryLazy" }, -- ]q ]Q cnext, ]a next, ]b bnext, ]<Space> newline
	{
		"troydm/zoomwintab.vim",
		keys = {
			{ "<leader>z", "<cmd>ZoomWinTabToggle<cr>", desc = "NeoTree" },
		},
	}, -- <leader>z
	{
		"machakann/vim-swap",
		event = "VeryLazy",
		-- keys = {
		--   { "<leader>g<", "<Plug>(swap-prev)" },
		--   { "<leader>g>", "<Plug>(swap-next)" },
		--   { "<leader>gs", "<Plug>(swap-interactive)" },
		-- },
	},
	{ "tpope/vim-eunuch",   cmd = { "Move", "Rename", "Delete" } },
	-- Highlighting removed after moving
	{ "romainl/vim-cool",   event = "VeryLazy" },
	-- Git (fugitive + related: lua/plugins/fugitive.lua)
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Octo",
		config = function()
			require("octo").setup()
		end,
	},
	-- { "airblade/vim-gitgutter", lazy = false }, -- ]h, [h, <leader>h, vic, :GitGutterFold
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup()
		end,
		event = "VeryLazy",
	},                                                        -- co ct \c
	-- Indentation
	{ "junegunn/vim-easy-align",         event = "VeryLazy" }, -- Aligning with gaip + whatever
	-- Tests (vim-dispatch: lua/plugins/dispatch.lua, vim-test: lua/plugins/vimtest.lua)

	-- Linting
	-- "w0rp/ale",
	-- Autocomplete
	-- Snippets
	-- "SirVer/ultisnips",
	-- "quangnguyen30192/cmp-nvim-ultisnips",
	-- "honza/vim-snippets",
	"srydell/vim-skeleton",
	-- projectionist: lua/plugins/projectionist.lua
	-- Refactoring: lua/plugins/refactoring.lua
	-- Comments and Docstrings
	-- native commenting (gcc, gc) since nvim 0.10
	-- Colors
	{ "norcalli/nvim-colorizer.lua",    event = "VeryLazy" },
	-- "rafi/awesome-vim-colorschemes",
	{ "projekt0n/github-nvim-theme",    tag = "v0.0.7",    priority = 100 },

	{ "mechatroner/rainbow_csv",        ft = "csv" },
	-- Surrounding
	{
		"machakann/vim-sandwich",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("x", "s", '"_d')
			vim.keymap.set("n", "ss", '"_dd')
		end,
	},
	-- Tmux
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	-- slimux: lua/plugins/slimux.lua
	-- Vim Wiki
	-- "vimwiki/vimwiki",
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		keys = {
			{ "<leader>md", ":MarkdownPreview<CR>", desc = "Markdown Preview" },
		},
	},
	-- Json
	{ "elzr/vim-json",            ft = "json" },
	-- Helm
	{ "towolf/vim-helm",          ft = "yaml" },
	-- Front End
	{
		"mattn/emmet-vim",
		ft = { "html", "css" },
		init = function()
			vim.g.user_emmet_install_global = 0
			vim.g.user_emmet_leader_key = ","
			vim.g.tagalong_verbose = 1
		end,
		config = function()
			vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "html,css", command = "EmmetInstall" })
		end,
	},
	{ "AndrewRadev/tagalong.vim", ft = "html" }, -- changes ending tags
	-- use("rstacruz/vim-ultisnips-css")
	-- Better understanding
	{
		"mbbill/undotree",
		keys = {
			{ "<F5>", ":UndotreeToggle<CR>", desc = "Undotree" },
		},
	},
	-- Profiling
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	-- Pair programming
	{
		"jbyuki/instant.nvim",
		cmd = { "InstantStartServer", "InstantJoinSession" },
		init = function()
			vim.g.instant_username = "andrej"
		end,
	},
	-- Which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	-- File Manager
	-- { "stevearc/oil.nvim", ft = "netrw" },

	-- use 'junegunn/vim-peekaboo'
	-- File manager integration
	-- use 'mcchrish/nnn.vim'
	-- Potential
	-- use 'Yggdroot/indentLine'
	-- use 'easymotion/vim-easymotion'
	-- use 'Shougo/echodoc.vim'
	-- use 'kkoomen/vim-doge', { 'do': { -> doge#install() } },
	-- use 'heavenshell/vim-pydocstring'  -- damn the ctrl l mapping
	-- use 'sheerun/vim-polyglot'
	-- LSP
	-- use 'michal-h21/vim-zettel'
	-- use 'xarthurx/taskwarrior.vim'
	-- use 'tbabej/taskwiki'
	-- use 'wellle/context.vim'
	-- Tmuxinator
}
