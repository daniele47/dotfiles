local function is_toolbox()
    return vim.fn.filereadable('/run/.toolboxenv') == 1 and vim.fn.filereadable('/run/.containerenv') == 1
end

if is_toolbox() then
   vim.g.netrw_browsex_viewer = "TODO" 
   vim.ui.open = function() vim.notify("TODO", 4) end
end
