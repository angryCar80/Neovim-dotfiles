return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
        },
      })

      telescope.load_extension("ui-select")

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set('n', 'K', function()
  vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
end, { desc = "Show diagnostic under cursor" })

    end,
  },
}

