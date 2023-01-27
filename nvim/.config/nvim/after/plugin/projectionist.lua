-- Projectionist
-- Projectionist options
local src_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
vim.g.projectionist_heuristics = {
	[src_dir .. "/*"] = {
		[src_dir .. "/*.py"] = {
			alternate = "tests/{dirname}/test_{basename}.py",
			type = "src",
			template = { "def {basename}():" },
		},
		["tests/**/test_*.py"] = {
			alternate = { src_dir .. "/{basename}.py", src_dir .. "/{dirname}/{basename}.py" },
			type = "test",
			template = { "from " .. src_dir .. ".{dot} import *\n\n\ndef test_{underscore}():\n    pass" },
		},
	},
	["*"] = {
		["/Users/andrej_marsic/.config/nvim/after/plugin/*.lua"] = { type = "plug" },
		["/Users/andrej_marsic/vimwiki/*.md"] = { type = "note" },
	},
}
