return {
	"tpope/vim-projectionist",
	config = function()
		local src_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		vim.g.projectionist_heuristics = {
			[src_dir .. "/*"] = {
				[src_dir .. "/*.py"] = {
					alternate = { "tests/{dirname}/test_{basename}.py", src_dir .. "/tests/{dirname}/test_{basename}.py" },
					type = "src",
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
		}
	end,
}
