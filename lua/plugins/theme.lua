return {
  {
  "Shatur/neovim-ayu",
  priority = 1000,
  config = function()
    require("ayu").setup({
      mirage = false, -- set to true for "mirage"
    })
    vim.cmd("colorscheme ayu-dark")
  end
}

}


--the vscode theme
--"Mofiqul/vscode.nvim",
  --lazy = false,
  --priority = 1000,
  --config = function()
    --require("vscode").setup({
      --transparent = false,
      --italic_comments = true,
    --})
    --vim.cmd("colorscheme vscode")
  --end,
