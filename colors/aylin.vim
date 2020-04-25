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
