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
:let _lightblack  = '#313e52'
:let _semiblack   = '#262f3e'
:let _black       = '#1f2430'

:let _aubergine   = '#FD98B9'
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

" Not all terminals support italics properly. If yours does, opt-in."
if !exists("g:aylin_terminal_italics")
  let g:aylin_terminal_italics = 0
endif

" === Functions ==="
" Returns a darkened color using given color and the percent to darken it by."
" Example: color_helper#hex_color_darken('#FFFFFF', 0.10)"
" Returns: '#E5E5E5'"

function! s:hex_color_darken(color, percent)
  let l:rgb = s:hex_color_to_rgb(a:color)
  let l:rgb_darkened = []

  for i in l:rgb
    call add(l:rgb_darkened, float2nr(i * (1 - a:percent)))
  endfor

  return s:rgb_color_to_hex(l:rgb_darkened)
endfunction


function! s:hex_color_to_rgb(hex_color)
  let l:rgb = []

  let l:red   = s:hex_to_dec(strpart(a:hex_color, 1, 2))
  let l:green = s:hex_to_dec(strpart(a:hex_color, 3, 2))
  let l:blue  = s:hex_to_dec(strpart(a:hex_color, 5, 2))
  let l:rgb = [l:red, l:green, l:blue]

  return l:rgb
endfunction

