-- Add formatters here: they will be auto-installed by Mason and run on save.
local formatters_by_ft = {
	python = { "black", "isort" },
	lua = { "stylua" },
}

-- Collect unique formatter names for mason-tool-installer
local ensure_installed = {}
local seen = {}
for _, formatters in pairs(formatters_by_ft) do
	for _, f in ipairs(formatters) do
		if not seen[f] then
			seen[f] = true
			table.insert(ensure_installed, f)
		end
	end
end

return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = formatters_by_ft,
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = ensure_installed,
		},
	},
}
