-- Native commenting (nvim 0.10+) remaps
-- gcc / gc in visual mode work by default
-- Adding <leader>c<space> as an alias
-- NOTE: unlike nerdcommenter, comments are indented with code (not left-aligned)
vim.keymap.set("n", "<leader>c<space>", "gcc", { remap = true, silent = true })
vim.keymap.set("v", "<leader>c<space>", "gc", { remap = true, silent = true })
