local themes = {
  "catppuccin",
  "tokyonight", 
  "gruvbox",
  "rose-pine",
  "kanagawa",
  "nord",
  "vscode"
}

local current_theme_index = 1
local theme_file = vim.fn.stdpath("data") .. "/nvim_theme.txt"

local function load_theme()
  local file = io.open(theme_file, "r")
  if file then
    local saved_theme = file:read("*a"):gsub("\n", "")
    file:close()
    for i, theme in ipairs(themes) do
      if theme == saved_theme then
        current_theme_index = i
        return
      end
    end
  end
end

local function save_theme(theme_name)
  local file = io.open(theme_file, "w")
  if file then
    file:write(theme_name)
    file:close()
  end
end

local function set_theme(theme_name)
  local success, err = pcall(vim.cmd.colorscheme, theme_name)
  if success then
    vim.notify("Theme changed to " .. theme_name, vim.log.levels.INFO)
    save_theme(theme_name)
    
    -- Update current_theme_index
    for i, theme in ipairs(themes) do
      if theme == theme_name then
        current_theme_index = i
        break
      end
    end
  else
    vim.notify("Failed to load theme: " .. theme_name .. " - " .. err, vim.log.levels.ERROR)
  end
end

local function cycle_theme()
  current_theme_index = (current_theme_index % #themes) + 1
  set_theme(themes[current_theme_index])
end

local function set_random_theme()
  local random_index = math.random(#themes)
  set_theme(themes[random_index])
end

local function pick_theme()
  vim.ui.select(themes, {
    prompt = "Select a theme:",
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice then
      set_theme(choice)
    end
  end)
end

-- Load saved theme on startup
load_theme()

-- Set theme after plugins are loaded
vim.defer_fn(function()
  set_theme(themes[current_theme_index])
end, 100)

-- Keymaps
vim.keymap.set("n", "<leader>y", "", { desc = "+Theme", noremap = true, silent = true })
vim.keymap.set("n", "<leader>yn", cycle_theme, { desc = "Next theme" })
vim.keymap.set("n", "<leader>yr", set_random_theme, { desc = "Random theme" })
vim.keymap.set("n", "<leader>yp", pick_theme, { desc = "Theme picker" })

-- Number themes
for i, theme in ipairs(themes) do
  vim.keymap.set("n", "<leader>y" .. i, function()
    set_theme(theme)
  end, { desc = theme })
end

-- Letter themes
vim.keymap.set("n", "<leader>yc", function() set_theme("catppuccin") end, { desc = "Catppuccin" })
vim.keymap.set("n", "<leader>yt", function() set_theme("tokyonight") end, { desc = "Tokyo Night" })
vim.keymap.set("n", "<leader>yg", function() set_theme("gruvbox") end, { desc = "Gruvbox" })
vim.keymap.set("n", "<leader>yv", function() set_theme("vscode") end, { desc = "VSCode Dark+" })
vim.keymap.set("n", "<leader>y7", function() set_theme("nord") end, { desc = "Nord" })