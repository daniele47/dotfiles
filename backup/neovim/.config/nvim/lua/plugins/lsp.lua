vim.pack.add({
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

local function plugin_setup()
	require("mason").setup()
	require("mason-lspconfig").setup()
end

-- lazy load after UI is drawn
vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		plugin_setup()
	end,
})

-- keymap to format current file
vim.keymap.set({ "n", "i" }, "<A-t>", vim.lsp.buf.format)

-- additional keymaps for buffers with lsp attached
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Create keymaps for buffers with lsp attached",
	callback = function(event)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf })
	end,
})

-- configure diagnostics
vim.diagnostic.config({
	severity_sort = true,
	virtual_text = true,
	float = { border = "single" },
	signs = false,
})

-- configure lsp floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "single"
	opts.max_width = opts.max_width or 100
	opts.max_height = opts.max_height or 15
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
