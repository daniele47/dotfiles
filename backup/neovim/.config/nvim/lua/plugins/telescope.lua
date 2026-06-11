vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
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

    -- load plugin once
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
end

-- lazy keymaps
vim.keymap.set({ 'n', 'i' }, '<A-a>', function()
    plugin_setup()
    require("telescope.builtin").builtin()
end)
vim.keymap.set({ 'n', 'i' }, '<A-h>', function()
    plugin_setup()
    require("telescope.builtin").help_tags()
end)
vim.keymap.set({ 'n', 'i' }, '<A-f>', function()
    plugin_setup()
    require("telescope.builtin").find_files()
end)
vim.keymap.set({ 'n', 'i' }, '<A-s-f>', function()
    plugin_setup()
    require("telescope.builtin").find_files({
        file_ignore_patterns = { "%.git/" },
        hidden = true,
    })
end)
vim.keymap.set({ 'n', 'i' }, '<A-b>', function()
    plugin_setup()
    require("telescope.builtin").buffers({
        only_cwd = true,
    })
end)
vim.keymap.set({ 'n', 'i' }, '<A-s-b>', function()
    plugin_setup()
    require("telescope.builtin").buffers()
end)
vim.keymap.set({ 'n', 'i' }, '<A-s-g>', function()
    plugin_setup()
    require("telescope.builtin").grep_string()
end)
vim.keymap.set({ 'n', 'i' }, '<A-g>', function()
    plugin_setup()
    require("telescope.builtin").live_grep()
end)

