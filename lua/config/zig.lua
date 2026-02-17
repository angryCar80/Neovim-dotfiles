-- Zig-specific configuration
return {
  -- Autocmd for Zig files
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "zig",
    callback = function()
      -- Set indentation for Zig
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 4
      
      -- Zig-specific keymaps
      vim.keymap.set("n", "<leader>zf", function()
        vim.cmd("terminal zig fmt " .. vim.fn.expand("%:p"))
        vim.cmd("startinsert")
      end, { buffer = true, desc = "Format Zig file" })
    end,
  }),
}