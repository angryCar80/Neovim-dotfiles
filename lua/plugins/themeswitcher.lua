return {
  -- 🌌 NvChad + Popular Dark Themes
  { "catppuccin/nvim", name = "catppuccin" },
  { "EdenEast/nightfox.nvim" },
  { "folke/tokyonight.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "shaunsingh/nord.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "navarasu/onedark.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "sainnhe/gruvbox-material" },
  { "lunarvim/darkplus.nvim" },
  { "tiagovla/tokyodark.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "rmehri01/onenord.nvim" },
  { "loctvl842/monokai-pro.nvim" },
  { "marko-cerovac/material.nvim" },
  { "zootedb0t/citruszest.nvim" },

  -- 🧠 Dressing UI for Theme Selection
  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  -- 🎮 Keymap for Theme Switching
  {
    "LazyVim/LazyVim",
    config = function()
      local themes = {
        "catppuccin", "nightfox", "tokyonight", "gruvbox",
        "oxocarbon", "nord", "kanagawa", "vscode",
        "rose-pine", "onedark", "github_dark",
        "gruvbox-material", "darkplus", "tokyodark",
        "onedarkpro", "onenord", "monokai-pro", "material", "citruszest"
      }

      local theme_file = vim.fn.stdpath("config") .. "/lua/theme.txt"

      -- Load saved theme on startup
      local function load_theme()
        local f = io.open(theme_file, "r")
        if f then
          local theme = f:read("*l")
          f:close()
          if theme and theme ~= "" then
            pcall(vim.cmd.colorscheme, theme)
          end
        end
      end

      -- Save selected theme
      local function save_theme(theme)
        local f = io.open(theme_file, "w")
        if f then
          f:write(theme)
          f:close()
        end
      end

      load_theme()

      vim.keymap.set("n", "<leader>th", function()
        vim.ui.select(themes, {
          prompt = "🎨 Select a Theme",
        }, function(choice)
          if choice then
            vim.cmd.colorscheme(choice)
            save_theme(choice)
            vim.notify("Theme changed to " .. choice, vim.log.levels.INFO, { title = "Theme" })
          end
        end)
      end, { desc = "Switch Colorscheme" })
    end,
  },
}

