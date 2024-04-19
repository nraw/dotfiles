return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			show_help = "no", -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = "yes", -- Disable extra information (e.g: system prompt) in the response.
			clear_chat_on_new_prompt = "yes",
			prompts = {
				Tests = "Create tests for this code. Reply only with the test code. Assume that an import * from this module has already been done. Use the pytest module instead of unittest.",
				Refactor = "Refactor the code to improve clarity and readability. Reply only with the new code.",
				Docstring = "Create Google format docstring and add typing to the signature. Reply only with the signature and docstring.",
				Rename = "Create lists of suggestions for renaming all variables in this function. Reply in yaml format.",
				Fixture = "Create a pytest fixture for this function. Reply only with the fixture code.",
				Review = "Review the code and provide suggestions for improvement. Be concise with the suggestions. Reply in bulletpoints.",
				Mermaid = "Create a mermaid diagram for this code. Reply only with the diagram code following the Mermaid syntax.",
			},
			-- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
		keys = {
			-- { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			-- { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{ "<leader>ccv", ":CopilotChatVisual", mode = "x", desc = "CopilotChat - Open in vertical split" },
			{ "<leader>ccx", ":CopilotChatInPlace<cr>", mode = "x", desc = "CopilotChat - Run in-place code" },
			{ "<leader>ccx", ":CopilotChatInPlace<cr>", desc = "CopilotChat - Run in-place code" },
			{ "<leader>ccr", ":CopilotChatReset<cr>", desc = "CopilotChat - Reset conversation" },
			{
				",c",
				function()
					require("CopilotChat.code_actions").show_prompt_actions()
				end,
				desc = "CopilotChat - Prompt actions",
			},
			{
				"<leader>cci",
				function()
					local input = vim.fn.input("Ask Copilot: ")
					if input ~= "" then
						vim.cmd("CopilotChat " .. input)
					end
				end,
				desc = "CopilotChat - Ask input",
			},
		},
	},
}
