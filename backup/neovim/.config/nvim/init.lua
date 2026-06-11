-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tab vs space
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- default split direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- statusline
vim.opt.laststatus = 3
vim.opt.statusline = "%<%f %m%r%y %= %{&ff} %l:%v %P"

-- various
vim.opt.mousemodel = "extend" -- mouse only selects
vim.opt.swapfile = false      -- no swap files
vim.opt.scrolloff = 5         -- some scrolloff lines
vim.opt.showmode = false      -- not show modes in cmdline
vim.opt.hlsearch = false      -- no highlight searches
vim.opt.pumheight = 15        -- max height of popups
vim.opt.signcolumn = "yes"    -- always have signcolumn

-- set colorscheme
vim.cmd.colorscheme("ultimate")

-- plugins
require("plugins.oil")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.gitsigns")
