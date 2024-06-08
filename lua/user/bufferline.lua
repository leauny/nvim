local M = {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons'
}

local highlights = require("nord").bufferline.highlights({
  italic = true,
  bold = true,
  fill = "#181c24",
})

function M.config()
  require("bufferline").setup({
    options = {
      separator_style = "thin",
    },
    highlights = highlights,  
  })
end

return M