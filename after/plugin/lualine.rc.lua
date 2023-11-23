local fn = vim.fn
local status, lualine = pcall(require, "lualine")
if (not status) then return end

local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = ' ' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { "branch",
      icon = "" } },

    lualine_c = {
      { function()
        local dir_name = fn.fnamemodify(fn.getcwd(), ":t")
        return (dir_name) or ""
      end,
        icon = "󰉋 ",
      },
      {
        "filetype",
        colored = true, -- Displays filetype icon in color if set to true
        icon_only = true,
      },
      { "filename",
        path = 0,
        symbols = {
          modified = "●",
          readonly = '-',       -- Text to show when the file is non-modifiable or readonly.
          unnamed = 'No Name',  -- Text to show for unnamed buffers.
          newfile = 'New File', -- Text to show for newly created file before first write
        } }, },

    lualine_x = {

      { 'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      },

      { function()
        local msg = 'No Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
        icon = ' ', }

    },

    lualine_y = {
      { "progress",
        separator = " ",
        padding = { left = 1, right = 0 }
      },
      { "location",
        padding = { left = 0, right = 1 }
      },
    },

    lualine_z = { function()
      return " " .. os.date("%R")
    end, }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}
