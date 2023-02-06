-- Compile Packer
local packer_group = vim.api.nvim_create_augroup("packer_auto_compile", {})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*/nvim/lua/plugins.lua",
	group = packer_group,
	command = [[source <afile> | PackerCompile]],
})
