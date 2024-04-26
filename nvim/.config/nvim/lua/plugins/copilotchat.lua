return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			-- https://github.com/CopilotC-Nvim/CopilotChat.nvim?tab=readme-ov-file#configuration
			debug = true, -- Enable debugging
			model = "gpt-4",
			-- model = "gpt-4-turbo",

			prompts = {
				Test =
				"Create tests for this code. Reply only with the test code. Assume that an import * from this module has already been done. Use the pytest module instead of unittest. Do not mock.",
				Refactor = "Refactor the code to improve clarity and readability. Reply only with the new code.",
				Docstring =
				"Create Google format docstring and add typing to the signature. Reply only with the signature and docstring.",
				Rename = "Create lists of suggestions for renaming all variables in this function. Reply in yaml format.",
				Fixture = "Create a pytest fixture for this function. Reply only with the fixture code.",
				Mermaid =
				"Create a mermaid diagram for this code. Reply only with the diagram code following the Mermaid syntax.",
			},
			mappings = { reset = { normal = "<C-x>" } },
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChat<CR>", mode = { "n", "v" }, desc = "Copilot Chat" },
			{
				",c",
				function()
					local actions = require("CopilotChat.actions")
					local prompt_actions = actions.prompt_actions() or {}
					local help_actions = actions.help_actions() or {}
					local combined = vim.tbl_deep_extend("force", prompt_actions, help_actions)
					require("CopilotChat.integrations.telescope").pick(combined)
				end,
				mode = { "n", "v" },
				desc = "Copilot Chat Commands",
			},
		},
	},
}
