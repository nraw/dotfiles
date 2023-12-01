return {
	"gsuuon/llm.nvim",
	cmd = "Llm",
	config = function()
		local openai = require("llm.providers.openai")

		-- configure default model params here for the provider
		openai.initialize({
			model = "gpt-3.5-turbo",
			max_tokens = 400,
			temperature = 0.2,
		})

		local util = require("llm.util")

		require("llm").setup({
			-- hl_group = "Substitute",
			-- prompts = require('prompt_library'), -- Use this instead of the autoload for faster loading
			prompts = util.module.autoload("prompt_library"),
		})
	end,
}
