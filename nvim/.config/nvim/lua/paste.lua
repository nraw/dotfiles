-- Function to check if clipboard content is an image
local function isImageInClipboard()
	local clipboard_content = vim.fn.getreg("+")
	return string.match(clipboard_content, "^%[image%]")
end

-- Function to save image locally and paste markdown text
local function saveImageAndPasteMarkdown()
	local clipboard_content = vim.fn.getreg("+")
	local image_data = string.sub(clipboard_content, 8)           -- Remove '[image]' prefix
	local image_filename = os.date("%Y%m%d%H%M%S") .. ".png"      -- Generate unique filename
	local save_path = "/path/to/save/directory/" .. image_filename -- Update with your desired save path

	-- Save image locally
	local file = io.open(save_path, "w")
	file:write(image_data)
	file:close()

	-- Paste markdown text for the image
	vim.fn.setreg("+", "![" .. image_filename .. "](file://" .. save_path .. ")")
	vim.cmd('normal "+p')
end

-- Bind this function to the paste key in Neovim
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua saveImageAndPasteMarkdown()<CR>", { noremap = true, silent = true })
