" clear cache so this reloads changes."
" useful for development"
" lua package.loaded['aylin'] = nil"
" lua package.loaded['aylin.theme'] = nil"
" lua package.loaded['aylin.colors'] = nil"
" lua package.loaded['aylin.util'] = nil"
"lua package.loaded['aylin.config'] = nil"

lua require('aylin').colorscheme()
