return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      disable_background = true,  -- Enables transparency
      dark_variant = "main",      -- Optional: choose your preferred variant
      bold_vert_split = false,
      dim_nc_background = true,
      disable_float_background = true,
      highlight_groups = {
        CursorLine = { bg = "none" },
        CursorColumn = { bg = "none" },
      },
    })

    vim.cmd("colorscheme rose-pine")

    -- Force transparent background for key UI elements
    local groups = { "Normal", "NormalFloat", "SignColumn", "LineNr", "EndOfBuffer" }
    for _, hl in ipairs(groups) do
      vim.api.nvim_set_hl(0, hl, { bg = "none" })
    end
  end,
}

