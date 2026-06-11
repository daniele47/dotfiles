return {
	"stevearc/oil.nvim",
	keys = {
		-- open file explorer ONLY if current buffer is NOT FLOATING
		{
			"-",
			function()
				if vim.api.nvim_win_get_config(0).relative == "" then
					require("oil").open()
				end
			end,
		},
	},
	lazy = false,
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<CR>"] = "actions.select",
			["<C-c>"] = "actions.close",
			["<C-w><C-q>"] = "actions.close",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["~"] = { "actions.cd", opts = { scope = "tab" } },
			["<C-l>"] = "actions.refresh",
			["gx"] = "actions.open_external",
			["gh"] = { "actions.toggle_hidden" },
		},
		float = {
			border = "single",
		},
		confirmation = {
            border = "single",
        },
	},
}
