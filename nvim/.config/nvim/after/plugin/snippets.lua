function CreateSnippetFile()
	local ft = vim.bo.filetype
	local snippet_dir = vim.fn.stdpath("config") .. "/snippets"
	local snippet_file = snippet_dir .. "/" .. ft .. ".lua"
	if vim.fn.isdirectory(snippet_dir) == 0 then
		vim.fn.mkdir(snippet_dir)
	end
	if vim.fn.filereadable(snippet_file) == 0 then
		vim.fn.writefile({}, snippet_file)
	end
	vim.cmd("edit " .. snippet_file)
end

vim.api.nvim_create_user_command("LuaSnipEdit", require("luasnip.loaders").edit_snippet_files, {})
vim.api.nvim_create_user_command("SnippetEdit", CreateSnippetFile, {})
