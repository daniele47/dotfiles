vim.opt.background = "dark"
vim.g.colors_name = "ultimate"

-- clear highlighting
vim.cmd.highlight("clear")
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

-- color palette
local col = {
    fg = {
        white = { gui = "#dadada", tui = 253 },
        yellow = { gui = "#d7d75f", tui = 185 },
        orange = { gui = "#d7af5f", tui = 179 },
        lpink = { gui = "#d75fd7", tui = 170 },
        pink = { gui = "#ff00af", tui = 199 },
        red = { gui = "#d75f5f", tui = 167 },
        purple = { gui = "#af87d7", tui = 140 },
        lgreen = { gui = "#87d75f", tui = 113 },
        green = { gui = "#5fa75f", tui = 71 },
        lblue = { gui = "#5fd7d7", tui = 80 },
        blue = { gui = "#5f87d7", tui = 68 },
        lgrey = { gui = "#8787af", tui = 103 },
        grey = { gui = "#5f5f87", tui = 60 },
        black = { gui = "#1a1a1a", tui = 234 },
    },
    bg = {
        pink = { gui = "#ff87ff", tui = 213 },
        red = { gui = "#ff5f5f", tui = 203 },
        green = { gui = "#00af5f", tui = 35 },
        lblue = { gui = "#87afff", tui = 111 },
        grey = { gui = "#303030", tui = 236 },
        -- following ones have different colors in 24bit vs 256 palette
        diff_blue = { gui = "#161821", tui = 233 }
    },
}

-- util function to assign colors
local function hi(hl, fg, bg, other) 
    local values = other or {}
    if fg ~= nil then
        values.fg = fg.gui
        values.ctermfg = fg.tui
    end
    if bg ~= nil then
        values.bg = bg.gui
        values.ctermbg = bg.tui
    end
    vim.api.nvim_set_hl(0, hl, values)
end
local function hi_link(hl_linked, hl_base)
    vim.api.nvim_set_hl(0, hl_linked, {link = hl_base}) 
end

-- :h group-name
hi("Comment", col.fg.lgrey)
hi("Constant", col.fg.orange)
hi_link("String", "Constant")
hi_link("Character", "Constant")
hi_link("Number", "Constant")
hi_link("Boolean", "Constant")
hi_link("Float", "Constant")
hi("Identifier", col.fg.lgreen)
hi_link("Function", "Identifier")
hi("Statement", col.fg.red)
hi_link("Conditional", "Statement")
hi_link("Repeat", "Statement")
hi_link("Label", "Statement")
hi_link("Operator", "Statement")
hi_link("Keyword", "Statement")
hi_link("Exception", "Statement")
hi("PreProc", col.fg.lblue)
hi_link("Include", "PreProc")
hi_link("Define", "PreProc")
hi_link("Macro", "PreProc")
hi_link("PreCondit", "PreProc")
hi("Type", col.fg.lpink)
hi_link("StorageClass", "Type")
hi_link("Structure", "Type")
hi_link("Typedef", "Type")
hi("Special", col.fg.blue)
hi_link("SpecialChar", "Special")
hi_link("Tag", "Special")
hi_link("Delimiter", "Special")
hi_link("SpecialComment", "Special")
hi_link("Debug", "Special")
hi("Underlined", nil, nil, {underline = true})
hi_link("Ignore", "Normal")
hi("Error", col.fg.red, nil, { bold = true })
hi("Todo", col.bg.lblue, nil, { bold = true })
hi("Added", col.fg.lgreen)
hi("Changed", col.fg.blue)
hi("Removed", col.fg.red)

