local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  require("telescope").load_extension('harpoon')

  local wk = require "which-key"
  wk.register {
    ["<leader>hn"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next" },
    ["<leader>hp"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous" },
    ["<leader>hm"] = { "<cmd>lua require('user.harpoon').mark_file()<cr>", "Mark" },
  }

  keymap("n", "<s-m>", "<cmd>lua require('user.harpoon').mark_file()<cr>", opts)
  keymap("n", "<TAB>", "<cmd>Telescope harpoon marks<cr>", opts)
  -- keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
