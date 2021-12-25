local config = require("aylin.config")
local colors = require("aylin.colors").setup(config)
local util = require("aylin.util")

local aylin = {}

aylin.normal = {
  left = {{ colors.black, colors.blue }, { colors.blue, colors.fg_gutter }},
  middle = {{ colors.fg, colors.bg_statusline }},
  right = {{ colors.black, colors.blue }, { colors.blue, colors.fg_gutter }},
  error = {{ colors.black, colors.error }},
  warning = {{ colors.black, colors.warning }},
}

aylin.insert = {
  left = {{ colors.black, colors.green }, { colors.blue, colors.bg }},
}

aylin.visual = {
  left = {{ colors.black, colors.magenta }, { colors.blue, colors.bg }},
}

aylin.replace = {
  left = {{ colors.black, colors.red }, { colors.blue, colors.bg }},
}

aylin.inactive = {
  left = {{ colors.blue, colors.bg_statusline }, {colors.dark3, colors.bg }},
  middle = {{ colors.fg_gutter, colors.bg_statusline }},
  right = {{ colors.fg_gutter, colors.bg_statusline }, {colors.dark3, colors.bg }},
}

aylin.tabline = {
  left = {{ colors.dark3, colors.bg_highlight }, {colors.dark3, colors.bg }},
  middle = {{ colors.fg_gutter, colors.bg_statusline }},
  right = {{ colors.fg_gutter, colors.bg_statusline }, {colors.dark3, colors.bg }},
  tabsel = {{ colors.blue, colors.fg_gutter }, { colors.dark3, colors.bg }},
}

if vim.o.background == "light" then
  for _, mode in pairs(aylin) do
    for _, section in pairs(mode) do
      for _, subsection in pairs(section) do
        subsection[1] = util.getColor(subsection[1])
        subsection[2] = util.getColor(subsection[2])
      end
    end
  end
end

return aylin
