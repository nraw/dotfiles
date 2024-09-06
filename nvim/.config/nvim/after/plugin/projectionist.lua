-- Projectionist
-- Projectionist options
local src_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
-- local _, path_depth = string.gsub(vim.fn.getcwd(), "/", "")
-- local string_to_root = string.rep("../", path_depth)
-- local home_dir_rel = string_to_root .. vim.fn.expand("~") .. "/"
vim.g.projectionist_heuristics = {
	[src_dir .. "/*"] = {
		[src_dir .. "/*.py"] = {
			alternate = { "tests/{dirname}/test_{basename}.py", src_dir .. "/tests/{dirname}/test_{basename}.py" },
			type = "src",
			-- template = { "def {basename}():" }, -- This doesn't play nicely when other functions trigger new files
		},
		["tests/**/test_*.py"] = {
			alternate = { src_dir .. "/{basename}.py", src_dir .. "/{dirname}/{basename}.py" },
			type = "test",
			template = { "from " .. src_dir .. ".{dot} import *\n\n\ndef test_{underscore}():\n    {underscore}()" },
		},
		[src_dir .. "/tests/**/test_*.py"] = {
			alternate = { src_dir .. "/{basename}.py", src_dir .. "/{dirname}/{basename}.py" },
			type = "test",
			template = { "from " .. src_dir .. ".{dot} import *\n\n\ndef test_{underscore}():\n    {underscore}()" },
		},
	},
	-- ["*"] = {
	--   [home_dir_rel .. ".config/nvim/after/plugin/*.lua"] = { type = "plug" },
	--   [home_dir_rel .. "vimwiki/*.md"] = { type = "note", template = { "# {basename}\n\n" } },
	--   [home_dir_rel .. "vimwiki/diary/*.md"] = { type = "diary" },
	-- },
}
