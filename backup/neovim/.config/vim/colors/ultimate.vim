set background=dark

hi clear
let g:colors_name = 'ultimate'

let s:t_Co = has('gui_running') ? 16777216 : str2nr(&t_Co)
let s:tgc = has('termguicolors') && &termguicolors

let g:terminal_ansi_colors = ['#1c1c1c', '#d75f5f', '#87d75f', '#d7af5f', '#5f87d7', '#d75fd7', '#5fd7d7', '#dadada', '#5f5f87', '#ff3333', '#00af5f', '#ffcc00', '#87afff', '#ff87ff', '#87d75f', '#ffffff']

hi! link Added String
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link Macro PreProc
hi! link MessageWindow Pmenu
hi! link Number Constant
hi! link Operator Type
hi! link PopupNotification Todo
hi! link PreCondit PreProc
hi! link Removed WarningMsg
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine
hi! link Tag Special
hi! link Terminal Normal
hi! link Typedef Type
hi! link diffBDiffer WarningMsg
hi! link diffCommon WarningMsg
hi! link diffDiffer WarningMsg
hi! link diffIdentical WarningMsg
hi! link diffIsA WarningMsg
hi! link diffNoEOL WarningMsg
hi! link diffOnly WarningMsg
hi! link lCursor Cursor

