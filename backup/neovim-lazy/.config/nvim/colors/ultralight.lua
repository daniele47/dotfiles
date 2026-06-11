-- clear highlighting
vim.cmd("highlight clear")
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

-- color palette (light theme)
local col = {
    fg = {
        white = { gui = "#2d2d2d", tui = 236 },  -- dark text for light bg
        red = { gui = "#af0000", tui = 124 },
        gold = { gui = "#af5f00", tui = 130 },
        green = { gui = "#008700", tui = 28 },
        lblue = { gui = "#0087af", tui = 31 },
        blue = { gui = "#005faf", tui = 25 },
        pink = { gui = "#af0087", tui = 126 },
        grey = { gui = "#8a8a8a", tui = 245 },
        black = { gui = "#e8e8e8", tui = 254 },  -- light bg color
    },
    bg = {
        white = { gui = "#e8e8e8", tui = 254 },
        yellow = { gui = "#ffdfaf", tui = 223 },
        pink = { gui = "#ffafdf", tui = 218 },
        red = { gui = "#ffafaf", tui = 217 },
        green = { gui = "#afdfaf", tui = 151 },
        lblue = { gui = "#afdfff", tui = 153 },
        diff_grey = { gui = "#e0e0e0", tui = 254 },
        diff_lblue = { gui = "#d0e8f0", tui = 189 },
        diff_blue = { gui = "#f5f5f5", tui = 255 },
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
hi("OkMsg", col.fg.green)
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
hi("NormalFloat", "Statusline")
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
hi("ComplMatchIns", nil)
hi("PreInsert", "Added")
hi("ComplHint", "Conceal")
hi("ComplHintMore", "Normal")
hi("Question", "Normal")
hi("QuickFixLine", col.fg.black, col.bg.lblue)
hi("Search", col.fg.black, col.bg.yellow)
hi("SnippetTabstop", "Visual")
hi("SnippetTabstopActive", "Visual")
hi("SpecialKey", "Conceal")
hi("SpellBad", nil, nil, { sp = col.fg.red.gui, undercurl = true, cterm = { underline = true } })
hi("SpellCap", nil, nil, { sp = col.fg.blue.gui, undercurl = true, cterm = { underline = true } })
hi("SpellLocal", nil, nil, { sp = col.fg.pink.gui, undercurl = true, cterm = { underline = true } })
hi("SpellRare", nil, nil, { sp = col.fg.lblue.gui, undercurl = true, cterm = { underline = true } })
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

-- blink (light theme adjustments)
vim.cmd([[
    hi BlinkCmpKindSnippet guifg=#d1454f
    hi BlinkCmpDetail guifg=#6a6f78
    hi BlinkCmpLabelMatch guifg=#3a8b97
    hi BlinkCmpLabelDeprecated gui=strikethrough guifg=#6a6f78
    hi BlinkCmpKindInterface guifg=#6f9b4d
    hi BlinkCmpLabel guifg=#8a909d
    hi BlinkCmpKindFolder guifg=#b5783f
    hi BlinkCmpKindTypeParameter guifg=#d1454f
    hi BlinkCmpKindText guifg=#6a6f78
    hi BlinkCmpKindValue guifg=#b5783f
    hi BlinkCmpKind guifg=#9f5ab8
    hi BlinkCmpKindStruct guifg=#9f5ab8
    hi BlinkCmpKindEvent guifg=#c9a34d
    hi BlinkCmpKindProperty guifg=#3a8b97
    hi BlinkCmpKindPackage guifg=#c9a34d
    hi BlinkCmpKindVariable guifg=#9f5ab8
    hi BlinkCmpKindObject guifg=#d1454f
    hi BlinkCmpKindNumber guifg=#b5783f
    hi BlinkCmpKindNull guifg=#6a6f78
    hi BlinkCmpKindField guifg=#9f5ab8
    hi BlinkCmpKindColor guifg=#6f9b4d
    hi BlinkCmpKindOperator guifg=#d1454f
    hi BlinkCmpKindConstructor guifg=#3a87c4
    hi BlinkCmpKindConstant guifg=#b5783f
    hi BlinkCmpKindKey guifg=#3a8b97
    hi BlinkCmpKindFunction guifg=#3a87c4
    hi BlinkCmpKindFile guifg=#3a87c4
    hi BlinkCmpKindModule guifg=#b5783f
    hi BlinkCmpKindMethod guifg=#3a87c4
    hi BlinkCmpKindKeyword guifg=#3a8b97
    hi BlinkCmpKindDefault guifg=#9f5ab8
    hi BlinkCmpKindArray guifg=#c9a34d
    hi BlinkCmpKindUnit guifg=#6f9b4d
    hi BlinkCmpKindEnumMember guifg=#c9a34d
    hi BlinkCmpKindString guifg=#6f9b4d
    hi BlinkCmpKindNamespace guifg=#d1454f
    hi BlinkCmpKindEnum guifg=#9f5ab8
    hi BlinkCmpKindClass guifg=#c9a34d
    hi BlinkCmpKindReference guifg=#b5783f
    hi BlinkCmpKindBoolean guifg=#b5783f
]])

-- markup (light theme)
vim.cmd([[
    hi @markup.raw guifg=#6f9b4d
    hi @markup.raw.block guifg=#6f9b4d
    hi @markup.quote gui=italic guifg=#a0a0a0
    hi @markup.math guifg=#8a909d
    hi @markup.list guifg=#d1454f
    hi @markup.list.unchecked gui=italic guifg=#d1454f
    hi @markup.list.checked gui=italic guifg=#6f9b4d
    hi @markup.link.url gui=underline guifg=#3a8b97
    hi @markup.link.label guifg=#3a8b97
    hi @markup.heading.6 gui=bold guifg=#b5783f
    hi @markup.heading.5 gui=bold guifg=#9f5ab8
    hi @markup.heading.4 gui=bold guifg=#d1454f
    hi @markup.heading.3 gui=bold guifg=#b5783f
    hi @markup.heading.1 gui=bold guifg=#d1454f
    hi @markup.heading.1.delimiter.vimdoc cterm=underdouble,nocombine gui=underdouble,nocombine guifg=bg guibg=bg guisp=fg
    hi @markup.heading.2 gui=bold guifg=#9f5ab8
    hi @markup.heading.2.delimiter.vimdoc cterm=underline,nocombine gui=underline,nocombine guifg=bg guibg=bg guisp=fg
    hi link @markup Special
    hi @markup.strong cterm=bold gui=bold guifg=#8a909d
    hi @markup.italic cterm=italic gui=italic guifg=#8a909d
    hi @markup.strikethrough cterm=strikethrough gui=strikethrough guifg=#8a909d
    hi @markup.underline cterm=underline gui=underline guifg=#8a909d
    hi @markup.heading gui=bold guifg=#b5783f
    hi @markup.link guifg=#3a87c4
]])
