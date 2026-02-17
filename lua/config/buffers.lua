-- Helix-inspired buffer management utilities
local M = {}

-- Enhanced buffer picker with preview
function M.pick_buffer()
  local buffers = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf)
  end, vim.api.nvim_list_bufs())
  
  local buffer_list = {}
  for _, buf in ipairs(buffers) do
    local name = vim.api.nvim_buf_get_name(buf)
    local display_name = vim.fn.fnamemodify(name, ":t")
    if display_name == "" then
      display_name = "[No Name]"
    end
    local modified = vim.api.nvim_buf_get_option(buf, "modified") and " [+]" or ""
    table.insert(buffer_list, {
      buf = buf,
      name = display_name .. modified,
      path = name,
      modified = vim.api.nvim_buf_get_option(buf, "modified"),
    })
  end
  
  -- Sort by modified status first, then by name
  table.sort(buffer_list, function(a, b)
    if a.modified ~= b.modified then
      return a.modified
    end
    return a.name < b.name
  end)
  
  vim.ui.select(buffer_list, {
    prompt = "Select buffer (Helix-style)",
    format_item = function(item)
      return string.format("%s %s", item.modified and "●" or "○", item.name)
    end,
  }, function(choice)
    if choice then
      vim.api.nvim_set_current_buf(choice.buf)
    end
  end)
end

-- Smart buffer switching (like Helix's buffer switching)
function M.smart_buffer_switch()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.tbl_filter(function(buf)
    return buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf)
  end, vim.api.nvim_list_bufs())
  
  if #buffers == 0 then
    vim.notify("No other buffers", vim.log.levels.WARN)
    return
  end
  
  -- Get the most recently used buffer
  local recent_buf = buffers[1]
  for _, buf in ipairs(buffers) do
    if vim.fn.bufnr(buf) > vim.fn.bufnr(recent_buf) then
      recent_buf = buf
    end
  end
  
  vim.api.nvim_set_current_buf(recent_buf)
end

-- Setup function
function M.setup()
  -- Override some default behaviors
  vim.keymap.set("n", "<leader>b", M.pick_buffer, { desc = "Buffer picker (Helix-style)" })
  vim.keymap.set("n", "<leader><Tab>", M.smart_buffer_switch, { desc = "Switch to previous buffer" })
  
  -- Add buffer info to statusline
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      local name = vim.api.nvim_buf_get_name(buf)
      local display_name = vim.fn.fnamemodify(name, ":t")
      if display_name == "" then
        display_name = "[No Name]"
      end
      local modified = vim.api.nvim_buf_get_option(buf, "modified") and " [+]" or ""
      
      -- You can add this to your statusline if needed
      vim.b.buffer_info = display_name .. modified
    end,
  })
end

return M