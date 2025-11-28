vim.opt.background = "dark"
vim.g.colors_name = "ultimate"

-- clear highlighting
vim.cmd("highlight clear")
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

-- color palette
local col = {
    fg = {
        white = { gui = "#dadada", tui = 253 },
        red = { gui = "#d75f5f", tui = 167 },
        gold = { gui = "#d7af5f", tui = 179 },
        green = { gui = "#87d75f", tui = 113 },
        lblue = { gui = "#5fd7d7", tui = 80 },
        blue = { gui = "#5f87d7", tui = 68 },
        pink = { gui = "#d75fd7", tui = 170 },
        grey = { gui = "#5f5f87", tui = 60 },
        black = { gui = "#1c1c1c", tui = 234 },
    },
    bg = {
        white = { gui = "#dadada", tui = 253 },
        yellow = { gui = "#d7af5f", tui = 179 },
        pink = { gui = "#ff87ff", tui = 213 },
        red = { gui = "#ff5f5f", tui = 203 },
        green = { gui = "#00af5f", tui = 35 },
        lblue = { gui = "#87afff", tui = 111 },
        diff_grey = { gui = "#4c4f69", tui = 239 },
        diff_lblue = { gui = "#252842", tui = 235 },
        diff_blue = { gui = "#161821", tui = 233 },
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
    if type(fg) == "string" then
        values.link = fg
    end
    vim.api.nvim_set_hl(0, hl, values)
end

-- :h group-name
hi("Comment", col.fg.pink)
hi("Constant", col.fg.gold)
hi("String", "Constant")
hi("Character", "Constant")
hi("Number", "Constant")
hi("Boolean", "Constant")
hi("Float", "Constant")
hi("Identifier", col.fg.green)
hi("Function", "Identifier")
hi("Statement", col.fg.blue)
hi("Conditional", "Statement")
hi("Repeat", "Statement")
hi("Label", "Statement")
hi("Operator", "Statement")
hi("Keyword", "Statement")
hi("Exception", "Statement")
hi("PreProc", col.fg.lblue)
hi("Include", "PreProc")
hi("Define", "PreProc")
hi("Macro", "PreProc")
hi("PreCondit", "PreProc")
hi("Type", "Normal")
hi("StorageClass", "Type")
hi("Structure", "Type")
hi("Typedef", "Type")
hi("Special", "Normal")
hi("SpecialChar", "Special")
hi("Tag", "Special")
hi("Delimiter", "Special")
hi("SpecialComment", "Special")
hi("Debug", "Special")
hi("Underlined", nil, nil, { underline = true })
hi("Ignore", "Normal")
hi("Error", col.fg.red, nil, { bold = true })
hi("Todo", col.bg.lblue, nil, { bold = true })
hi("Added", col.fg.green)
hi("Changed", col.fg.blue)
hi("Removed", col.fg.red)

-- :h highlight-groups
hi("ColorColumn", "Visual")
hi("Conceal", col.fg.grey)
hi("CurSearch", col.fg.black, col.bg.pink)
hi("Cursor", col.fg.black, col.bg.white)
hi("lCursor", "Cursor")
hi("CursorIM", "Cursor")
hi("CursorColumn", "Visual")
hi("CursorLine", "Visual")
hi("Directory", col.fg.lblue)
hi("DiffAdd", col.fg.black, col.bg.green)
hi("DiffChange", col.fg.black, col.bg.lblue)
hi("DiffDelete", col.fg.black, col.bg.red)
hi("DiffText", col.fg.black, col.bg.pink)
hi("DiffTextAdd", "DiffText")
hi("EndOfBuffer", "Conceal")
hi("TermCursor", "Cursor")
hi("OkMsg", col.fg.lgreen)
hi("WarningMsg", col.fg.gold)
hi("ErrorMsg", "Error")
hi("StderrMsg", "Error")
hi("StdoutMsg", "Normal")
hi("WinSeparator", "Conceal")
hi("Folded", "Conceal")
hi("FoldColumn", "Conceal")
hi("SignColumn", "Conceal")
hi("IncSearch", "Search")
hi("Substitute", "Search")
hi("LineNr", "Conceal")
hi("LineNrAbove", "Conceal")
hi("LineNrBelow", "Conceal")
hi("CursorLineNr", "Conceal")
hi("CursorLineFold", "Conceal")
hi("CursorLineSign", "Conceal")
hi("MatchParen", col.fg.pink, nil, { bold = true })
hi("ModeMsg", "Normal")
hi("MsgArea", "Normal")
hi("MsgSeparator", "Statusline")
hi("MoreMsg", "Normal")
hi("NonText", "Conceal")
hi("Normal", col.fg.white, col.bg.diff_blue)
hi("NormalFloat", "Normal")
hi("FloatBorder", "Statusline")
hi("FloatShadow", "FloatBorder")
hi("FloatShadowThrough", "Normal")
hi("FloatTitle", "Normal")
hi("FloatFooter", "Normal")
hi("NormalNC", "Normal")
hi("Pmenu", "Statusline")
hi("PmenuSel", "Visual")
hi("PmenuKind", "Pmenu")
hi("PmenuKindSel", "PmenuSel")
hi("PmenuExtra", "Pmenu")
hi("PmenuExtraSel", "PmenuSel")
hi("PmenuSbar", "Pmenu")
hi("PmenuThumb", "PmenuSel")
hi("PmenuMatch", col.fg.white, nil, { bold = true })
hi("PmenuMatchSel", col.fg.white, nil, { bold = true })
hi("PmenuBorder", "PmenuSel")
hi("PmenuShadow", "PmenuSel")
hi("PmenuShadowThrough", "Pmenu")
hi("ComplMatchIns")
hi("PreInsert", "Added")
hi("ComplHint", "Conceal")
hi("ComplHintMore", "Normal")
hi("Question", "Normal")
hi("QuickFixLine", col.fg.black, col.bg.lblue)
hi("Search", col.fg.black, col.bg.yellow)
hi("SnippetTabstop", "Visual")
hi("SnippetTabstopActive", "Visual")
hi("SpecialKey", "Conceal")
hi("SpellBad", col.fg.red, nil, { undercurl = true, cterm = { underline = true } })
hi("SpellCap", col.fg.blue, nil, { undercurl = true, cterm = { underline = true } })
hi("SpellLocal", col.fg.purple, nil, { undercurl = true, cterm = { underline = true } })
hi("SpellRare", col.fg.lblue, nil, { undercurl = true, cterm = { underline = true } })
hi("StatusLine", nil, col.bg.diff_lblue)
hi("StatusLineNC", "Statusline")
hi("StatusLineTerm", "Statusline")
hi("StatusLineTermNC", "Statusline")
hi("TabLine", "Statusline")
hi("TabLineFill", "Statusline")
hi("TabLineSel", "Normal")
hi("Title", "Normal")
hi("Visual", nil, col.bg.diff_grey)
hi("VisualNOS", "Visual")
hi("Whitespace", "Conceal")
hi("WildMenu", "PmenuSel")
hi("WinBar", "Statusline")
hi("WinBarNC", "Statusline")

-- :h diagnostic-highlights
hi("DiagnosticError", col.fg.red)
hi("DiagnosticWarn", col.fg.gold)
hi("DiagnosticInfo", col.fg.blue)
hi("DiagnosticHint", col.fg.lblue)
hi("DiagnosticOk", col.fg.green)
hi("DiagnosticUnderlineError", nil, nil, { sp = col.fg.red.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineWarn", nil, nil, { sp = col.fg.gold.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineInfo", nil, nil, { sp = col.fg.blue.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineHint", nil, nil, { sp = col.fg.lblue.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineOk", nil, nil, { sp = col.fg.green.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticDeprecated", nil, nil, { strikethrough = true })
hi("DiagnosticUnnecessary", "Conceal")
