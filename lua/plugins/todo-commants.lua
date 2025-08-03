return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",

  config = function()
    require("todo-comments").setup({
      signs = true,
      keywords = {
        FIX = {
          icon = " ", -- bug icon
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      },
    })

    -- 🔑 Keymaps
    local map = vim.keymap.set
    map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO comment" })
    map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous TODO comment" })
    map("n", "<leader>td", "<cmd>TodoTelescope<CR>", { desc = "Search TODOs with Telescope" })
    map("n", "<leader>tq", "<cmd>TodoQuickFix<CR>", { desc = "Populate QuickFix list with TODOs" })
  end,
}

