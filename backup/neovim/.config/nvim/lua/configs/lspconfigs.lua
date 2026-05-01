-- additional keymaps for buffers with lsp attached
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Create keymaps for buffers with lsp attached",
    callback = function(event)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf })
        vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = event.buf })
    end,
})
vim.keymap.set("n", "grf", "<Nop>") -- muscle memory is a bitch!

-- configure diagnostics
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true,
    float = { border = "single" },
    signs = false,
})

-- configure lsp floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    opts.max_width = opts.max_width or 100
    opts.max_height = opts.max_height or 15
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
