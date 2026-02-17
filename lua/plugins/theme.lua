return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- ensures the colorscheme loads early to prevent flashing
  opts = {
    -- Configuration options go here (optional)
    flavour = "mocha",              -- latte, frappe, macchiato, or mocha (default)
    transparent_background = false, -- disables setting the background color
    integrations = {
      -- automatically detect and enable integrations for other plugins
      auto_integrations = true,
      -- explicitly enable specific integrations as needed, e.g.,
      -- cmp = true,
      -- gitsigns = true,
      -- nvimtree = true,
    },
  },
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