hi Normal guifg=#dadada guibg=#161821 guisp=NONE gui=NONE ctermfg=253 ctermbg=233 cterm=NONE term=NONE
hi ColorColumn guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=reverse
hi Comment guifg=#d75fd7 guibg=NONE guisp=NONE gui=NONE ctermfg=170 ctermbg=NONE cterm=NONE term=NONE
hi Conceal guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=NONE
hi Constant guifg=#d7af5f guibg=NONE guisp=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE term=NONE
hi Cursor guifg=#1c1c1c guibg=#dadada guisp=NONE gui=NONE ctermfg=234 ctermbg=253 cterm=NONE term=reverse
hi CursorColumn guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=NONE
hi CursorIM guifg=#1c1c1c guibg=#dadada guisp=NONE gui=NONE ctermfg=234 ctermbg=253 cterm=NONE term=NONE
hi CursorLine guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=underline
hi CursorLineNr guifg=#5f5f87 guibg=#4c4f69 guisp=NONE gui=bold ctermfg=60 ctermbg=239 cterm=NONE term=bold
hi DiffAdd guifg=#1c1c1c guibg=#00af5f guisp=NONE gui=NONE ctermfg=234 ctermbg=35 cterm=NONE term=reverse
hi DiffChange guifg=#1c1c1c guibg=#87afff guisp=NONE gui=NONE ctermfg=234 ctermbg=111 cterm=NONE term=NONE
hi DiffDelete guifg=#1c1c1c guibg=#ff5f5f guisp=NONE gui=NONE ctermfg=234 ctermbg=203 cterm=NONE term=reverse
hi DiffText guifg=#1c1c1c guibg=#ff87ff guisp=NONE gui=NONE ctermfg=234 ctermbg=213 cterm=NONE term=reverse
hi Directory guifg=#5fd7d7 guibg=NONE guisp=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE term=NONE
hi EndOfBuffer guifg=#5f5f87 guibg=#161821 guisp=NONE gui=NONE ctermfg=60 ctermbg=233 cterm=NONE term=NONE
hi Error guifg=#d75f5f guibg=#161821 guisp=NONE gui=bold ctermfg=167 ctermbg=233 cterm=bold term=bold,reverse
hi ErrorMsg guifg=#d75f5f guibg=NONE guisp=NONE gui=bold ctermfg=167 ctermbg=NONE cterm=bold term=bold,reverse
hi FoldColumn guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=NONE
hi Folded guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=NONE
hi Identifier guifg=#87d75f guibg=NONE guisp=NONE gui=NONE ctermfg=113 ctermbg=NONE cterm=NONE term=NONE
hi Ignore guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=NONE
hi IncSearch guifg=#1c1c1c guibg=#d7af5f guisp=NONE gui=NONE ctermfg=234 ctermbg=179 cterm=NONE term=bold,reverse,underline
hi Label guifg=#5f87d7 guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE term=NONE
hi LineNr guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=NONE
hi MatchParen guifg=#d75fd7 guibg=NONE guisp=NONE gui=bold ctermfg=170 ctermbg=NONE cterm=bold term=bold,underline
hi ModeMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=bold
hi MoreMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=NONE
hi NonText guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=NONE
hi Pmenu guifg=NONE guibg=#252842 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE term=reverse
hi PmenuBorder guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=NONE
hi PmenuMatch guifg=NONE guibg=#252842 guisp=NONE gui=bold ctermfg=NONE ctermbg=235 cterm=bold term=NONE
hi PmenuMatchSel guifg=NONE guibg=#4c4f69 guisp=NONE gui=bold ctermfg=NONE ctermbg=239 cterm=bold term=NONE
hi PmenuSbar guifg=NONE guibg=#252842 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE term=reverse
hi PmenuSel guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=bold
hi PmenuShadow guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=NONE
hi PmenuThumb guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=NONE
hi PreProc guifg=#5fd7d7 guibg=NONE guisp=NONE gui=NONE ctermfg=80 ctermbg=NONE cterm=NONE term=NONE
hi Question guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=standout
hi QuickFixLine guifg=#1c1c1c guibg=#87afff guisp=NONE gui=NONE ctermfg=234 ctermbg=111 cterm=NONE term=NONE
hi Search guifg=#1c1c1c guibg=#d7af5f guisp=NONE gui=NONE ctermfg=234 ctermbg=179 cterm=NONE term=reverse
hi SignColumn guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=reverse
hi Special guifg=#d75f5f guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE term=NONE
hi SpecialKey guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=bold
hi SpellBad guifg=#d75f5f guibg=NONE guisp=#d75f5f gui=undercurl ctermfg=167 ctermbg=NONE cterm=underline term=underline
hi SpellCap guifg=#5f87d7 guibg=NONE guisp=#5f87d7 gui=undercurl ctermfg=68 ctermbg=NONE cterm=underline term=underline
hi SpellLocal guifg=#d75fd7 guibg=NONE guisp=#d75fd7 gui=undercurl ctermfg=170 ctermbg=NONE cterm=underline term=underline
hi SpellRare guifg=#5fd7d7 guibg=NONE guisp=#5fd7d7 gui=undercurl ctermfg=80 ctermbg=NONE cterm=underline term=underline
hi Statement guifg=#5f87d7 guibg=NONE guisp=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE term=NONE
hi StatusLine guifg=NONE guibg=#252842 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE term=bold,reverse
hi StatusLineNC guifg=NONE guibg=#252842 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE term=bold,underline
hi Title guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=NONE
hi Todo guifg=NONE guibg=#87afff guisp=NONE gui=bold ctermfg=NONE ctermbg=111 cterm=bold term=bold,reverse
hi ToolbarButton guifg=NONE guibg=#252842 guisp=NONE gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE term=bold,reverse
hi ToolbarLine guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=reverse
hi Type guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE term=NONE
hi Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline term=underline
hi VertSplit guifg=#5f5f87 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE term=NONE
hi Visual guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=reverse
hi VisualNOS guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=NONE
hi WarningMsg guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE term=standout
hi WildMenu guifg=NONE guibg=#4c4f69 guisp=NONE gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE term=bold
hi debugBreakpoint guifg=#87d75f guibg=#161821 guisp=NONE gui=reverse ctermfg=113 ctermbg=233 cterm=reverse term=reverse
hi debugPC guifg=#5fd7d7 guibg=#161821 guisp=NONE gui=reverse ctermfg=80 ctermbg=233 cterm=reverse term=reverse

if s:tgc || s:t_Co >= 256
  hi! link CursorLineNr CursorLine
  finish
endif

