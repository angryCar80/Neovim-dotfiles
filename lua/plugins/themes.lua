return {
  -- Top 6 most popular Omarchy themes
  
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = { light = "latte", dark = "mocha" },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      integrations = {
        cmp = true, gitsigns = true, nvimtree = true, treesitter = true, notify = false, mini = false,
      },
    }
  },
  
  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    opts = {
      style = "night", transparent = false, terminal_colors = true,
      styles = {
        comments = { italic = true }, keywords = { italic = true }, functions = {}, variables = {},
        sidebars = "dark", floats = "dark",
      },
      day_brightness = 0.3, dim_inactive = false, lualine_bold = false,
    }
  },
  
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    opts = {
      terminal_colors = true, undercurl = true, underline = false, bold = true,
      italic = { strings = true, emphasis = true, comments = true, operators = false, folds = true },
      strikethrough = true, invert_selection = false, invert_signs = false,
      invert_tabline = false, invert_intend_guides = false, inverse = true,
      contrast = "hard", palette_overrides = {}, dim_inactive = false, transparent_mode = false,
    }
  },
  
  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "main", dark_variant = "main", dim_inactive_windows = false,
      extend_background_behind_borders = true,
      enable = { terminal = true, migrations = true },
      styles = { bold = true, italic = true, transparency = false },
    }
  },
  
  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = false,
      dimInactive = true,
      terminalColors = true,
      theme = "wave",
      background = { dark = "wave" },
    }
  },
  
  -- Nord
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    priority = 1000,
  },
  
  -- VSCode Dark+
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 1000,
    opts = {
      transparent = false,
      italic_comments = true,
      color_overrides = {
        vscNone = "NONE",
      },
      group_overrides = {
        Cursor = { fg="#ffffff", bg="#333333" },
      }
    }
  },
}