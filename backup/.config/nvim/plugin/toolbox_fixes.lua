if vim.fn.filereadable('/run/.toolboxenv') == 0 or vim.fn.filereadable('/run/.containerenv') == 0 then
    return
end

vim.g.netrw_browsex_viewer = "systemd-run --user --wait --quiet xdg-open"
vim.ui.open = function(url) os.execute(vim.g.netrw_browsex_viewer .. url) end
