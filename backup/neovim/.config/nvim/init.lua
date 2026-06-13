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
vim.g.qf_disable_statusline = 1
vim.opt.statusline = "%<%f %m%r%y %= %{&ff} %l:%v %P"

-- various
vim.opt.mousemodel = "extend" -- mouse only selects
vim.opt.swapfile = false      -- no swap files
vim.opt.scrolloff = 5         -- some scrolloff lines
vim.opt.showmode = false      -- not show modes in cmdline
vim.opt.hlsearch = false      -- no highlight searches
vim.opt.ignorecase = true     -- case insensitive searches
vim.opt.pumheight = 15        -- max height of popups
vim.opt.signcolumn = "yes"    -- always have signcolumn
vim.g.loaded_netrw = 1        -- do not load netwr
vim.g.loaded_netrwPlugin = 1

-- set colorscheme
vim.cmd.colorscheme("ultimate")

-- load everything from lua directory
local config_dir = vim.fn.stdpath("config")
local lua_files = vim.fn.glob(config_dir .. "/lua/**/*.lua", false, true)
table.sort(lua_files)
for _, lua_file in ipairs(lua_files) do
    local module = lua_file:sub(#config_dir + 6, -5):gsub("/", ".")
    require(module)
end
