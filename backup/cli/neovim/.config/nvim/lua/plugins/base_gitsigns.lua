return {
	"lewis6991/gitsigns.nvim",
	event = { "VeryLazy" },
	opts = {
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
	},
}
