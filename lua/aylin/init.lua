local util = require("aylin.util")
local theme = require("aylin.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
