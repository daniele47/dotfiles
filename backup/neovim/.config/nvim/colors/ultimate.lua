-- clear highlighting
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
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
		lgrey = { gui = "#a0a0a0", tui = 247 },
		grey = { gui = "#5f5f87", tui = 60 },
		black = { gui = "#1c1c1c", tui = 234 },
		error = { gui = "#ff3333", tui = 196 },
		warning = { gui = "#ffcc00", tui = 220 },
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
hi("Type")
hi("StorageClass", "Type")
hi("Structure", "Type")
hi("Typedef", "Type")
hi("Special")
hi("SpecialChar", "Special")
hi("Tag", "Special")
hi("Delimiter", "Special")
hi("SpecialComment", "Special")
hi("Debug", "Special")
hi("Underlined", nil, nil, { underline = true })
hi("Ignore", col.fg.grey)
hi("Error", col.fg.red, nil, { bold = true })
hi("Todo", col.bg.lblue, nil, { bold = true })
hi("Added", col.fg.green)
hi("Changed", col.fg.blue)
hi("Removed", col.fg.red)

-- :h diagnostic-highlights
hi("DiagnosticError", col.fg.error)
hi("DiagnosticWarn", col.fg.warning)
hi("DiagnosticInfo", col.fg.blue)
hi("DiagnosticHint", col.fg.lblue)
hi("DiagnosticOk", col.fg.green)
hi("DiagnosticUnderlineError", nil, nil, { sp = col.fg.error.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineWarn", nil, nil, { sp = col.fg.warning.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineInfo", nil, nil, { sp = col.fg.blue.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineHint", nil, nil, { sp = col.fg.lblue.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticUnderlineOk", nil, nil, { sp = col.fg.green.gui, undercurl = true, cterm = { underline = true } })
hi("DiagnosticDeprecated", nil, nil, { strikethrough = true })
hi("DiagnosticUnnecessary", "Conceal")

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
hi("WarningMsg", col.fg.warning)
hi("ErrorMsg", "Error")
hi("StderrMsg", "Error")
hi("StdoutMsg", col.fg.white)
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
hi("ModeMsg")
hi("MsgArea")
hi("MsgSeparator", "Statusline")
hi("MoreMsg")
hi("NonText", "Conceal")
hi("Normal", col.fg.white, col.bg.diff_blue)
hi("NormalFloat", "Statusline")
hi("FloatBorder", "Statusline")
hi("FloatShadow", "FloatBorder")
hi("FloatShadowThrough")
hi("FloatTitle")
hi("FloatFooter")
hi("NormalNC")
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
hi("ComplHintMore")
hi("Question")
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
hi("TabLineSel")
hi("Title")
hi("Visual", nil, col.bg.diff_grey)
hi("VisualNOS", "Visual")
hi("Whitespace", "Conceal")
hi("WildMenu", "PmenuSel")
hi("WinBar", "Statusline")
hi("WinBarNC", "Statusline")

-- blink: https://main.cmp.saghen.dev/configuration/appearance.html
hi("BlinkCmpMenu")
hi("BlinkCmpMenuBorder")
hi("BlinkCmpMenuSelection")
hi("BlinkCmpScrollBarThumb")
hi("BlinkCmpScrollBarGutter")
hi("BlinkCmpLabel", col.fg.white)
hi("BlinkCmpLabelDeprecated", col.fg.lgrey, nil, { strikethrough = true })
hi("BlinkCmpLabelMatch", col.fg.lblue)
hi("BlinkCmpLabelDetail")
hi("BlinkCmpLabelDescription")
hi("BlinkCmpKind", col.fg.pink)
hi("BlinkCmpKindArray", col.fg.gold)
hi("BlinkCmpKindBoolean", col.fg.gold)
hi("BlinkCmpKindClass", col.fg.gold)
hi("BlinkCmpKindColor", col.fg.green)
hi("BlinkCmpKindConstant", col.fg.gold)
hi("BlinkCmpKindConstructor", col.fg.blue)
hi("BlinkCmpKindDefault", col.fg.pink)
hi("BlinkCmpKindEnum", col.fg.pink)
hi("BlinkCmpKindEnumMember", col.fg.gold)
hi("BlinkCmpKindEvent", col.fg.gold)
hi("BlinkCmpKindField", col.fg.pink)
hi("BlinkCmpKindFile", col.fg.blue)
hi("BlinkCmpKindFolder", col.fg.gold)
hi("BlinkCmpKindFunction", col.fg.blue)
hi("BlinkCmpKindInterface", col.fg.green)
hi("BlinkCmpKindKey", col.fg.lblue)
hi("BlinkCmpKindKeyword", col.fg.lblue)
hi("BlinkCmpKindMethod", col.fg.blue)
hi("BlinkCmpKindModule", col.fg.gold)
hi("BlinkCmpKindNamespace", col.fg.red)
hi("BlinkCmpKindNull", col.fg.lgrey)
hi("BlinkCmpKindNumber", col.fg.gold)
hi("BlinkCmpKindObject", col.fg.red)
hi("BlinkCmpKindOperator", col.fg.red)
hi("BlinkCmpKindPackage", col.fg.gold)
hi("BlinkCmpKindProperty", col.fg.lblue)
hi("BlinkCmpKindReference", col.fg.gold)
hi("BlinkCmpKindSnippet", col.fg.red)
hi("BlinkCmpKindString", col.fg.green)
hi("BlinkCmpKindStruct", col.fg.pink)
hi("BlinkCmpKindText", col.fg.white)
hi("BlinkCmpKindTypeParameter", col.fg.red)
hi("BlinkCmpKindUnit", col.fg.green)
hi("BlinkCmpKindValue", col.fg.gold)
hi("BlinkCmpKindVariable", col.fg.pink)
hi("BlinkCmpSource")
hi("BlinkCmpGhostText")
hi("BlinkCmpDoc")
hi("BlinkCmpDocBorder")
hi("BlinkCmpDocSeparator")
hi("BlinkCmpDocCursorLine")
hi("BlinkCmpSignatureHelp")
hi("BlinkCmpSignatureHelpBorder")
hi("BlinkCmpSignatureHelpActiveParameter")

-- -- markup
-- vim.cmd([[
--     hi @markup.raw guifg=#8ebd6b
--     hi @markup.raw.block guifg=#8ebd6b
--     hi @markup.quote gui=italic guifg=#535965
--     hi @markup.math guifg=#a0a8b7
--     hi @markup.list guifg=#e55561
--     hi @markup.list.unchecked gui=italic guifg=#e55561
--     hi @markup.list.checked gui=italic guifg=#8ebd6b
--     hi @markup.link.url gui=underline guifg=#48b0bd
--     hi @markup.link.label guifg=#48b0bd
--     hi @markup.heading.6 gui=bold guifg=#cc9057
--     hi @markup.heading.5 gui=bold guifg=#bf68d9
--     hi @markup.heading.4 gui=bold guifg=#e55561
--     hi @markup.heading.3 gui=bold guifg=#cc9057
--     hi @markup.heading.1 gui=bold guifg=#e55561
--     hi @markup.heading.1.delimiter.vimdoc cterm=underdouble,nocombine gui=underdouble,nocombine guifg=bg guibg=bg guisp=fg
--     hi @markup.heading.2 gui=bold guifg=#bf68d9
--     hi @markup.heading.2.delimiter.vimdoc cterm=underline,nocombine gui=underline,nocombine guifg=bg guibg=bg guisp=fg
--     hi link @markup Special
--     hi @markup.strong cterm=bold gui=bold guifg=#a0a8b7
--     hi @markup.italic cterm=italic gui=italic guifg=#a0a8b7
--     hi @markup.strikethrough cterm=strikethrough gui=strikethrough guifg=#a0a8b7
--     hi @markup.underline cterm=underline gui=underline guifg=#a0a8b7
--     hi @markup.heading gui=bold guifg=#cc9057
--     hi @markup.link guifg=#4fa6ed
-- ]])
