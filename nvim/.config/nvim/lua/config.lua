-- Options
vim.o.number = true
vim.o.updatetime = 50
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.swapfile = false
vim.o.inccommand = "split" -- live substitution
vim.o.foldenable = false
vim.o.foldmethod = "indent"
vim.opt.diffopt:append({ context = 99999 })
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.lazyredraw = false

-- Scrolling
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- netrw
vim.g.netrw_liststyle = 3

-- Reopen buffer at last location
vim.cmd([[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- Format options (no comments in new lines)
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- wikilocation
vim.g.vimwiki = vim.fn.expand("~/vimwiki/")

-- vim.opt.formatoptions = "jql"
