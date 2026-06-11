vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
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

    -- load and setup plugin once
    require("oil").setup({
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
    })
end

-- lazy keymaps
vim.keymap.set('n', '-', function()
    plugin_setup()
    require("oil").open()
end)
