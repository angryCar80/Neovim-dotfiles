return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    version = "main",
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      indent = { enabled = true },
      scroll = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true } -- Wrap notifications
        }
      },
    },

  },
}