function! s:hex_to_dec(arg)
  return (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
endfunction

function! s:dec_to_hex(arg, padding)
  return toupper(printf('%0' . a:padding . 'x', a:arg + 0))
endfunction

function! s:rgb_color_to_hex(rgb_color)
  let l:hex_color  = '#'
  let l:hex_color .= s:dec_to_hex(a:rgb_color[0], 2) " red"
  let l:hex_color .= s:dec_to_hex(a:rgb_color[1], 2) " green"
  let l:hex_color .= s:dec_to_hex(a:rgb_color[2], 2) " blue"

  return l:hex_color
endfunction

let colorgroup = {}

" === Highlights ==="
let colorgroup['Normal']       = {"GUIFG": _l_white,     "GUIBG":  _black}
let colorgroup['NormalNC']     = {"GUIFG": _l_white,     "GUIBG":  _black}
let colorgroup['NormalSB']     = {"GUIFG": _d_white,     "GUIBG":  _semiblack}
let colorgroup['NormalFloat']  = {"GUIFG": _l_white,     "GUIBG":  _black}
let colorgroup['FloatBorder']  = {"GUIFG": _lightblack}
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

"Popup menu: normal item"
let colorgroup['Pmenu']        = {"GUIFG": _l_white,     "GUIBG":  _semiblack}
"Popup menu: selected item"
let colorgroup['PmenuSel']     = {"GUIBG":  _gray_dark}
"Popup menu: scrollbar"
let colorgroup['PmenuSbar']    = {"GUIBG":  _black}
"Thumb of the scrollbar."
let colorgroup['PmenuThumb']    = {"GUIBG":  _black}

let colorgroup['Search']       = {"GUIBG":  _gray_dark, "GUI": "underline"}
let colorgroup['SignColumn']   = {"GUIBG":  _black}
let colorgroup['StatusLine']   = {"GUIFG": _gray,      "GUIBG":  _semiblack}
let colorgroup['StatusLineNC'] = {"GUIFG": _gray_dark, "GUIBG":  _semiblack}
let colorgroup['Tabline']      = {"GUIFG": _gray,      "GUIBG":  _semiblack}
let colorgroup['TablineFill']  = {"GUIBG":  _black}
let colorgroup['TabLineSel']   = {"GUIFG": _l_sky, "GUIBG":  _black, "CTERM": "reverse", "GUI": "reverse"}
let colorgroup['Title']        = {"GUIFG": _marzipan, "GUI": "bold"}
let colorgroup['Todo']         = {"GUIFG": _black, "GUIBG":  _sky, "GUI": "italic"}
let colorgroup['VertSplit']    = {"GUIFG": _lightblack}
let colorgroup['Visual']       = {"GUIBG": _lightblack}
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
let colorgroup['MarkdownH1']     = {"GUIFG": _sky, "GUI": "bold"}
let colorgroup['MarkdownH2']     = {"GUIFG": _l_sky, "GUI": "bold"}
let colorgroup['MarkdownLinkText']     = {"GUIFG": _l_sky, "GUI": "underline"}

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

" === NvimTree highlighting groups ==="
let colorgroup['NvimTreeNormal']              = {"GUIFG": _d_white, "GUIBG":  _black }
let colorgroup['NvimTreeNormalNC']            = {"GUIFG": _d_white, "GUIBG":  _black }
let colorgroup['NvimTreeRootFolder']          = {"GUIFG": _gray_light, "GUIBG":  _black, "GUI":"bold"}
let colorgroup['NvimTreeFolderName']          = {"GUIFG": _gray_light, "GUIBG":  _black }
let colorgroup['NvimTreeOpenedFolderName']    = {"GUIFG": _d_white, "GUIBG":  _black }
let colorgroup['NvimTreeGitDirty']            = {"GUIFG": _marzipan, "GUIBG":  _black }
let colorgroup['NvimTreeGitNew']              = {"GUIFG": _green, "GUIBG":  _black }
let colorgroup['NvimTreeGitDeleted']          = {"GUIFG": _pink, "GUIBG":  _black }
let colorgroup['NvimTreeSpecialFile']         = {"GUIFG": _d_turquoise, "GUIBG":  _black, "GUI":"underline"}
let colorgroup['NvimTreeIndentMarker']        = {"GUIFG": _lightblack, "GUIBG":  _black}
let colorgroup['NvimTreeImageFile']           = {"GUIFG": _d_white, "GUIBG":  _black }
let colorgroup['NvimTreeSymlink']             = {"GUIFG": _d_white, "GUIBG":  _black }
let colorgroup['NvimTreeGitStaged']           = {"GUIFG": _d_white, "GUIBG":  _black }
let colorgroup['NvimTreeGitMerge']            = {"GUIFG": _d_white, "GUIBG":  _black }
let colorgroup['NvimTreeGitRenamed']          = {"GUIFG": _d_white, "GUIBG":  _black }

" === COMPLETION highlighting groups ==="
let colorgroup['CmpDocumentation']           = {"GUIFG": _d_white, "GUIBG":  _sap, "GUI":"NONE" }
let colorgroup['CmpDocumentationBorder']     = {"GUIFG": _d_white, "GUIBG":  _sap, "GUI":"NONE" }
"uncompleted item that may be good for completion"
let colorgroup['CmpItemAbbr']                = {"GUIFG": _d_white, "GUIBG":  _lightblack, "GUI":"NONE" }
let colorgroup['CmpItemAbbrDeprecated']      = {"GUIFG": _d_white, "GUIBG":  _sap, "GUI":"NONE" }
"matched item (what you typed until present)"
let colorgroup['CmpItemAbbrMatch']           = {"GUIFG": _aubergine, "GUIBG":  _lightblack, "GUI":"NONE" }
"fuzzy match for what you typed"
let colorgroup['CmpItemAbbrMatchFuzzy']      = {"GUIFG": _d_turquoise, "GUIBG":  _lightblack, "GUI":"NONE" }
let colorgroup['CmpItemKind']                = {"GUIFG": _aubergine, "GUIBG":  _sap, "GUI":"NONE" }
let colorgroup['CmpItemMenu']                = {"GUIFG": _l_sky, "GUIBG":  _lightblack, "GUI":"NONE" }

let colorgroup['LspDiagnosticsDefaultError'] = {"GUIFG": _pink, "GUIBG":  _black }
let colorgroup['LspDiagnosticsDefaultWarning'] = {"GUIFG": _marzipan, "GUIBG":  _black }
let colorgroup['LspDiagnosticsDefaultHint'] = {"GUIFG": _l_sky, "GUIBG":  _black }

let colorgroup['LspFloatWinNormal']          = {"GUIFG": _d_white, "GUIBG":  _aubergine }
let colorgroup['LspFloatWinBorder']          = {"GUIFG": _sap, "GUIBG":  _sap }
let colorgroup['LspFloatWinBorder']          = {"GUIFG": _sap, "GUIBG":  _sap }
let colorgroup['LspFloatWinBorder']          = {"GUIFG": _sap, "GUIBG":  _sap }

 let colorgroup['BufferLineIndicatorSelected']   = {"GUIFG": _l_sky}
 let colorgroup['BufferLineFill']                = {"GUIBG":  _pink}

"used for highlighting the current line in terminal-debug"
let colorgroup['debugPC']                    = {"GUIBG":  _black}
"used for breakpoint colors in terminal-debug"
let colorgroup['debugBreakpoint']            = {"GUIBG":  _semiblack}

"These groups are for the native LSP client. Some other LSP clients may"
"use these groups, or use their own. Consult your LSP client's"
"documentation."

"used for highlighting 'text' references"
let colorgroup['LspReferenceText']          = {"GUIBG":  _gray_light }
"used for highlighting 'read' references"
let colorgroup['LspReferenceRead']          = {"GUIBG":  _gray_light }
"used for highlighting 'write' references"
let colorgroup['LspReferenceWrite']         = {"GUIBG":  _gray_light }

let colorgroup['DiagnosticError']        = {"GUIFG":  _pink }
let colorgroup['DiagnosticWarn']         = {"GUIFG":  _marzipan }
let colorgroup['DiagnosticInfo']         = {"GUIFG":  _sky }
let colorgroup['DiagnosticHint']         = {"GUIFG":  _d_turquoise }

let colorgroup['DiagnosticVirtualTextError']        = {"GUIFG": _pink, "GUIBG":  s:hex_color_darken(_pink, 0.80) }
let colorgroup['DiagnosticVirtualTextWarn']         = {"GUIFG": _marzipan,"GUIBG":  s:hex_color_darken(_marzipan, 0.80) }
let colorgroup['DiagnosticVirtualTextInfo']         = {"GUIFG": _sky,"GUIBG":  s:hex_color_darken(_sky, 0.80) }
let colorgroup['DiagnosticVirtualTextHint']         = {"GUIFG": _d_turquoise,"GUIBG":  s:hex_color_darken(_d_turquoise, 0.80) }

let colorgroup['DiagnosticUnderlineError']        = {"style":  "undercurl", "sp": _pink }
let colorgroup['DiagnosticUnderlineWarn']         = {"style":  "undercurl", "sp": _marzipan }
let colorgroup['DiagnosticUnderlineInfo']         = {"style":  "undercurl", "sp": _sky }
let colorgroup['DiagnosticUnderlineHint']         = {"style":  "undercurl", "sp": _d_turquoise }

" === Highlighting Links ==="
hi link Boolean               Number
hi link Class                 Constant
hi link ErrorMsg              Error
hi link Delimiter             Define
hi link Debug                 Special
hi link Conditional           Define
hi link Exception             PreProc
hi link Float                 Number
hi link Include               PreProc
hi link Macro                 PreProc
hi link Number                Identifier
hi link Operator              Identifier
hi link PreCondit             PreProc
hi link Repeat                Statement
hi link SpecialChar           Special
hi link SpecialComment        Special
hi link SpecialKey            Define
hi link StorageClass          Identifier
hi link Symbol                PreProc
hi link Tag                   Normal
hi link Typedef               Type

" === Highlighting Plugins ==="

" CtrlP "
hi link CtrlPMatch             Character

" Git commit "
hi link gitcommitBranch        Constant
hi link gitcommitSelectedFile  Statement
hi link gitcommitDiscardedFile Structure
hi link gitcommitUntrackedFile Structure
hi link gitcommitSummary       String

" Fugitive "
hi link DiffAdd DiffAdd
hi link DiffChange DiffChange
hi link DiffDelete DiffDelete
hi link DiffText DiffText

" GitGutter "
hi link GitGutterAdd          GitGutterAdd
hi link GitGutterChange       GitGutterChange
hi link GitGutterDelete       GitGutterDelete
hi link GitGutterChangeDelete GitGutterChangeDelete

" Signify "
hi link SignifySignAdd GitGutterAdd
hi link SignifySignChange GitGutterChange
hi link SignifySignChangeDelete GitGutterChangeDelete
hi link SignifySignDelete GitGutterDelete
hi link SignifySignDeleteFirstLine SignifySignDelete

" NERDtree "
hi link NerdTreeCWD           Character
hi link NerdTreeHelpKey       Character
hi link NerdTreeHelpTitle     Statement
hi link NerdTreeOpenable      NerdTreeCWD
hi link NerdTreeClosable      Statement
hi link NerdTreeDir           Normal
hi link NerdTreeDirSlash      NerdTreeDir

" PlainTasks (.todo) "
hi link ptCompleteTask        Number
hi link ptContext             Type
hi link ptSection             Title
hi link ptTask                Normal

" VimPlug "
hi link plugName              Character

" Startify "
hi link StartifyNumber        Character
hi link StartifyBracket       StartifyNumber
hi link StartifySection       Title
hi link StartifyPath          Define
hi link StartifySlash         StartifyPath
hi link StartifyFile          Normal

" === Highlighting Languages/Tools ==="

" highlight clear ALEErrorSign "
if exists('g:ale_enabled')
  hi! link ALEError WarningMsg
  hi! link ALEWarning WarningMsg
  hi! link ALEInfo WarningMsg

  hi! link ALEErrorSign WarningMsg
  hi! link ALEWarningSign WarningMsg
  hi! link ALEInfoSign WarningMsg
  hi! link ALEVirtualTextWarning WarningMsg
  hi! link ALEVirtualTextError WarningMsg
endif

" Apache "
hi link apacheDeclaration     PreProc

" CoffeeScript "
hi link coffeeExtendedOp      Character
hi link coffeeObject          Statement
hi link coffeeObjAssign       Character
hi link coffeeParen           Character

" CSS "
hi link cssAttr               Identifier
hi link cssColor              Normal
hi link cssClassName          String
hi link cssProp               Function
hi link cssPseudoClass        Character
hi link cssPseudoClassId      Character
hi link cssSelectorOp         Character
hi link cssTagName           Identifier
hi link cssDefinition           Identifier
hi link cssNoise           Punctuation
hi link cssBraces           Punctuation
hi link cssIdentifier           Punctuation
hi link cssIncludeKeyword           Punctuation
hi link cssUnitDecorators           String

" GraphQL "
hi link graphqlName           Function
hi link graphqlString         Comment

" HAML "
hi link hamlTag               Character

" HTML "
"hi link javaScript            Normal"
hi link htmlTag               Label
hi link htmlEndTag            Label
hi link htmlTagName           Label
hi link htmlScriptTag           Label
hi link htmlArg               Attr
hi link htmlTitle             Normal
hi link htmlH1                Normal
hi link htmlH2                htmlH1
hi link htmlH3                htmlH1
hi link htmlH4                htmlH1
hi link htmlH5                htmlH1
hi link htmlH6                htmlH1

" JavaScript "
hi link javascriptFuncArg     Character
hi link javascriptFuncComma   Punctuation
hi link javascriptFuncDef     Statement
hi link javascriptFuncKeyword Statement
hi link javascriptOpSymbols   Type
hi link javascriptParens      Punctuation
hi link javascriptEndcolons   Character
hi link jsArrowFuncArgs       Normal
hi link jsArrowFunction       Identifier
hi link jsBraces              Punctuation
hi link jsBrackets            Punctuation
hi link jsClassBraces         Punctuation
hi link jsClassDefinition     Class
hi link jsClassFuncName       Function
hi link jsClassKeyword        Identifier
hi link jsClassProperty       Normal
hi link jsClassBlock          Identifier
hi link jsDecorator           Normal
hi link jsDestructuringBraces Punctuation
hi link jsExtendsKeyword      jsClassKeyword
hi link jsExport              Identifier
hi link jsImport              Identifier
hi link jsFrom                Identifier
hi link jsFuncBraces          Punctuation
hi link jsFunction            Identifier
hi link jsFuncCall            Function
hi link jsFuncParens          Punctuation
hi link jsFunctionKey         Function
hi link jsGlobalObjects       Identifier
hi link jsGlobalNodeObjects   Identifier
hi link jsIfElseBraces        Punctuation
hi link jsModuleBraces        Normal
hi link jsModuleKeyword       Tag
hi link jsNoise               Delimiter
hi link jsObjectBraces        Punctuation
hi link jsObjectKey           Normal
hi link jsObjectValue         PreProc
hi link jsObjectProp          Function
hi link jsObjectColon         Punctuation
hi link jsObjectShorthandProp Punctuation
hi link jsParens              Punctuation
hi link jsReturn              Identifier
hi link jsSpreadOperator      Identifier
hi link jsThis                Identifier

" JSON "
hi link jsonKeyword           Attr
hi link jsonKeywordMatch      Punctuation
hi link jsonQuote             Attr
hi link jsonNoise             Punctuation
hi link jsonString            Punctuation
hi link jsonBraces            Normal
hi link jsonBoolean           WarningMsg

hi link jsonNumError Comment
hi link jsonCommentError Comment
hi link jsonSemicolonError Comment
hi link jsonTrailingCommaError Comment
hi link jsonMissingCommaError Comment
hi link jsonStringSQError Comment
hi link jsonNoQuotesError Punctuation
hi link jsonTripleQuotesError Punctuation

" hi link texSpecialChar        Special "
" Markdown "
hi link markdownHeadingDelimiter        Identifier
hi link markdownCode                    Identifier
hi link markdownIndentCode              Identifier
hi link markdownLineBreak               Statement
hi link markdownH1 MarkdownH1
hi link markdownH2 MarkdownH2
hi link markdownLinkText markdownLinkText

" MatchTagAlways "
hi link MatchTag              Identifier

" PHP "
hi link phpRegion             Comment
hi link phpConstant WarningMsg
hi link phpCoreConstant WarningMsg
hi link phpComment Comment
hi link phpDocTags WarningMsg
hi link phpDocCustomTags WarningMsg
hi link phpException WarningMsg
hi link phpBoolean WarningMsg
hi link phpClass String
hi link phpStaticClasses String
hi link phpClassDelimiter WarningMsg
hi link phpFunction Label "Custom functions"
hi link phpFunctions Character "Built-in functions"
hi link phpSuperglobals Normal "Global functions"
hi link phpMagicConstants Normal "__CLASS__"
hi link phpServerVars WarningMsg
hi link phpMethods WarningMsg
hi link phpMethodsVar Label
hi link phpSplatOperator Label
hi link phpStringDelimiter String "String Quotes"
hi link phpStructure Label
hi link phpStringSingle String
hi link phpStringDouble Identifier
hi link phpBacktick Identifier
hi link phpNumber Identifier
hi link phpFloat WarningMsg
hi link phpBaselib Identifier
hi link phpRepeat WarningMsg
hi link phpStatement Identifier
hi link phpKeyword Identifier "function"
hi link phpSCKeyword Identifier
hi link phpFCKeyword Identifier
hi link phpYieldFromKeyword Identifier
hi link phpDocNamespaceSeparator WarningMsg
hi link phpClassNamespaceSeparator WarningMsg
hi link phpUseNamespaceSeparator WarningMsg
hi link phpType Identifier "public, privat, protected"
hi link phpInclude Identifier
hi link phpDefine WarningMsg
hi link phpBackslashSequences WarningMsg
hi link phpBackslashDoubleQuote WarningMsg
hi link phpBackslashSingleQuote WarningMsg
hi link phpParent Punctuation
hi link phpBrackets Punctuation
hi link phpIdentifierConst WarningMsg
hi link phpParentError WarningMsg
hi link phpOctalError WarningMsg
hi link phpInterpSimpleError WarningMsg
hi link phpInterpBogusDollarCurley WarningMsg
hi link phpInterpDollarCurly1 WarningMsg
hi link phpInterpDollarCurly2 WarningMsg
hi link phpInterpSimpleBracketsInner WarningMsg
hi link phpInterpSimpleCurly WarningMsg
hi link phpInterpVarname WarningMsg
hi link phpIntVar Punctuation
hi link phpVarSelector PreProc "$ sign"
hi link phpMemberSelector Identifier "->"
hi link phpIdentifier PreProc
hi link phpTodo Identifier
hi link phpDocTodo Identifier
hi link phpOperator Identifier "+, -, x, *"
hi link phpRelation WarningMsg
hi link phpIdentifierSimply WarningMsg

"Pug"
hi link pugHtmlConditionalComment                WarningMsg

" Python "
hi link pythonMagic            Identifier
hi link pythonBuiltin            Identifier
hi link pythonStatement            Identifier
hi link pythonOperator            Punctuation
hi link pythonFunction            Character
hi link pythonString            Label
hi link pythonImport            Identifier
hi link pythonDef            Punctuation
hi link pythonAs            Punctuation
hi link pythonDocstring            Punctuation
hi link pythonSpecial            Punctuation
hi link pythonDecorator            Punctuation
hi link pythonExceptions            Punctuation

" Ruby "
hi link rubyAccess            Access
hi link rubyBlockParameterList PreProc
hi link rubyCallback          Character
hi link rubyClass             Label
hi link rubyClassName         UnderlinedBold
hi link rubyControl           Statement
hi link rubyConstant          Constant
hi link rubyEntity            Character
hi link rubyInclude           Include
hi link rubyInterpolation     Identifier
hi link rubyMacro             Character
hi link rubyModule            Module
hi link rubyStringDelimiter   rubyString
hi link rubySymbol            Symbol
hi link rubyRoute             Type

" SASS "
hi link sassClassChar         Type
hi link sassClass             Type
hi link sassIdChar            Type
hi link sassId                Type
hi link sassProperty          Type
hi link scssProperty          Identifier
hi link scssMixin          Identifier
hi link scssVariable         Attr
hi link scssInclude         Identifier
hi link scssExtend         Identifier
hi link scssFunctionDefinition         Identifier
hi link scssReturn         Identifier
hi link scssEachKeyword         Identifier
hi link scssForKeyword         Identifier
hi link scssImport         Identifier
hi link scssSemicolon         Punctuation
hi link scssAtRoot         Identifier
hi link scssSelectorName         String

" Slim "
hi link slimBegin             Normal
hi link slimClass             Character
hi link slimClassChar         Character
hi link slimId                Character
hi link slimIdChar            Character
hi link rubyKeyword           PreProc
hi link slimText              Normal

" TypeScript "
hi link typescriptBOM                 Normal
hi link typescriptBraces               Punctuation
hi link typescriptParens               Punctuation
hi link typescriptTypeReference        String
hi link typescriptAsyncFuncKeyword     Identifier
hi link typescriptAsyncFunc            Identifier
hi link typescriptArrowFunc            Identifier
hi link typescriptFuncKeyword          Identifier
hi link typescriptArrowFuncArg         Identifier
hi link typescriptFuncName             Function
hi link typescriptFuncArg              Identifier
hi link typescriptFuncComma            Identifier
hi link typescriptFuncTypeArrow         String
hi link typescriptTemplate             Attr
hi link typescriptTemplateSB           Attr
hi link typescriptObjectLabel          Normal
hi link typescriptDestructureLabel     Attr
hi link typescriptObjectAsyncKeyword     Attr
hi link typescriptInterfaceKeyword     Identifier
hi link typescriptInterfaceExtends     Identifier
hi link typescriptInterfaceName        String
hi link typescriptImport               Identifier
hi link typescriptImportType           Normal
hi link typescriptExport               Identifier
hi link typescriptExportType           Normal
"Types=> key:value"
hi link typescriptMember               Normal
hi link typescriptPredefinedType        Attr
hi link typescriptStringMember         Normal
hi link typescriptString               String
hi link typescriptConditional          Identifier
hi link typescriptConditionalElse      Identifier
"default"
hi link typescriptCase                 Identifier
hi link typescriptDefault              Identifier
hi link typescriptMethodAccessor       String
hi link typescriptKeywordOp            String
"return"
hi link typescriptStatementKeyword     Identifier
hi link typescriptNull                 Attr
hi link typescriptBoolean              Attr
hi link typescriptConstructorType       Attr
hi link typescriptTypeQuery             Attr
hi link typescriptAccessibilityModifier Attr
hi link typescriptOptionalMark          Attr
hi link typescriptReadonlyModifier      Attr
hi link typescriptTypeParameter         Attr

" VimL "
hi link vimCmdSep             Character

" YAML "
hi link yamlBlockMappingKey   Punctuation
hi link yamlDocumentStart     Punctuation
hi link yamlKeyValueDelimiter Punctuation
hi link yamlPlainScalar       Punctuation

" XML "
" hi link xmlAttrib             Normal"
hi link xmlTag                Xml
hi link xmlTagName            Identifier
hi link xmlEndTag             Tag
hi link xmlAttrib             Attr

" === Expand colorgroups === "

let s:colors = {}
" http://choorucode.com/2011/07/29/vim-chart-of-color-names/"

let valid_cterm_colors =
      \ [
      \     'Black', 'DarkBlue', 'DarkGreen', 'DarkCyan',
      \     'DarkRed', 'DarkMagenta', 'Brown', 'DarkYellow',
      \     'LightGray', 'LightGrey', 'Gray', 'Grey',
      \     'DarkGray', 'DarkGrey', 'Blue', 'LightBlue',
      \     'Green', 'LightGreen', 'Cyan', 'LightCyan',
      \     'Red', 'LightRed', 'Magenta', 'LightMagenta',
      \     'Yellow', 'LightYellow', 'White',
      \ ]
for key in keys(colorgroup)
  let s:colors = colorgroup[key]
  if has_key(s:colors, 'TERM')
    let term = s:colors['TERM']
  else
    let term = 'NONE'
  endif
  if has_key(s:colors, 'GUI')
    let gui = s:colors['GUI']
  else
    let gui='NONE'
  endif
  if has_key(s:colors, 'GUIFG')
    let guifg = s:colors['GUIFG']
  else
    let guifg='NONE'
  endif
  if has_key(s:colors, 'GUIBG')
    let guibg = s:colors['GUIBG']
  else
    let guibg='NONE'
  endif
  if g:aylin_terminal_italics == 0
  	if has_key(s:colors, 'CTERM') && s:colors["CTERM"] == "italic"
	  unlet a:colors.CTERM
	endif
    if has_key(s:colors, "GUI") && s:colors["GUI"] == "italic"
      unlet s:colors.GUI
    endif
  endif
  if has_key(s:colors, 'CTERM')
    let cterm = s:colors['CTERM']
  else
    let cterm=gui
  endif
  if has_key(s:colors, 'CTERMFG')
    let ctermfg = s:colors['CTERMFG']
  else
    if index(valid_cterm_colors, guifg) != -1
      let ctermfg=guifg
    else
      let ctermfg='Blue'
    endif
  endif
  if has_key(s:colors, 'CTERMBG')
    let ctermbg = s:colors['CTERMBG']
  else
    if index(valid_cterm_colors, guibg) != -1
      let ctermbg=guibg
    else
      let ctermbg='NONE'
    endif
  endif
  if has_key(s:colors, 'GUISP')
    let guisp = s:colors['GUISP']
  else
    let guisp='NONE'
  endif
  if key =~ '^\k*$'
    execute "hi ".key." term=".term." cterm=".cterm." gui=".gui." ctermfg=".ctermfg." guifg=".guifg." ctermbg=".ctermbg." guibg=".guibg." guisp=".guisp
  endif
endfor


" Must appear at the end of the file to work around this oddity:
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
