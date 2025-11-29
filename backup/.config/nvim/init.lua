-- file line number
vim.opt.number = true
vim.opt.relativenumber = true

-- tab vs spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- new window position
vim.opt.splitright = true
vim.opt.splitbelow = true

-- statusline
vim.opt.statusline = "%<%f %m%r%y %= %{&ff} %l:%v %P"
vim.opt.laststatus = 3
vim.opt.showmode = false

-- search options
vim.opt.ignorecase = true
vim.opt.hlsearch = false

-- completion menu
vim.opt.pumheight = 15
vim.opt.pumwidth = 20

-- colorscheme
vim.opt.termguicolors = true
vim.cmd("colorscheme ultimate")

-- various
vim.opt.mousemodel = "extend"
vim.opt.swapfile = false
vim.opt.fillchars = { eob = " " }
vim.opt.signcolumn = "no"

-- clipboard via osc52 (works guiless)
-- vim.g.clipboard = {
-- 	name = "OSC52",
-- 	copy = {
-- 		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
-- 		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
-- 	},
-- 	paste = {
-- 		["+"] = function() end,
-- 		["*"] = function() end,
-- 	},
-- }
