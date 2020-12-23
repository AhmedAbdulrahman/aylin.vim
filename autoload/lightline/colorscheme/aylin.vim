" Aylin - color scheme for lightline"
" Author: Ahmed Abdulrahman"
" License: MIT"

if !exists("g:lightline")
	finish
endif

let s:gray1 = '#1b202a'
let s:gray2 = '#232834'
let s:gray3 = '#323c4d'
let s:gray4 = '#51617d'
let s:gray5 = '#9aa7bd'
let s:red = '#f95764'
let s:green = '#bae67e'
let s:yellow = '#ffd580'
let s:blue = '#82AAFF'
let s:purple = '#c792ea'
let s:cyan = '#7fdbca'
let s:orange = '#F78C6C'
let s:pink = '#FD98B9'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:gray2, s:pink ], [ s:gray5, s:gray3 ] ]
let s:p.normal.right = [ [ s:gray2, s:pink ], [ s:gray5, s:gray3 ] ]
let s:p.normal.middle = [ [ s:gray4, s:gray2 ] ]
let s:p.normal.error = [ [ s:gray2, s:red ] ]
let s:p.normal.warning = [ [ s:gray2, s:yellow ] ]

let s:p.insert.left = [ [ s:gray2, s:green ], [ s:gray5, s:gray3 ] ]
let s:p.insert.right = [ [ s:gray2, s:green ], [ s:gray5, s:gray3 ] ]

let s:p.replace.left = [ [ s:gray2, s:red ], [ s:gray5, s:gray3 ] ]
let s:p.replace.right = [ [ s:gray2, s:red ], [ s:gray5, s:gray3 ] ]

let s:p.visual.left = [ [ s:gray2, s:orange ], [ s:gray5, s:gray3 ] ]
let s:p.visual.right = [ [ s:gray2, s:orange ], [ s:gray5, s:gray3 ] ]

let s:p.inactive.left =  [ [ s:gray5, s:gray3 ], [ s:gray4, s:gray2 ] ]
let s:p.inactive.right = [ [ s:gray5, s:gray3 ], [ s:gray4, s:gray2 ] ]
let s:p.inactive.middle = [ [ s:gray4, s:gray2 ] ]

let s:p.tabline.left = [ [ s:gray5, s:gray3 ] ]
let s:p.tabline.middle = [ [ s:gray4, s:gray2 ] ]
let s:p.tabline.right = [ [ s:gray2, s:blue ] ]
let s:p.tabline.tabsel = [ [ s:gray2, s:blue ] ]

let g:lightline#colorscheme#aylin#palette = lightline#colorscheme#fill(s:p)
