local devicons = require "nvim-web-devicons"
local helpers = require "incline.helpers"
require("incline").setup {
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    if filename == "" then
      filename = "[No Name]"
    end
    local ft_icon, ft_color = devicons.get_icon_color(filename)

    return {
      { (ft_icon or ""), " ", guifg = "#db302d" },
      { " " },
      { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold", guifg = "#db302d" },
    }
  end,
}
