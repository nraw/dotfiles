return {
	"vim-test/vim-test",
	event = "VeryLazy",
	config = function()
		vim.g["test#strategy"] = "slimux"
		vim.g["test#python#runner"] = "pytest"
		vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
	end,
}
