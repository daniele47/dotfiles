set background=dark

if has('termguicolors') && !has('gui_running')
  set termguicolors
endif

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'ultimate'

hi! link Terminal Normal
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo
hi! link PopupSelected PmenuSel
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Define PreProc
hi! link Debug Special
hi! link Delimiter Special
hi! link ErrorMsg Error
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor
hi! link debugPC CursorLine

hi Normal guifg=#dadada guibg=#161821 gui=NONE cterm=NONE
hi Added guifg=#87d75f guibg=NONE gui=NONE cterm=NONE
hi Changed guifg=#87afd7 guibg=NONE gui=NONE cterm=NONE
hi Removed guifg=#d75f5f guibg=NONE gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#262831 gui=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi CurSearch guifg=#ff5fff guibg=#000000 gui=reverse cterm=reverse
hi Cursor guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi CursorColumn guifg=NONE guibg=#363841 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#363841 gui=NONE cterm=NONE
hi CursorLineNr guifg=#d7d7ff guibg=#363841 gui=NONE cterm=NONE
hi DiffAdd guifg=#00af5f guibg=#000000 gui=reverse cterm=reverse
hi DiffChange guifg=#87afff guibg=#000000 gui=reverse cterm=reverse
hi DiffDelete guifg=#d7005f guibg=#000000 gui=reverse cterm=reverse
hi DiffText guifg=#ff87ff guibg=#000000 gui=reverse cterm=reverse
hi Directory guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#5f5f87 guibg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#8787af guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#5f5f87 guibg=#161821 gui=NONE cterm=NONE
hi IncSearch guifg=#ffaf00 guibg=#000000 gui=reverse cterm=reverse
hi LineNr guifg=#5f5f87 guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#ff00af guibg=NONE gui=bold cterm=bold
hi ModeMsg guifg=#dadada guibg=NONE gui=bold cterm=bold
hi MoreMsg guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#707070 guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#cdd6f4 guibg=#1e1e2e gui=NONE cterm=NONE
hi PmenuMatch guifg=#cba6f7 guibg=#1e1e2e gui=NONE cterm=NONE
hi PmenuExtra guifg=#000000 guibg=#a6a8b1 gui=NONE cterm=NONE
hi PmenuKind guifg=#000000 guibg=#a6a8b1 gui=bold cterm=bold
hi PmenuSbar guifg=#707070 guibg=#11111b gui=NONE cterm=NONE
hi PmenuSel guifg=#ffffff guibg=#313244 gui=NONE cterm=NONE
hi PmenuMatchSel guifg=#cba6f7 guibg=#313244 gui=bold cterm=bold
hi PmenuExtraSel guifg=#000000 guibg=#d7d7ff gui=NONE cterm=NONE
hi PmenuKindSel guifg=#000000 guibg=#d7d7ff gui=bold cterm=bold
hi PmenuThumb guifg=#dadada guibg=#45475a gui=NONE cterm=NONE
hi Question guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#ff5fff guibg=#000000 gui=reverse cterm=reverse
hi Search guifg=#00afff guibg=#000000 gui=reverse cterm=reverse
hi SignColumn guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#5f5f87 guibg=NONE gui=bold cterm=bold
hi SpellBad guifg=#d75f5f guibg=NONE guisp=#d75f5f gui=undercurl cterm=underline
hi SpellCap guifg=#87afd7 guibg=NONE guisp=#87afd7 gui=undercurl cterm=underline
hi SpellLocal guifg=#af87d7 guibg=NONE guisp=#af87d7 gui=undercurl cterm=underline
hi SpellRare guifg=#5fafaf guibg=NONE guisp=#5fafaf gui=undercurl cterm=underline
hi StatusLine guifg=#cdd6f4 guibg=#1e1e2e cterm=bold
hi StatusLineNC guifg=#8787af guibg=#000000 gui=reverse cterm=reverse
hi TabLine guifg=#8787af guibg=#000000 gui=reverse cterm=reverse
hi TabLineFill guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=#d7d7ff gui=bold cterm=bold
hi Title guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi VertSplit guifg=#5f5f87 guibg=NONE gui=NONE cterm=NONE
hi Visual guifg=#ffaf00 guibg=#000000 gui=reverse cterm=reverse
hi VisualNOS guifg=NONE guibg=#363841 gui=NONE cterm=NONE
hi WarningMsg guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#d7d7ff guibg=#161821 gui=bold cterm=bold
hi Comment guifg=#af87d7 guibg=NONE gui=NONE cterm=NONE
hi Constant guifg=#d75f5f guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#ff5f5f guibg=#000000 gui=bold,reverse cterm=bold,reverse
hi Identifier guifg=#87d75f guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#87afd7 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#5fafaf guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#87afd7 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#d7af5f guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#5fd7af guibg=NONE gui=bold,reverse cterm=bold,reverse
hi Type guifg=#87afd7 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#dadada guibg=NONE gui=underline cterm=underline
hi CursorIM guifg=#000000 guibg=#afff00 gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#000000 gui=NONE cterm=NONE
hi ToolbarButton guifg=#dadada guibg=#000000 gui=bold cterm=bold
hi debugBreakpoint guifg=#8787af guibg=#000000 gui=bold,reverse cterm=bold,reverse
