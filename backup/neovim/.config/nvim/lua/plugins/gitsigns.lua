vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
})

-- setup function
local plugin_loaded = false
local function plugin_setup()
	-- skip if already loaded
	if plugin_loaded then
		return
	else
		plugin_loaded = true
	end

	-- load and setup plugin once
	require("gitsigns").setup({
		signs_staged_enable = true,
		signcolumn = true,
		watch_gitdir = { follow_files = true },
		auto_attach = true,
		attach_to_untracked = true,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			vim.keymap.set({ "n", "v" }, "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { buffer = bufnr })
			vim.keymap.set({ "n", "v" }, "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { buffer = bufnr })
		end,
	})
end

-- lazy load after UI is drawn
vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		plugin_setup()
	end,
})
