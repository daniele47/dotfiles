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
vim.opt.pumwidth = 80

-- colorscheme (TODO: write entire colorscheme file instead!)
vim.opt.termguicolors = true
vim.cmd.colorscheme("sorbet")
vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#1e1e2e', fg = '#cdd6f4' })                    -- statusline
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#1e1e2e', fg = '#cdd6f4' })                         -- completion menu default
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#313244', fg = '#ffffff' })                      -- completion menu selected line
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#11111b' })                                     -- completion menu bar empty part
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#45475a' })                                    -- completion menu bar scroller
vim.api.nvim_set_hl(0, 'PmenuMatch', { fg = '#cba6f7', bg = '#1e1e2e' })                    -- completion menu matched part
vim.api.nvim_set_hl(0, 'PmenuMatchSel', { fg = '#cba6f7', bg = '#313244', bold = true })    -- completion menu matched part on current line

-- various
vim.opt.mousemodel = "extend"
vim.opt.swapfile = false
vim.opt.fillchars = { eob = " " }
