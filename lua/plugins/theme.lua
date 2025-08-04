return {
  "nyoom-engineering/oxocarbon.nvim",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme oxocarbon")
  end
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
