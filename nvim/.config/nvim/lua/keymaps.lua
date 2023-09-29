-- General maps

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<SPACE>", "")

-- Movements
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

-- Move through longer texts
vim.keymap.set({ "n", "v" }, "k", vim.v.count and "gk" or "k")
vim.keymap.set({ "n", "v" }, "j", vim.v.count and "gj" or "j")

-- Keep central next
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep visual after move
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Yank
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "gy", "mzggVGy'z")

-- Big Undo
vim.keymap.set("n", "U", ":earlier 1f<CR>")

-- Search
vim.keymap.set("n", "<leader>/", ":%s/")
vim.keymap.set("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

-- Change directory to current file
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")

-- Splits
vim.keymap.set("n", "-", "<c-w>s", { silent = true })
vim.keymap.set("n", "_", "<c-w>v", { silent = true })
vim.keymap.set("n", "<leader>z", ":ZoomWinTabToggle<CR>")

-- Operators
vim.keymap.set("o", "=", ":<c-u>normal! ^f=wv$h<cr>")
vim.keymap.set("x", "il", "$o^")
vim.keymap.set("o", "il", ":normal vil<CR>")
vim.keymap.set("x", "al", "$o0")
vim.keymap.set("o", "al", ":normal val<CR>")
vim.keymap.set("n", "n", ':<C-u>execute "keepjumps norm! " . v:count1 . "n"<CR>')
vim.keymap.set("n", "N", ':<C-u>execute "keepjumps norm! " . v:count1 . "N"<CR>')

-- Macros
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("n", "<leader>Q", ":%norm @q<CR>")
vim.keymap.set("n", "<leader>qp", 'o<esc>"qp')
vim.keymap.set("n", "<leader>qy", '"qdd')

-- Increments
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "=", "<C-x>")
