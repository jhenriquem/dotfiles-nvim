-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local M = {}

---@type ChadrcConfig

M.base46 = {
  theme = "nord",
  transparency = true,
}

M.ui = {
  colorify = {
    enabled = true,
    mode = "bg", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },

  statusline = {
    theme = "minimal",
  },
  telescope = {
    style = "bordered",
  },
  tabufline = {
    enabled = false,
  },
  cmp = {
    lspkind_text = true,
    style = "default",
    format_colors = {
      tailwind = true,
    },
  },
  nvdash = {
    load_on_startup = true,
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
