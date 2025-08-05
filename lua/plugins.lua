return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Tmux navigation keymaps
      map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
      map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
      map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
      map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
    end,
  },
}

