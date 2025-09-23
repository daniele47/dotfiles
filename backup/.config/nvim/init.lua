-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.statusline = "%<%f %m%r%y %= %{&ff} %l:%v %P"
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.mousemodel = "extend"
vim.opt.pumheight = 15
vim.opt.swapfile = false
vim.opt.fillchars = { eob = " " }

-- keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "grf", "")

-- autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.hl.on_yank()
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable autocommenting",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "evening",
    callback = function()
        vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "Normal" })
    end,
})

-- colorscheme
vim.cmd("colorscheme evening")
