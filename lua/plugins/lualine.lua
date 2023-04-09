-- Change lualine plugin configuration to my taste
-- see https://github.com/nvim-lualine/lualine.nvim

local window_width_limit = 100

local conditions = {
  hide_in_width = function()
    return vim.o.columns > window_width_limit
  end,
}

-- See https://github.com/nvim-lualine/lualine.nvim#general-component-options
local components = {
  encoding = {
    "encoding",
    -- fmt = string.upper,
    cond = conditions.hide_in_width,
    padding = 0,
  },
  fileformat = { "fileformat", icons_enabled = false },
  filetype = { "filetype", cond = nil, padding = 0 },
  location = { "location", cond = nil, padding = 0 },
  progress = { "progress", cond = nil, padding = 0 },
  spaces = {
    function()
      local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
      return " " .. shiftwidth
    end,
    padding = 1 ,
  },
  time = {
    function()
      return " " .. os.date("%R")
    end,
    padding = { left = 1, right = 0 }
  }
}

return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    opts = {
      options = {
        component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_y = {
          components.filetype,
          components.fileformat,
          components.encoding,
          components.spaces,
        },
        lualine_z = {
          components.progress,
          components.location,
          components.time,
        },
      },
    },
  },
}
