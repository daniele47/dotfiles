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
        gold = { gui = "#d7af5f", tui = 179 },
        lpink = { gui = "#d75fd7", tui = 170 },
        pink = { gui = "#ff00af", tui = 199 },
        red = { gui = "#d75f5f", tui = 167 },
        purple = { gui = "#af87d7", tui = 140 },
        lgreen = { gui = "#87d75f", tui = 113 },
        green = { gui = "#5fa75f", tui = 71 },
        lblue = { gui = "#5fd7d7", tui = 80 },
        blue = { gui = "#5f87d7", tui = 68 },
        grey = { gui = "#8787af", tui = 103 },
        black = { gui = "#1a1a1a", tui = 234 },
    },
    bg = {
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
hi("Comment", col.fg.grey)
hi("Constant", col.fg.red)
hi("String", col.fg.gold)
hi_link("Character", "Constant")
hi_link("Number", "Constant")
hi_link("Boolean", "Constant")
hi_link("Float", "Constant")
hi("Identifier", col.fg.lgreen)
hi("Function", col.fg.lpink)
hi("Statement", col.fg.lblue)
hi_link("Conditional", "Statement")
hi_link("Repeat", "Statement")
hi_link("Label", "Statement")
hi_link("Operator", "Statement")
hi_link("Keyword", "Statement")
hi_link("Exception", "Statement")
hi("PreProc", col.fg.yellow)
hi_link("Include", "PreProc")
hi_link("Define", "PreProc")
hi_link("Macro", "PreProc")
hi_link("PreCondit", "PreProc")
hi("Type", col.fg.green)
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
hi("Ignore")
-- hi("Error")
-- hi("Todo")
hi("Added", col.fg.lgreen)
hi("Changed", col.fg.blue)
hi("Removed", col.fg.red)

-- :h highlight-groups
-- hi("ColorColumn")
-- hi("Conceal")
-- hi("CurSearch")
-- hi("Cursor")
-- hi("lCursor")
-- hi("CursorIM")
-- hi("CursorColumn")
-- hi("CursorLine")
-- hi("Directory")
-- hi("DiffAdd")
-- hi("DiffChange")
-- hi("DiffDelete")
-- hi("DiffText")
-- hi("EndOfBuffer")
-- hi("TermCursor")
-- hi("ErrorMsg")
-- hi("WinSeparator")
-- hi("Folded")
-- hi("FoldColumn")
-- hi("SignColumn")
-- hi("IncSearch")
-- hi("Substitute")
-- hi("LineNr")
-- hi("LineNrAbove")
-- hi("LineNrBelow")
-- hi("CursorLineNr")
-- hi("CursorLineFold")
-- hi("CursorLineSign")
-- hi("MatchParen")
-- hi("ModeMsg")
-- hi("MsgArea")
-- hi("MsgSeparator")
-- hi("MoreMsg")
-- hi("NonText")
-- hi("Normal")
-- hi("NormalFloat")
-- hi("FloatBorder")
-- hi("FloatTitle")
-- hi("FloatFooter")
-- hi("NormalNC")
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
-- hi("Question")
-- hi("QuickFixLine")
-- hi("Search")
-- hi("SnippetTabstop")
-- hi("SpecialKey")
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
-- hi("Title")
-- hi("Visual")
-- hi("VisualNOS")
-- hi("WarningMsg")
-- hi("Whitespace")
-- hi("WildMenu")
-- hi("WinBar")
-- hi("WinBarNC")

-- vim.cmd([[
--
--     " builtin highlight groups
--     hi Normal guifg=#dadada guibg=#161821 ctermfg=253 ctermbg=233 gui=NONE cterm=NONE
--     hi Added guifg=#87d75f guibg=NONE ctermfg=113 ctermbg=NONE gui=NONE cterm=NONE
--     hi Changed guifg=#87afd7 guibg=NONE ctermfg=110 ctermbg=NONE gui=NONE cterm=NONE
--     hi Removed guifg=#d75f5f guibg=NONE ctermfg=167 ctermbg=NONE gui=NONE cterm=NONE
--     hi ColorColumn guifg=NONE guibg=#262831 ctermfg=NONE ctermbg=235 gui=NONE cterm=NONE
--     hi Conceal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
--     hi CurSearch guifg=#ff5fff guibg=#000000 ctermfg=207 ctermbg=16 gui=reverse cterm=reverse
--     hi Cursor guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
--     hi CursorColumn guifg=NONE guibg=#363841 ctermfg=NONE ctermbg=237 gui=NONE cterm=NONE
--     hi CursorLine guifg=NONE guibg=#363841 ctermfg=NONE ctermbg=237 gui=NONE cterm=NONE
--     hi CursorLineNr guifg=#d7d7ff guibg=#363841 ctermfg=189 ctermbg=237 gui=NONE cterm=NONE
--     hi DiffAdd guifg=#00af5f guibg=#000000 ctermfg=35 ctermbg=16 gui=reverse cterm=reverse
--     hi DiffChange guifg=#87afff guibg=#000000 ctermfg=111 ctermbg=16 gui=reverse cterm=reverse
--     hi DiffDelete guifg=#d7005f guibg=#000000 ctermfg=161 ctermbg=16 gui=reverse cterm=reverse
--     hi DiffText guifg=#ff87ff guibg=#000000 ctermfg=213 ctermbg=16 gui=reverse cterm=reverse
--     hi EndOfBuffer guifg=#5f5f87 guibg=NONE ctermfg=60 ctermbg=NONE gui=NONE cterm=NONE
--     hi FoldColumn guifg=#8787af guibg=NONE ctermfg=103 ctermbg=NONE gui=NONE cterm=NONE
--     hi Folded guifg=#8787af guibg=#161821 ctermfg=103 ctermbg=233 gui=NONE cterm=NONE
--     hi IncSearch guifg=#ffaf00 guibg=#000000 ctermfg=214 ctermbg=16 gui=reverse cterm=reverse
--     hi LineNr guifg=#5f5f87 guibg=NONE ctermfg=60 ctermbg=NONE gui=NONE cterm=NONE
--     hi MatchParen guifg=#ff00af guibg=NONE ctermfg=199 ctermbg=NONE gui=bold cterm=bold
--     hi ModeMsg guifg=#dadada guibg=NONE ctermfg=253 ctermbg=NONE gui=bold cterm=bold
--     hi NonText guifg=#707070 guibg=NONE ctermfg=242 ctermbg=NONE gui=NONE cterm=NONE
--     hi Pmenu guifg=#cdd6f4 guibg=#11111b ctermfg=189 ctermbg=233 gui=NONE cterm=NONE
--     hi PmenuMatch guifg=#cba6f7 guibg=#11111b ctermfg=183 ctermbg=233 gui=bold cterm=bold
--     hi PmenuExtra guifg=#585870 guibg=#11111b ctermfg=60 ctermbg=233 gui=NONE cterm=NONE
--     hi PmenuKind guifg=#8787af guibg=#11111b ctermfg=103 ctermbg=233 gui=bold cterm=bold
--     hi PmenuSbar guifg=#707070 guibg=#11111b ctermfg=242 ctermbg=233 gui=NONE cterm=NONE
--     hi PmenuSel guifg=#ffffff guibg=#45475a ctermfg=15 ctermbg=239 gui=NONE cterm=NONE
--     hi PmenuMatchSel guifg=#cba6f7 guibg=#45475a ctermfg=183 ctermbg=239 gui=bold cterm=bold
--     hi PmenuExtraSel guifg=#a8a8c0 guibg=#45475a ctermfg=146 ctermbg=239 gui=NONE cterm=NONE
--     hi PmenuKindSel guifg=#b7b7d7 guibg=#45475a ctermfg=146 ctermbg=239 gui=bold cterm=bold
--     hi PmenuThumb guifg=#dadada guibg=#45475a ctermfg=253 ctermbg=239 gui=NONE cterm=NONE
--     hi Question guifg=#dadada guibg=NONE ctermfg=253 ctermbg=NONE gui=NONE cterm=NONE
--     hi QuickFixLine guifg=#ff5fff guibg=#000000 ctermfg=207 ctermbg=16 gui=reverse cterm=reverse
--     hi Search guifg=#00afff guibg=#000000 ctermfg=39 ctermbg=16 gui=reverse cterm=reverse
--     hi SpecialKey guifg=#5f5f87 guibg=NONE ctermfg=60 ctermbg=NONE gui=bold cterm=bold
--     hi SpellBad guifg=#d75f5f guibg=NONE guisp=#d75f5f ctermfg=167 ctermbg=NONE gui=undercurl cterm=underline
--     hi SpellCap guifg=#87afd7 guibg=NONE guisp=#87afd7 ctermfg=110 ctermbg=NONE gui=undercurl cterm=underline
--     hi SpellLocal guifg=#af87d7 guibg=NONE guisp=#af87d7 ctermfg=140 ctermbg=NONE gui=undercurl cterm=underline
--     hi SpellRare guifg=#5fafaf guibg=NONE guisp=#5fafaf ctermfg=73 ctermbg=NONE gui=undercurl cterm=underline
--     hi StatusLine guifg=#cdd6f4 guibg=#1e1e2e ctermfg=189 ctermbg=235 gui=NONE cterm=NONE
--     hi StatusLineNC guifg=#8787af guibg=#000000 ctermfg=103 ctermbg=16 gui=reverse cterm=reverse
--     hi TabLine guifg=#8787af guibg=#000000 ctermfg=103 ctermbg=16 gui=reverse cterm=reverse
--     hi TabLineSel guifg=#000000 guibg=#d7d7ff ctermfg=16 ctermbg=189 gui=bold cterm=bold
--     hi Title guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
--     hi VertSplit guifg=#5f5f87 guibg=NONE ctermfg=60 ctermbg=NONE gui=NONE cterm=NONE
--     hi Visual guifg=NONE guibg=#3a3a5f ctermfg=NONE ctermbg=60 gui=NONE cterm=NONE
--     hi VisualNOS guifg=NONE guibg=#2a2a3f ctermfg=NONE ctermbg=236 gui=NONE cterm=NONE
--     hi WildMenu guifg=#d7d7ff guibg=#161821 ctermfg=189 ctermbg=233 gui=bold cterm=bold
--     hi Comment guifg=#8787af guibg=NONE ctermfg=103 ctermbg=NONE gui=NONE cterm=NONE
--     hi Constant guifg=#d75f5f guibg=NONE ctermfg=167 ctermbg=NONE gui=NONE cterm=NONE
--     hi Error guifg=#ff5f5f guibg=NONE ctermfg=203 ctermbg=NONE gui=bold cterm=bold
--     hi Identifier guifg=#87d75f guibg=NONE ctermfg=113 ctermbg=NONE gui=NONE cterm=NONE
--     hi Function guifg=#cf6fdf guibg=NONE ctermfg=170 ctermbg=NONE gui=NONE cterm=NONE
--     hi Statement guifg=#5fd7d7 guibg=NONE ctermfg=80 ctermbg=NONE gui=NONE cterm=NONE
--     hi String guifg=#d7af5f guibg=NONE ctermfg=179 ctermbg=NONE gui=NONE cterm=NONE
--     hi Todo guifg=#5fd7af guibg=NONE ctermfg=79 ctermbg=NONE gui=bold,reverse cterm=bold,reverse
--     hi Type guifg=#5f87ff guibg=NONE ctermfg=69 ctermbg=NONE gui=NONE cterm=NONE
--     hi Underlined guifg=#dadada guibg=NONE ctermfg=253 ctermbg=NONE gui=underline cterm=underline
--     hi CursorIM guifg=#000000 guibg=#afff00 ctermfg=16 ctermbg=154 gui=NONE cterm=NONE
--     hi ToolbarLine guifg=NONE guibg=#000000 ctermfg=NONE ctermbg=16 gui=NONE cterm=NONE
--     hi ToolbarButton guifg=#dadada guibg=#000000 ctermfg=253 ctermbg=16 gui=bold cterm=bold
--     hi debugBreakpoint guifg=#8787af guibg=#000000 ctermfg=103 ctermbg=16 gui=bold,reverse cterm=bold,reverse
--
--     " builtin highlight groups linked
--     hi! link Terminal Normal
--     hi! link StatusLineTerm StatusLine
--     hi! link StatusLineTermNC StatusLineNC
--     hi! link MessageWindow Pmenu
--     hi! link PopupNotification Todo
--     hi! link PopupSelected PmenuSel
--     hi! link Boolean Constant
--     hi! link Character Constant
--     hi! link Conditional Statement
--     hi! link Define Statement
--     hi! link Debug Special
--     hi! link Delimiter Special
--     hi! link ErrorMsg Error
--     hi! link Exception Statement
--     hi! link Float Constant
--     hi! link Include Statement
--     hi! link Keyword Statement
--     hi! link Label Statement
--     hi! link Macro Statement
--     hi! link Number Constant
--     hi! link Operator Statement
--     hi! link PreCondit Statement
--     hi! link PreProc Statement
--     hi! link Repeat Statement
--     hi! link Special Statement
--     hi! link SpecialChar Special
--     hi! link SpecialComment Special
--     hi! link StorageClass Type
--     hi! link Structure Type
--     hi! link Tag Special
--     hi! link Typedef Type
--     hi! link lCursor Cursor
--     hi! link debugPC CursorLine
--     hi! link Directory Question
--     hi! link SignColumn Question
--     hi! link TabLineFill Question
--     hi! link WarningMsg Question
--     hi! link Ignore Question
--     hi! link WinSeparator VertSplit
--
--     " diagnostic undercurl
--     hi DiagnosticUnderlineError gui=undercurl
--     hi DiagnosticUnderlineWarn gui=undercurl
--     hi DiagnosticUnderlineInfo gui=undercurl
--     hi DiagnosticUnderlineHint gui=undercurl
--     hi DiagnosticUnderlineOk gui=undercurl
--
-- ]])