if s:t_Co >= 16
  hi! link CursorLineNr CursorLine
  hi Normal ctermfg=white ctermbg=black cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi Comment ctermfg=magenta ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Constant ctermfg=yellow ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=black ctermbg=white cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi CursorIM ctermfg=black ctermbg=white cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi DiffAdd ctermfg=black ctermbg=green cterm=NONE
  hi DiffChange ctermfg=black ctermbg=blue cterm=NONE
  hi DiffDelete ctermfg=black ctermbg=red cterm=NONE
  hi DiffText ctermfg=black ctermbg=magenta cterm=NONE
  hi Directory ctermfg=cyan ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=darkgray ctermbg=black cterm=NONE
  hi Error ctermfg=red ctermbg=black cterm=bold
  hi ErrorMsg ctermfg=red ctermbg=NONE cterm=bold
  hi FoldColumn ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Folded ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=green ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi IncSearch ctermfg=black ctermbg=yellow cterm=NONE
  hi Label ctermfg=blue ctermbg=NONE cterm=NONE
  hi LineNr ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=magenta ctermbg=NONE cterm=bold
  hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi NonText ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuBorder ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuMatch ctermfg=NONE ctermbg=darkgray cterm=bold
  hi PmenuMatchSel ctermfg=NONE ctermbg=darkgray cterm=bold
  hi PmenuSbar ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuSel ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuShadow ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuThumb ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PreProc ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
  hi QuickFixLine ctermfg=black ctermbg=blue cterm=NONE
  hi Search ctermfg=black ctermbg=yellow cterm=NONE
  hi SignColumn ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Special ctermfg=red ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=red ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=blue ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=magenta ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=cyan ctermbg=NONE cterm=underline
  hi Statement ctermfg=blue ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi StatusLineNC ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Todo ctermfg=NONE ctermbg=blue cterm=bold
  hi ToolbarButton ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Type ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi VertSplit ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Visual ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi VisualNOS ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi WarningMsg ctermfg=yellow ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi debugBreakpoint ctermfg=green ctermbg=black cterm=reverse
  hi debugPC ctermfg=cyan ctermbg=black cterm=reverse
  finish
endif

if s:t_Co >= 8
  hi! link CursorLineNr CursorLine
  hi Normal ctermfg=white ctermbg=black cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi Comment ctermfg=magenta ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Constant ctermfg=yellow ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=black ctermbg=white cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi CursorIM ctermfg=black ctermbg=white cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi DiffAdd ctermfg=black ctermbg=green cterm=NONE
  hi DiffChange ctermfg=black ctermbg=blue cterm=NONE
  hi DiffDelete ctermfg=black ctermbg=red cterm=NONE
  hi DiffText ctermfg=black ctermbg=magenta cterm=NONE
  hi Directory ctermfg=cyan ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=darkgray ctermbg=black cterm=NONE
  hi Error ctermfg=red ctermbg=black cterm=bold
  hi ErrorMsg ctermfg=red ctermbg=NONE cterm=bold
  hi FoldColumn ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Folded ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=green ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi IncSearch ctermfg=black ctermbg=yellow cterm=NONE
  hi Label ctermfg=blue ctermbg=NONE cterm=NONE
  hi LineNr ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=magenta ctermbg=NONE cterm=bold
  hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi NonText ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuBorder ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuMatch ctermfg=NONE ctermbg=darkgray cterm=bold
  hi PmenuMatchSel ctermfg=NONE ctermbg=darkgray cterm=bold
  hi PmenuSbar ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuSel ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuShadow ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PmenuThumb ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi PreProc ctermfg=cyan ctermbg=NONE cterm=NONE
  hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
  hi QuickFixLine ctermfg=black ctermbg=blue cterm=NONE
  hi Search ctermfg=black ctermbg=yellow cterm=NONE
  hi SignColumn ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Special ctermfg=red ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=red ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=blue ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=magenta ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=cyan ctermbg=NONE cterm=underline
  hi Statement ctermfg=blue ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi StatusLineNC ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Todo ctermfg=NONE ctermbg=blue cterm=bold
  hi ToolbarButton ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Type ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi VertSplit ctermfg=darkgray ctermbg=NONE cterm=NONE
  hi Visual ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi VisualNOS ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi WarningMsg ctermfg=yellow ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=NONE ctermbg=darkgray cterm=NONE
  hi debugBreakpoint ctermfg=green ctermbg=black cterm=reverse
  hi debugPC ctermfg=cyan ctermbg=black cterm=reverse
  finish
endif

if s:t_Co >= 0
  hi CurSearch term=reverse
  hi CursorLineFold term=underline
  hi CursorLineSign term=underline
  hi Float term=NONE
  hi Function term=NONE
  hi Number term=NONE
  hi StatusLineTerm term=bold,reverse
  hi StatusLineTermNC term=bold,underline
  hi TabLine term=bold,underline
  hi TabLineFill term=NONE
  hi TabLineSel term=bold,reverse
  hi Terminal term=NONE
  finish
endif

" vim: et ts=8 sw=2 sts=2
