return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local bufferline = require("bufferline")
      
      bufferline.setup({
        options = {
          mode = "buffers",
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            icon = "▎",
            style = "icon",
          },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 18,
          max_prefix_length = 15,
          truncate_names = true,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
          sort_by = "insert_after_current",
        },
        highlights = {
          buffer_selected = {
            bold = true,
            italic = false,
          },
        },
      })

      -- Keymaps for buffer navigation (Helix-style)
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Helix-style buffer switching
      map("n", "gn", "<Cmd>BufferLineCycleNext<CR>", opts)
      map("n", "gp", "<Cmd>BufferLineCyclePrev<CR>", opts)
      
      -- Alternative buffer switching with Tab
      map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
      map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
      
      -- Move buffers
      map("n", "<leader>bl", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
      map("n", "<leader>bh", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
      
      -- Buffer operations
      map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
      map("n", "<leader>bx", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
      map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin buffer" })
      
      -- Go to specific buffer (like Helix's buffer picker)
      map("n", "<leader>bb", "<Cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
      
      -- Go to buffer by number
      for i = 1, 9 do
        map("n", "<leader>" .. i, function()
          vim.cmd("BufferLineGoToBuffer " .. i)
        end, { desc = "Go to buffer " .. i })
      end
    end,
  },
  {
    "famiu/bufdelete.nvim",
    config = function()
      vim.keymap.set("n", "<leader>bc", "<Cmd>Bdelete!<CR>", { desc = "Force close buffer" })
    end,
  },
}