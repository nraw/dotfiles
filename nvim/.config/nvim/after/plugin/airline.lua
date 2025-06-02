-- Airline
-- Airline Options
vim.g.airline_experimental = 1
vim.g.airline_theme = "deus"
vim.g.airline_left_sep = ""
vim.g.airline_right_sep = ""
vim.g.airline_powerline_fonts = 1
vim.g.airline_inactive_collapse = 1
vim.g.airline_detect_modified = 1
vim.g.airline_focuslost_inactive = 1

vim.g["airline#extensions#ale#enabled"] = 0
-- vim.g["airline#extensions#ale#error_symbol"] = "🚫 "
-- vim.g["airline#extensions#ale#warning_symbol"] = "W:"
vim.g["airline#extensions#tabline#enabled"] = 0
vim.g["airline#extensions#tabline#left_sep"] = " "
vim.g["airline#extensions#tabline#left_alt_sep"] = "|"
vim.g["airline#extensions#tabline#show_tab_type"] = 1
vim.g["airline#extensions#tabline#current_first"] = 1

-- let g:airline#extensions#whitespace#enabled = 0
vim.g["airline#extensions#whitespace#enabled"] = 0

-- let g:airline#extensions#whitespace#symbol = '!'
vim.g["airline#exentions#whitespace#symbol"] = "!"

-- let g:airline#extensions#branch#enabled = 0
vim.g["airline#extensions#hunks#enabled"] = 0

-- let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
vim.g["airline#parts#ffenc#skip_expected_string"] = "utf-8[unix]"

vim.g.airline_filetype_overrides = {
	fugitive = { "fugitive", "%{airline#util#wrap(airline#extensions#branch#get_head(),80)}" },
}
