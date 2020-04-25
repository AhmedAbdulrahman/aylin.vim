" vim:fdm=marker"
" Vim Color File"
" Name: aylin.vim"
" Author: Ahmed Abdulrahman (@_ahmed_ab)"
" Maintainer: https://github.com/AhmedAbdulrahman/aylin.vim"
" License: The MIT License (MIT)"

" === Colors ==="
" --------------------------"
:let _white       = '#ffffff'
:let _l_white     = '#ebefff'
:let _d_white     = '#c8c8db'
:let _gray_light  = '#74778c'
:let _gray        = '#606375'
:let _gray_dark   = '#535560'
:let _semigray    = "#42444b"
:let _lightblack  = '#383b47'
:let _semiblack   = '#2d2f37'
:let _black       = '#24262e'

:let _aubergine   = '#e18fb5'
:let _marzipan    = '#ecc48d'
:let _d_turquoise = '#7fdbca'
:let _l_sky       = '#9fd4ff'
:let _sky         = '#6cbeff'
:let _sap         = '#ebff00'
:let _purple      = '#c792ea'
:let _pink        = '#f45c7f'
:let _green       = '#addb67'

" Clear any other set colors"
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

let g:colors_name="aylin"

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:aylin_terminal_italics")
  let g:aylin_terminal_italics = 0
endif

let colorgroup = {}

" === Highlights ==="
let colorgroup['Normal']       = {"GUIFG": _l_white,     "GUIBG":  _black}
let colorgroup['Darker']       = {"GUIFG": _gray,      "GUIBG":  _black}
let colorgroup['ColorColumn']  = {"GUIFG": _black, "GUIBG":  _aubergine}
let colorgroup['Conceal']      = {"GUIFG": _sap,        "GUI": "bold"}
let colorgroup['Cursor']       = {"GUIFG": _black, "GUIBG":  _aubergine}
let colorgroup['iCursor']      = {"GUIFG": _black, "GUIBG":  _marzipan}
let colorgroup['CursorLine']   = {"GUIFG": "NONE",     "GUIBG":  _semiblack}
let colorgroup['CursorLineNr'] = {"GUIFG": _gray_dark, "GUIBG":  _black}
let colorgroup['Directory']    = {"GUIFG": _marzipan,   "GUIBG":  _black}
let colorgroup['ErrorMsg']     = {"GUIFG": _black, "GUIBG":  _aubergine}
let colorgroup['FoldColumn']   = {                     "GUIBG":  _black}
let colorgroup['Folded']       = {"GUIFG": _l_white,     "GUIBG":  _semiblack}
let colorgroup['LineNr']       = {"GUIFG": _lightblack, "GUIBG":  _black}
if &background == "light"
  let colorgroup['LineNr']     = {"GUIFG": _gray, "GUIBG":  _black}
endif
let colorgroup['MatchParen']   = {"GUIFG": _black, "GUIBG":  _l_white}
let colorgroup['ModeMsg']      = {"GUIFG": _black, "GUIBG":  _marzipan}
let colorgroup['Whitespace']   = {"GUIFG": _semiblack, "CTERMFG":235}
let colorgroup['Pmenu']        = {"GUIFG": _l_white,     "GUIBG":  _gray_dark}
let colorgroup['PmenuSel']     = {"GUIFG": _black, "GUIBG":  _marzipan}
let colorgroup['PmenuSbar']    = {"GUIBG":  _black}
let colorgroup['Search']       = {"GUIBG":  _gray_dark, "GUI": "underline"}
let colorgroup['SignColumn']   = {"GUIBG":  _black}
let colorgroup['StatusLine']   = {"GUIFG": _gray,      "GUIBG":  _semiblack}
let colorgroup['StatusLineNC'] = {"GUIFG": _gray_dark, "GUIBG":  _semiblack}
let colorgroup['Tabline']      = {"GUIFG": _gray,      "GUIBG":  _semiblack}
let colorgroup['TablineFill']  = {"GUIBG":  _black}
let colorgroup['Title']        = {"GUIFG": _marzipan, "GUI": "bold"}
let colorgroup['Todo']         = {"GUIFG": _black, "GUIBG":  _sky, "GUI": "italic"}
let colorgroup['VertSplit']    = {"GUIFG": _semiblack,      "GUIBG":  _semiblack}
let colorgroup['Visual']       = {"GUIBG": _semigray}
if &background == "light"
  let colorgroup['Visual']     = {"GUIFG": _l_white,     "GUIBG":  _sap}
endif
let colorgroup['WarningMsg']   = {"GUIFG": _pink, "GUIBG":  _black}

" === Other highlighting groups ==="
let colorgroup['Access']       = {"GUIFG": _marzipan, "GUI": "bold"}
let colorgroup['Character']    = {"GUIFG": _sky}
let colorgroup['Define']       = {"GUIFG": _gray_light}
let colorgroup['Function']     = {"GUIFG": _d_turquoise}
let colorgroup['Label']        = {"GUIFG": _d_turquoise}
let colorgroup['Module']       = {"GUIFG": _aubergine, "GUI": "underline"}
let colorgroup['NonText']      = {"GUIFG": _gray_dark}
let colorgroup['String']       = {"GUIFG": _marzipan}
let colorgroup['Structure']    = {"GUIFG": _gray}
let colorgroup['Object']       = {"GUIFG": _gray}
let colorgroup['Xml']          = {"GUIFG": _purple}
let colorgroup['Punctuation']  = {"GUIFG": _purple}
let colorgroup['Attr']         = {"GUIFG": _green}

" === Syntax ==="
let colorgroup['Comment']      = {"GUIFG": _gray_light, "CTERMFG":244, "CTERMBG":"NONE", "GUIBG": "NONE", "GUISP":"NONE", "CTERM":"NONE", "GUI":"NONE"}
let colorgroup['Constant']     = {"GUIFG": _marzipan, "GUI": "bold"}
let colorgroup['Identifier']   = {"GUIFG": _aubergine}
let colorgroup['Statement']    = {"GUIFG": _l_sky}
let colorgroup['PreProc']      = {"GUIFG": _white}
let colorgroup['Type']         = {"GUIFG": _d_white}
let colorgroup['Special']      = {"GUIFG": _aubergine}
let colorgroup['Underlined']   = {"GUIFG": _marzipan, "GUI": "underline"}
let colorgroup['Error']        = {"GUIFG": _black, "GUIBG": _aubergine}

" === Own highlighting groups ==="
let colorgroup['UnderlinedBold']   = {"GUIFG": _marzipan, "GUI": "underline,bold"}

" === GitGutter highlighting groups ==="
let colorgroup['GitGutterAdd']            = {"GUIFG": _green, "GUIBG":  _black}
let colorgroup['GitGutterChange']         = {"GUIFG": _sap, "GUIBG":  _black}
let colorgroup['GitGutterDelete']         = {"GUIFG": _pink, "GUIBG":  _black}
let colorgroup['GitGutterChangeDelete']   = {"GUIFG": _sap, "GUIBG":  _black}

" === Git highlighting groups ==="
let colorgroup['DiffAdd']           = {"GUIFG": _green, "GUIBG":  _black, "GUI":"NONE"}
let colorgroup['DiffChange']        = {"GUIFG": _white, "GUIBG":  _black, "GUI":"NONE"}
let colorgroup['DiffDelete']        = {"GUIFG": _pink, "GUIBG":  _black, "GUI":"NONE"}
let colorgroup['DiffText']          = {"GUIFG": _pink, "GUIBG":  _black, "GUI":"NONE"}
