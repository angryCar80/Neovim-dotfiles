return {
  -- Show git signs in the gutter (like +, ~, -)
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "|" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = true,
    },
    keys = {
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Git hunk" },
      { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Git hunk" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Git hunk" },
      { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame current line" },
    },
  },

  -- Git commands in Vim
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread", "Gblame" },
    keys = {
      { "<leader>gg", "<cmd>Git<CR>", desc = "Git Status (Fugitive)" },
    },
  },

  -- Optional: Run Lazygit inside Neovim
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gl", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

