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
require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("tailiscope")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "T", builtin.builtin, { desc = "Telescope" })
vim.keymap.set("n", ",,", builtin.command_history, { desc = "Command History" })
vim.keymap.set("n", ",.", builtin.commands, { desc = "Commands" })
vim.keymap.set("n", ",/", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", ",k", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", ",p", require("telescope").extensions.frecency.frecency, { desc = "Frecency" })
vim.keymap.set("n", ",b", require("telescope").extensions.bookmarks.bookmarks, { desc = "Bookmarks" })
vim.keymap.set("n", ",w", require("telescope").extensions.tailiscope.tailiscope, { desc = "Tailwind css" })
vim.keymap.set("n", "<c-p>", builtin.find_files, { desc = "Files" })
vim.keymap.set("n", "<c-e>", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", ",h", builtin.help_tags, { desc = "Find Help" })

-- Wiki stuff
vim.api.nvim_create_user_command("Notes", function()
	require("telescope").extensions.frecency.frecency({ workspace = "notes" })
	-- builtin.find_files({ cwd = vim.fn.expand("~/vimwiki") })
end, {})
vim.keymap.set("n", "<C-n>", ":Notes<CR>")
vim.api.nvim_create_user_command("NNR", function()
	builtin.live_grep({ cwd = vim.fn.expand("~/vimwiki") })
end, {})

-- Search through RC files
vim.api.nvim_create_user_command("Dots", function()
	builtin.find_files({ cwd = vim.fn.expand("~/dotfiles/nvim/.config/nvim") })
end, {})
vim.keymap.set("n", ",d", ":Dots<CR>")

vim.api.nvim_create_user_command("RCF", function()
	builtin.live_grep({ cwd = vim.fn.expand("~/dotfiles/nvim/.config/nvim") })
end, {})

vim.api.nvim_create_user_command("TODO", function()
	builtin.live_grep({ cwd = vim.fn.expand("~/vimwiki"), default_text = "TODO:" })
end, {})
