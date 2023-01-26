-- Emmet
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = "html,css", command = "EmmetInstall" })
vim.g.user_emmet_install_global = 0
vim.g.user_emmet_leader_key = ","
vim.g.tagalong_verbose = 1
