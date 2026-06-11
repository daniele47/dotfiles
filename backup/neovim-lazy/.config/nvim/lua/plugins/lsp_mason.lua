return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		event = "VeryLazy",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "mason-org/mason.nvim", opts = {} },
		},
	},
}
