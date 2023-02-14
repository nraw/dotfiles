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

local builtin = require("telescope.builtin")
vim.keymap.set("n", "T", builtin.builtin)
vim.keymap.set("n", ",,", builtin.command_history)
vim.keymap.set("n", ",.", builtin.commands)
vim.keymap.set("n", ",/", builtin.live_grep)
vim.keymap.set("n", ",k", builtin.keymaps)
vim.keymap.set("n", ",p", require("telescope").extensions.frecency.frecency)
vim.keymap.set("n", "<c-p>", builtin.find_files, {})
vim.keymap.set("n", "<c-e>", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Wiki stuff
vim.api.nvim_create_user_command("Notes", function()
	builtin.find_files({ cwd = vim.fn.expand("~/vimwiki") })
end, {})
vim.keymap.set("n", "<C-n>", ":Notes<CR>")
vim.api.nvim_create_user_command("NNR", function()
	builtin.live_grep({ cwd = vim.fn.expand("~/vimwiki") })
end, {})

-- Search through RC files
vim.api.nvim_create_user_command("RCF", function()
	builtin.find_files({ cwd = vim.fn.expand("~/dotfiles/nvim/.config/nvim") })
end, {})

vim.api.nvim_create_user_command("RCFF", function()
	builtin.live_grep({ cwd = vim.fn.expand("~/dotfiles/nvim/.config/nvim") })
end, {})

vim.api.nvim_create_user_command("TODO", function()
	builtin.live_grep({ cwd = vim.fn.expand("~/vimwiki"), default_text = "TODO" })
end, {})
