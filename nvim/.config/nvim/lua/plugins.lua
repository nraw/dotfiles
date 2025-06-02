return {
	-- UI related
	-- "kristijanhusak/vim-hybrid-material",
	{
		"vim-airline/vim-airline",
		lazy = false,
		dependencies = { "vim-airline/vim-airline-themes" },
	},
	{ "stevearc/dressing.nvim",          event = "VeryLazy" },

	-- Treesitter

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
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
	{ "github/copilot.vim",   event = "VeryLazy" }, -- c-j
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
	{ "wellle/targets.vim", event = "VeryLazy" },
	-- Highlighting removed after moving
	{ "romainl/vim-cool",   event = "VeryLazy" },
	-- Git
	{
		"tpope/vim-fugitive",
		-- event = "VeryLazy", -- needs to be not lazy for airline :(
		-- cmd = "G",
		config = function()
			vim.cmd("call FugitiveDetect(getcwd())") -- needed for Twiggy
		end,
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		-- event = "VeryLazy",
		cmd = "Octo",
		config = function()
			require("octo").setup()
		end,
	},
	{ "sodapopcan/vim-twiggy",         dependencies = { "tpope/vim-fugitive" }, cmd = "Twiggy" },
	{ "tpope/vim-rhubarb" },          -- :Gbrowse
	{ "shumphrey/fugitive-gitlab.vim", dependencies = { "tpope/vim-fugitive" }, event = "VeryLazy" },
	{ "junegunn/gv.vim",               cmd = "GV" }, -- :GV
	-- { "airblade/vim-gitgutter", lazy = false }, -- ]h, [h, <leader>h, vic, :GitGutterFold
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup()
		end,
		event = "VeryLazy",
	},                                                        -- co ct \c
	-- Indentation
	{ "michaeljsmith/vim-indent-object", event = "VeryLazy" }, -- vai,  dii
	{ "junegunn/vim-easy-align",         event = "VeryLazy" }, -- Aligning with gaip + whatever
	-- Tests
	{ "tpope/vim-dispatch",              event = "VeryLazy" }, -- :Make, :Dispatch
	{ "vim-test/vim-test",               event = "VeryLazy" }, -- <leader>tt, <leader>tf

	-- Linting
	-- "w0rp/ale",
	-- Autocomplete
	-- Snippets
	-- "SirVer/ultisnips",
	-- "quangnguyen30192/cmp-nvim-ultisnips",
	-- "honza/vim-snippets",
	"srydell/vim-skeleton",
	"tpope/vim-projectionist", -- :A
	-- Refactoring
	-- { "apalmer1377/factorus", event = "VeryLazy" }, -- :Factorus
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		config = function()
			require("refactoring").setup()
		end,
	},
	-- Comments and Docstrings
	{ "scrooloose/nerdcommenter",       event = "VeryLazy" }, -- <leader>c<space>
	-- Colors
	{ "norcalli/nvim-colorizer.lua",    event = "VeryLazy" },
	-- "rafi/awesome-vim-colorschemes",
	{ "projekt0n/github-nvim-theme",    tag = "v0.0.7",    priority = 100 },

	{ "mechatroner/rainbow_csv",        ft = "csv" },
	-- Surrounding
	{ "machakann/vim-sandwich",         event = "VeryLazy" }, -- saiw(, sdb and srb, sdf, saiwf
	-- Tmux
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "lotabout/slimux" },
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
	},
	-- Json
	{ "elzr/vim-json",            ft = "json" },
	-- Helm
	{ "towolf/vim-helm",          ft = "yaml" },
	-- Front End
	{ "mattn/emmet-vim",          ft = "html,css" }, -- div>ul>li*3 ,,
	{ "AndrewRadev/tagalong.vim", ft = "html" }, -- changes ending tags
	-- use("rstacruz/vim-ultisnips-css")
	-- Better understanding
	{ "mbbill/undotree",          cmd = "UndotreeToggle" }, -- F5
	-- Profiling
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	-- Pair programming
	{ "jbyuki/instant.nvim",      cmd = { "InstantStartServer", "InstantJoinSession" } },
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
