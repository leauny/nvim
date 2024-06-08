local M = {
  { -- fast scrolling
    "rhysd/accelerated-jk",
    config = function()
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
    end,
  },
  { -- save session
    "folke/persistence.nvim",
    config = function()
      require("persistence").setup()
      -- vim.keymap.set("n","<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
      -- vim.keymap.set("n","<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]])
      -- vim.keymap.set("n","<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
    end
  },
  { -- bracket completion
    "windwp/nvim-autopairs",
    opts = {
      enable_check_bracket_line = false,
    },
  },
  { -- remember cursor position
    "ethanholz/nvim-lastplace",
    config = true,
  },
  { -- jump / search
    "folke/flash.nvim",
    config = function()
      require("flash").setup()
      vim.keymap.set({"n","x","o"},"s",
          function()
            require("flash").jump({
              search = {
                mode = function(str)
                  return "\\<" .. str
                end,
              },
            })
          end
      )
      vim.keymap.set({"n","x","o"},"S",
          function()
            require("flash").treesitter()
          end
      )
      vim.keymap.set({"o"},"r",
          function()
            require("flash").remote()
          end
      )
      vim.keymap.set({"o","x"},"R",
          function()
            require("flash").treesitter_search()
          end
      )
    end,
  },
  { -- spell check
    "kamykn/spelunker.vim",
    config = function()
      vim.g.spelunker_check_type = 2
    end
  },
  { -- markdown preview
    "ellisonleao/glow.nvim",
    config = true,
  },
  { -- file tree
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup()
      local wk = require "which-key"
      wk.register {
        ["<leader>e"] = { "<cmd>Neotree toggle<CR>", "Explorer" },
      }
      -- vim.keymap.set({"n", "v"},"<leader>e",[[<cmd>Neotree<CR>]])
    end
  },
  { -- text object enhancement
    'echasnovski/mini.ai',
    config = true,
  },
  { -- pick window
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = true,
          bo = {
            filetype = { "fidget", "neo-tree" }
          }
        }
      })
      local wk = require "which-key"
      local pick_func = function()
        local window_number = require('window-picker').pick_window()
        if window_number then vim.api.nvim_set_current_win(window_number) end
      end
      wk.register {
        ["<leader>p"] = { pick_func, "Pick Window" },
      }
      --vim.keymap.set("n",
      --    "<leader>p",
      --    function()
      --      local window_number = require('window-picker').pick_window()
      --      if window_number then vim.api.nvim_set_current_win(window_number) end
      --    end
      --)
    end
  },
}

return M
