return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<A-a>",
			function()
				require("telescope.builtin").builtin()
			end,
			mode = { "n", "i" },
		},
		{
			"<A-h>",
			function()
				require("telescope.builtin").help_tags()
			end,
			mode = { "n", "i" },
		},
		{
			"<A-f>",
			function()
				require("telescope.builtin").find_files()
			end,
			mode = { "n", "i" },
		},
		{
			"<A-s-f>",
			function()
				require("telescope.builtin").find_files({
					file_ignore_patterns = { "%.git/" },
					hidden = true,
				})
			end,
			mode = { "n", "i" },
		},
		{
			"<A-b>",
			function()
				require("telescope.builtin").buffers({
                    only_cwd = true,
                })
			end,
			mode = { "n", "i" },
		},
		{
			"<A-s-b>",
			function()
				require("telescope.builtin").buffers()
			end,
			mode = { "n", "i" },
		},
		{
			"<A-s-g>",
			function()
				require("telescope.builtin").grep_string()
			end,
			mode = { "n", "i" },
		},
		{
			"<A-g>",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = { "n", "i" },
		},
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-c>"] = actions.close,
						["<a-f>"] = function()
							require("telescope.builtin").find_files()
						end,
					},
					n = {
						["<esc>"] = actions.close,
						["<C-c>"] = actions.close,
					},
				},
			},
		})
	end,
}
