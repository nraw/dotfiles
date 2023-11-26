vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim") -- :PackerSync

	-- UI related
	-- use("kristijanhusak/vim-hybrid-material")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")

	-- Noice
	-- use({
	--   "folke/noice.nvim",
	--   requires = {
	--     "MunifTanjim/nui.nvim",
	--     "rcarriga/nvim-notify",
	--   },
	-- })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	}) -- T ,, ,. c-p c-e
	use("dhruvmanila/telescope-bookmarks.nvim") -- ,b
	use("danielvolchek/tailiscope.nvim") -- ,w
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "kkharji/sqlite.lua" },
	}) -- ,p
	use("nvim-telescope/telescope-symbols.nvim")
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground") -- :TSPlaygroundToggle
	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional
			{ "petertriho/cmp-git" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	use("hrsh7th/cmp-cmdline")
	use("github/copilot.vim") -- c-j
	use("gsuuon/llm.nvim")
	-- Trouble
	use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }) -- :Trouble
	-- Formatter
	use({ "mhartington/formatter.nvim" })
	-- Moving around
	use("tpope/vim-unimpaired") -- ]q ]Q cnext, ]a next, ]b bnext, ]<Space> newline
	use("troydm/zoomwintab.vim") -- <leader>z
	use("machakann/vim-swap") -- g<, g>, gs on parameters in functions
	use("tpope/vim-eunuch") -- Move, Rename, Delete
	use("wellle/targets.vim")
	-- Highlighting removed after moving
	use("romainl/vim-cool")
	-- Git
	use("tpope/vim-fugitive") -- :G
	use("sodapopcan/vim-twiggy") -- :Twiggy
	use("tpope/vim-rhubarb") -- :Gbrowse
	use("shumphrey/fugitive-gitlab.vim")
	use("junegunn/gv.vim") -- :GV
	use("airblade/vim-gitgutter") -- ]h, [h, <leader>h, vic, :GitGutterFold
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	}) -- co ct \c
	-- Indentation
	use("michaeljsmith/vim-indent-object") -- vai,  dii
	use("junegunn/vim-easy-align") -- Aligning with gaip + whatever
	-- Tests
	use("tpope/vim-dispatch") -- :Make, :Dispatch
	use("vim-test/vim-test") -- <leader>tt, <leader>tf

	-- use("drmingdrmer/vim-toggle-quickfix")
	-- Linting
	-- use("w0rp/ale")
	-- Autocomplete
	-- use("ncm2/ncm2")
	-- use("roxma/nvim-yarp")
	-- use("ncm2/ncm2-bufword")
	-- use("ncm2/ncm2-path")
	-- use("ncm2/ncm2-jedi")
	-- use("ncm2/ncm2-ultisnips")
	-- use("davidhalter/jedi-vim")
	-- Snippets
	-- use("SirVer/ultisnips")
	-- use("quangnguyen30192/cmp-nvim-ultisnips")
	-- use("honza/vim-snippets")
	use("srydell/vim-skeleton")
	use("tpope/vim-projectionist") -- :A
	-- Refactoring
	use("apalmer1377/factorus") -- :Factorus
	-- Comments and Docstrings
	use("scrooloose/nerdcommenter") -- <leader>c<space>
	-- Colors
	use("norcalli/nvim-colorizer.lua")
	use("rafi/awesome-vim-colorschemes")
	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })

	use("mechatroner/rainbow_csv", { ft = "csv" })
	-- Surrounding
	use("machakann/vim-sandwich") -- saiw(, sdb and srb, sdf, saiwf
	-- Tmux
	use("christoomey/vim-tmux-navigator")
	use("lotabout/slimux")
	-- Vim Wiki
	-- use("vimwiki/vimwiki")
	use("suan/vim-instant-markdown", { ft = "markdown" }) -- <leader>md
	-- Json
	use("elzr/vim-json", { ft = "json" })
	-- Helm
	use("towolf/vim-helm")
	-- Front End
	use("mattn/emmet-vim", { ft = "html" }) -- div>ul>li*3 ,,
	use("AndrewRadev/tagalong.vim", { ft = "html" }) -- changes ending tags
	-- use("rstacruz/vim-ultisnips-css")
	-- Better understanding
	use("mbbill/undotree") -- F5
	-- Profiling
	use("dstein64/vim-startuptime", { command = "StartupTime" })
	-- Pair programming
	use("jbyuki/instant.nvim") -- :InstantStartServer
	-- Which key
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- use 'junegunn/vim-peekaboo'
	-- File manager integration
	-- use 'mcchrish/nnn.vim'
	-- Potential
	-- use 'Yggdroot/indentLine'
	-- use 'easymotion/vim-easymotion'
	-- use 'Shougo/echodoc.vim'
	-- use 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
	-- use 'heavenshell/vim-pydocstring'  -- damn the ctrl l mapping
	-- use 'sheerun/vim-polyglot'
	-- LSP
	-- use 'michal-h21/vim-zettel'
	-- use 'xarthurx/taskwarrior.vim'
	-- use 'tbabej/taskwiki'
	-- use 'wellle/context.vim'
	-- Tmuxinator
end)
