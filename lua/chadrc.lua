-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "solarized_osaka",
  transparency = true,

  statusline = {
    theme = "minimal",
  },
  telescope = {
    style = "bordered",
  },
  tabufline = {
    enabled = false,
  },
  nvdash = {
    load_on_startup = false,
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
