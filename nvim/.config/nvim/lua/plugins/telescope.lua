-- Telescope
return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope", "NNR", "Dots", "RCF", "TODO" },
		-- keys = { "T", ",,", ",.", ",/", ",k", "<c-p>", "<c-e>", ",h", ",d" },
		keys = {
			{ "T", desc = "Trouble" },
			{ ",,", desc = "Command History" },
			{ ",.", desc = "Commands" },
			{ ",/", desc = "Grep" },
			{ ",k", desc = "Keymaps" },
			{ "<c-p>", desc = "Files" },
			{ "<c-e>", desc = "Buffers" },
			{ ",h", desc = "Find Help" },
			{ ",d", desc = "Dotfiles" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					-- Default configuration for telescope goes here:
					-- config_key = value,
					-- mappings = {
					--   i = {
					--     -- map actions.which_key to <C-h> (default: <C-/>)
					--     -- actions.which_key shows the mappings for your picker,
					--     -- e.g. git_{create, delete, ...}_branch for the git_branches picker
					--     ["<C-h>"] = "which_key"
					--   }
					-- }
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--ignore", "-L", "--files" }, -- "--hidden",
						follow = true,
					},
					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					bookmarks = {
						selected_browser = "chrome",
						full_path = false,
						-- Provide the options here to override the default values.
						-- ...
					},
					frecency = {
						-- db_root = "/home/my_username/path/to/db_root",
						show_scores = true,
						-- show_unindexed = true,
						ignore_patterns = { "*.git/*", "*/tmp/*", "*.DS_Store", "*.gitmodules" },
						disable_devicons = false,
						workspaces = {
							["notes"] = "~/vimwiki",
						},
					},
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value,
					-- }
					-- please take a look at the readme of the extension you want to configure
				},
			})
			local builtin = require("telescope.builtin")

			vim.api.nvim_create_user_command("NNR", function()
				builtin.live_grep({ cwd = vim.fn.expand("~/vimwiki") })
			end, {})
			vim.api.nvim_create_user_command("Dots", function()
				builtin.find_files({ cwd = vim.fn.expand("~/dotfiles/nvim/.config/nvim") })
			end, {})
			vim.api.nvim_create_user_command("RCF", function()
				builtin.live_grep({ cwd = vim.fn.expand("~/dotfiles/nvim/.config/nvim") })
			end, {})
			vim.api.nvim_create_user_command("TODO", function()
				builtin.live_grep({ cwd = vim.fn.expand("~/vimwiki"), default_text = "TODO:" })
			end, {})

			vim.keymap.set("n", "T", builtin.builtin, { desc = "Telescope" })
			vim.keymap.set("n", ",,", builtin.command_history, { desc = "Command History" })
			vim.keymap.set("n", ",.", builtin.commands, { desc = "Commands" })
			vim.keymap.set("n", ",/", builtin.live_grep, { desc = "Grep" })
			vim.keymap.set("n", ",k", builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set("n", "<c-p>", builtin.find_files, { desc = "Files" })
			vim.keymap.set("n", "<c-e>", builtin.buffers, { desc = "Buffers" })
			vim.keymap.set("n", ",h", builtin.help_tags, { desc = "Find Help" })
			vim.keymap.set("n", ",d", ":Dots<CR>", { desc = "Dotfiles" })
		end,
	}, -- T ,, ,. c-p c-e
	{
		"dhruvmanila/telescope-bookmarks.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		-- event = "VeryLazy",
		cmd = { "Telescope bookmarks" },
		keys = { { ",b", desc = "Bookmarks" } },
		config = function()
			require("telescope").load_extension("bookmarks")
			vim.keymap.set("n", ",b", require("telescope").extensions.bookmarks.bookmarks, { desc = "Bookmarks" })
		end,
	}, -- ,b
	{
		"danielvolchek/tailiscope.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		-- event = "VeryLazy",
		cmd = { "Telescope tailiscope" },
		config = function()
			require("telescope").load_extension("tailiscope")
			vim.keymap.set("n", ",w", require("telescope").extensions.tailiscope.tailiscope, { desc = "Tailwind css" })
		end,
	}, -- ,w
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "kkharji/sqlite.lua", "nvim-telescope/telescope.nvim" },
		-- event = "VeryLazy",
		cmd = { "Notes" },
		config = function()
			require("telescope").load_extension("frecency")
			vim.keymap.set("n", ",p", require("telescope").extensions.frecency.frecency, { desc = "Frecency" })
			-- Wiki stuff
			vim.api.nvim_create_user_command("Notes", function()
				require("telescope").extensions.frecency.frecency({ workspace = "notes" })
				-- builtin.find_files({ cwd = vim.fn.expand("~/vimwiki") })
			end, {})
			vim.keymap.set("n", "<C-n>", ":Notes<CR>")
		end,
	}, -- ,p
	{
		"nvim-telescope/telescope-symbols.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		cmd = { "Telescope symbols" },
		-- event = "VeryLazy",
	}, -- ,s
}
