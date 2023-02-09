vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- UI related
	-- use("kristijanhusak/vim-hybrid-material")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
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
			{ "hrsh7th/cmp-nvim-lsp-signature-help"},

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	use("hrsh7th/cmp-cmdline")
	-- Trouble
	use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })
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
	use("tpope/vim-fugitive")
	use("sodapopcan/vim-twiggy")
	use("tpope/vim-rhubarb")
	use("shumphrey/fugitive-gitlab.vim")
	use("junegunn/gv.vim") -- :GV
	use("airblade/vim-gitgutter")
	-- Indentation
	use("michaeljsmith/vim-indent-object") -- vai,  dii
	use("junegunn/vim-easy-align") -- Aligning with gaip + whatever
	-- Tests
	use("tpope/vim-dispatch")
	use("vim-test/vim-test")
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
	use("tpope/vim-projectionist")
	-- Refactoring
	use("apalmer1377/factorus")
	-- Comments and Docstrings
	use("scrooloose/nerdcommenter") -- <leader>c<space>
	-- Colors
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
	use("suan/vim-instant-markdown", { ft = "markdown" })
	-- Json
	use("elzr/vim-json", { ft = "json" })
	-- Front End
	use("mattn/emmet-vim", { ft = "html" }) -- div>ul>li*3 ,,
	use("AndrewRadev/tagalong.vim", { ft = "html" }) -- changes ending tags
	-- use("rstacruz/vim-ultisnips-css")
	-- Better understanding
	use("mbbill/undotree") -- F5
	-- Profiling
	use("dstein64/vim-startuptime", { command = "StartupTime" })
	-- Pair programming
	-- use 'junegunn/vim-peekaboo'
	-- File manager integration
	-- use 'mcchrish/nnn.vim'
	-- Collaboration
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
	-- Personal
	-- use '/Users/andrej_marsic/code/research/kedro/ncm2-kedro_datasets'
end)
