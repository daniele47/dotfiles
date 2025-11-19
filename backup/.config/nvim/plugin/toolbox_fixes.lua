if vim.fn.filereadable('/run/.toolboxenv') == 0 or vim.fn.filereadable('/run/.containerenv') == 0 then
    return
end

vim.g.netrw_browsex_viewer = "systemd-run --user --wait --quiet xdg-open "
vim.ui.open = function(url) 
    if vim.uv.fs_stat(url) then
        local path = vim.fs.normalize(vim.fn.resolve(vim.fs.abspath(url)))
        os.execute(vim.g.netrw_browsex_viewer .. vim.fn.shellescape(path))
    else
        os.execute(vim.g.netrw_browsex_viewer .. vim.fn.shellescape(url)) 
    end
end
