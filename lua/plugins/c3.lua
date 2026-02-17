return {
  -- Tree-sitter for C3 syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c3" },
        highlight = { enable = true },
      })
    end,
  },
}