-- :h highlight-groups
-- hi("ColorColumn")
hi("Conceal", col.fg.grey)
-- hi("CurSearch")
hi("Cursor", col.fg.black, col.bg.white)
hi_link("lCursor", "Cursor")
hi_link("CursorIM", "Cursor")
-- hi("CursorColumn")
-- hi("CursorLine")
hi("Directory", col.fg.lblue)
hi("DiffAdd", col.fg.black, col.bg.green)
hi("DiffChange", col.fg.black, col.bg.lblue)
hi("DiffDelete", col.fg.black, col.bg.red)
hi("DiffText", col.fg.black, col.bg.pink)
hi_link("EndOfBuffer", "Conceal")
hi_link("TermCursor", "Cursor")
hi_link("ErrorMsg", "Error")
hi_link("WinSeparator", "Conceal")
hi_link("Folded", "Conceal")
hi_link("FoldColumn", "Conceal")
hi_link("SignColumn", "Conceal")
-- hi("IncSearch")
-- hi("Substitute")
hi_link("LineNr", "Conceal")
hi_link("LineNrAbove", "Conceal")
hi_link("LineNrBelow", "Conceal")
hi_link("CursorLineNr", "Normal")
hi_link("CursorLineFold", "Normal")
hi_link("CursorLineSign", "Normal")
hi("MatchParen", col.fg.pink, nil, { bold = true })
hi_link("ModeMsg", "Normal")
hi_link("MsgArea", "Normal")
hi_link("MsgSeparator", "Normal")
hi_link("MoreMsg", "Normal")
hi_link("NonText", "Conceal")
hi("Normal", col.fg.white, col.bg.diff_blue)
-- hi("NormalFloat")
-- hi("FloatBorder")
-- hi("FloatTitle")
-- hi("FloatFooter")
hi_link("NormalNC", "Normal")
-- hi("Pmenu")
-- hi("PmenuSel")
-- hi("PmenuKind")
-- hi("PmenuKindSel")
-- hi("PmenuExtra")
-- hi("PmenuExtraSel")
-- hi("PmenuSbar")
-- hi("PmenuThumb")
-- hi("PmenuMatch")
-- hi("PmenuMatchSel")
-- hi("ComplMatchIns")
hi_link("Question", "Normal")
-- hi("QuickFixLine")
-- hi("Search")
-- hi("SnippetTabstop")
hi_link("SpecialKey", "Conceal")
hi("SpellBad", col.fg.red, nil, { undercurl = true, cterm = { underline = true }})
hi("SpellCap", col.fg.blue, nil, { undercurl = true, cterm = { underline = true }})
hi("SpellLocal", col.fg.purple, nil, { undercurl = true, cterm = { underline = true }})
hi("SpellRare", col.fg.lblue, nil, { undercurl = true, cterm = { underline = true }})
-- hi("StatusLine")
-- hi("StatusLineNC")
-- hi("StatusLineTerm")
-- hi("StatusLineTermNC")
-- hi("TabLine")
-- hi("TabLineFill")
-- hi("TabLineSel")
hi_link("Title", "Normal")
-- hi("Visual")
-- hi("VisualNOS")
-- hi("WarningMsg")
hi_link("Whitespace", "Conceal")
-- hi("WildMenu")
-- hi("WinBar")
-- hi("WinBarNC")

-- :h diagnostic-highlights
hi("DiagnosticError", col.fg.red)
hi("DiagnosticWarn", col.fg.orange)
hi("DiagnosticInfo", col.fg.blue)
hi("DiagnosticHint", col.fg.lblue)
hi("DiagnosticOk", col.fg.green)
hi("DiagnosticUnderlineError", nil, nil, { sp = col.fg.red.gui , undercurl = true, cterm = { underline = true}})
hi("DiagnosticUnderlineWarn", nil, nil, { sp = col.fg.orange.gui , undercurl = true, cterm = { underline = true}})
hi("DiagnosticUnderlineInfo", nil, nil, { sp = col.fg.blue.gui , undercurl = true, cterm = { underline = true}})
hi("DiagnosticUnderlineHint", nil, nil, { sp = col.fg.lblue.gui , undercurl = true, cterm = { underline = true}})
hi("DiagnosticUnderlineOk", nil, nil, { sp = col.fg.green.gui , undercurl = true, cterm = { underline = true}})
