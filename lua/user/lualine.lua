local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      theme = 'nord',
      component_separators = '',
      section_separators = { left = '', right = '' },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 3 }
      },
      lualine_b = { "branch" },
      lualine_c = { "diagnostics" },
      lualine_x = { "copilot", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 3 },
      },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
