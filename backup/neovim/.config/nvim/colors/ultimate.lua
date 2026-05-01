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

-- blink
vim.cmd([[
    hi BlinkCmpKindSnippet guifg=#e55561
    hi BlinkCmpDetail guifg=#7a818e
    hi BlinkCmpLabelMatch guifg=#48b0bd
    hi BlinkCmpLabelDeprecated gui=strikethrough guifg=#7a818e
    hi BlinkCmpKindInterface guifg=#8ebd6b
    hi BlinkCmpLabe guifg=#a0a8b7
    hi BlinkCmpKindFolder guifg=#cc9057
    hi BlinkCmpKindTypeParameter guifg=#e55561
    hi BlinkCmpKindText guifg=#7a818e
    hi BlinkCmpKindValue guifg=#cc9057
    hi BlinkCmpKind guifg=#bf68d9
    hi BlinkCmpKindStruct guifg=#bf68d9
    hi BlinkCmpKindEvent guifg=#e2b86b
    hi BlinkCmpKindProperty guifg=#48b0bd
    hi BlinkCmpKindPackage guifg=#e2b86b
    hi BlinkCmpKindVariable guifg=#bf68d9
    hi BlinkCmpKindObject guifg=#e55561
    hi BlinkCmpKindNumber guifg=#cc9057
    hi BlinkCmpKindNull guifg=#535965
    hi BlinkCmpKindField guifg=#bf68d9
    hi BlinkCmpKindColor guifg=#8ebd6b
    hi BlinkCmpKindOperator guifg=#e55561
    hi BlinkCmpKindConstructor guifg=#4fa6ed
    hi BlinkCmpKindConstant guifg=#cc9057
    hi BlinkCmpKindKey guifg=#48b0bd
    hi BlinkCmpKindFunction guifg=#4fa6ed
    hi BlinkCmpKindFile guifg=#4fa6ed
    hi BlinkCmpKindModule guifg=#cc9057
    hi BlinkCmpKindMethod guifg=#4fa6ed
    hi BlinkCmpKindKeyword guifg=#48b0bd
    hi BlinkCmpKindDefault guifg=#bf68d9
    hi BlinkCmpKindArray guifg=#e2b86b
    hi BlinkCmpKindUnit guifg=#8ebd6b
    hi BlinkCmpKindEnumMember guifg=#e2b86b
    hi BlinkCmpKindString guifg=#8ebd6b
    hi BlinkCmpKindNamespace guifg=#e55561
    hi BlinkCmpKindEnum guifg=#bf68d9
    hi BlinkCmpKindClass guifg=#e2b86b
    hi BlinkCmpKindReference guifg=#cc9057
    hi BlinkCmpKindBoolean guifg=#cc9057
]])

-- markup
vim.cmd([[
    hi @markup.raw guifg=#8ebd6b
    hi @markup.raw.block guifg=#8ebd6b
    hi @markup.quote gui=italic guifg=#535965
    hi @markup.math guifg=#a0a8b7
    hi @markup.list guifg=#e55561
    hi @markup.list.unchecked gui=italic guifg=#e55561
    hi @markup.list.checked gui=italic guifg=#8ebd6b
    hi @markup.link.url gui=underline guifg=#48b0bd
    hi @markup.link.label guifg=#48b0bd
    hi @markup.heading.6 gui=bold guifg=#cc9057
    hi @markup.heading.5 gui=bold guifg=#bf68d9
    hi @markup.heading.4 gui=bold guifg=#e55561
    hi @markup.heading.3 gui=bold guifg=#cc9057
    hi @markup.heading.1 gui=bold guifg=#e55561
    hi @markup.heading.1.delimiter.vimdoc cterm=underdouble,nocombine gui=underdouble,nocombine guifg=bg guibg=bg guisp=fg
    hi @markup.heading.2 gui=bold guifg=#bf68d9
    hi @markup.heading.2.delimiter.vimdoc cterm=underline,nocombine gui=underline,nocombine guifg=bg guibg=bg guisp=fg
    hi link @markup Special
    hi @markup.strong cterm=bold gui=bold guifg=#a0a8b7
    hi @markup.italic cterm=italic gui=italic guifg=#a0a8b7
    hi @markup.strikethrough cterm=strikethrough gui=strikethrough guifg=#a0a8b7
    hi @markup.underline cterm=underline gui=underline guifg=#a0a8b7
    hi @markup.heading gui=bold guifg=#cc9057
    hi @markup.link guifg=#4fa6ed
]])
