local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()

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
vim.opt.diffopt:append({ context = 99999 })
vim.o.undofile = true
vim.o.undodir = fn.expand("~/.vim/undodir")
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.lazyredraw = true

-- UI
vim.o.termguicolors = true
cmd("colorscheme sunbather")
vim.g.enable_bold_font = 1
vim.g.enable_italic_font = 1
vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1

-- Scrolling
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- netrw
vim.g.netrw_liststyle = 3

-- Reopen buffer at last location
vim.cmd([[
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- wikilocation
vim.g.vimwiki = vim.fn.expand("~/vimwiki/")