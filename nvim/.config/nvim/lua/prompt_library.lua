local llm = require("llm")
local openai = require("llm.providers.openai")
local segment = require("llm.segment")

return {
	code = {
		provider = openai,
		builder = function(input)
			return {
				messages = {
					{
						role = "system",
						content = "You are a 10x super elite programmer. Continue only with code. Do not write tests, examples, or output of code unless explicitly asked for.",
					},
					{
						role = "user",
						content = input,
					},
				},
			}
		end,
	},
	["notes"] = {
		provider = openai,
		hl_group = "SpecialComment",
		builder = function(input)
			return {
				messages = {
					{
						role = "system",
						content = [[You are a personal assistant.
I will share with you the notes I took from a meeting. They might be rushed. Structure the notes into the sections below:
- Decisions
- Action items
- Open Questions
]],
					},
					{
						role = "user",
						content = input,
					},
				},
			}
		end,
		-- mode = segment.mode.REPLACE,
	},
	["test"] = {
		provider = openai,
		builder = function(input)
			return {
				messages = {
					{
						role = "system",
						content = [[You are a python programmer.
I will share with you a python file and you will provide tests for all the functions in it.
Use pytest instead of unittest.
Reply only with the code.
]],
					},
					{
						role = "user",
						content = input,
					},
				},
			}
		end,
		mode = llm.mode.BUFFER,
	},
	["docstrings"] = {
		provider = openai,
		builder = function(input)
			return {
				messages = {
					{
						role = "system",
						content = [[I will share with you a function in python.
						You will rewrite the function definition to include typing. Add imports if necessary.
						Add docstrings in the Google format.
]],
					},
					{
						role = "user",
						content = input,
					},
				},
			}
		end,
	},
	["commit"] = {
		provider = openai,
		mode = llm.mode.INSERT,
		builder = function()
			local git_diff = vim.fn.system({ "git", "diff", "--staged" })
			return {
				messages = {
					{
						role = "system",
						content = "Write a short commit message according to the Conventional Commits specification for the following git diff: ```\n"
							.. git_diff
							.. "\n```",
					},
				},
			}
		end,
	},
	["readme"] = {
		provider = openai,
		mode = llm.mode.BUFFER,
		builder = function()
			local git_files = vim.fn.system({ "git", "ls-files" })
			local env_variables = vim.fn.system({ "rg", "os[.]\\w*env" })
			local project_name = vim.fn.system({ "basename", vim.fn.getcwd() })
			return {
				messages = {
					{
						role = "system",
						content = [[You are a python programmer.
I want you to prepare a README.md for the ]] .. project_name .. [[ project.
Rely on the information shared below.

Cover the following parts:
- Title
- Description
- Installation
- Environment Variables
- Usage
- Contributing

The structure of the project is the following:
---
]] .. git_files .. [[
---
These are the environment variables used by the project:
---
]] .. env_variables .. [[
---
]],
					},
				},
			}
		end,
	},
	-- ["to javascript"] = {
	--   provider = openai,
	--   builder = function(input, ctx)
	--     return {
	--       messages = {
	--         {
	--           role = "system",
	--           content = "Convert the code to javascript",
	--         },
	--         {
	--           role = "user",
	--           content = input,
	--         },
	--       },
	--     }
	--   end,
	-- },
	-- ["to rap"] = {
	--   provider = openai,
	--   hl_group = "Title",
	--   builder = function(input)
	--     return {
	--       messages = {
	--         {
	--           role = "system",
	--           content = "Explain the code in 90's era rap lyrics",
	--         },
	--         {
	--           role = "user",
	--           content = input,
	--         },
	--       },
	--     }
	--   end,
	-- },
}
