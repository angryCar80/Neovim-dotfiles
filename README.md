🧠 My Neovim Config

A fast, minimal Neovim setup focused on dark themes, a smooth workflow, and built-in support for LSP, debugging, and navigation tools.

✨ Features

🌑 Dark Themes (with UI theme switcher)

⚡ Lazy.nvim plugin manager

🧠 LSP support with Mason + lspconfig

🔞 DAP (debugging) for C, C++, Rust, Go

🔭 Telescope for fuzzy finding

🪝 Harpoon 2 for quick file navigation

📀 Auto-save selected theme across restarts

🔌 Plugins

UI & Themes

catppuccin

tokyonight

gruvbox

kanagawa

onedark

rose-pine

oxocarbon

nord

vscode

...and more

↺ Switch themes with <leader>th

Core Tools

Feature

Plugin

Plugin manager

lazy.nvim

File finder

nvim-telescope/telescope.nvim

Navigation

ThePrimeagen/harpoon (v2)

Theme UI

stevearc/dressing.nvim

LSP

neovim/nvim-lspconfig

williamboman/mason.nvim

mason-lspconfig.nvim

Preinstalled: lua_ls, clangd, rust_analyzer

DAP (Debugging)

mfussenegger/nvim-dap

rcarriga/nvim-dap-ui

leoluz/nvim-dap-go

Keymaps:

<leader>dt: Toggle breakpoint

<leader>dc: Start / continue debug

🛠 Requirements

Neovim ≥ 0.9

A Nerd Font

ripgrep (for Telescope)

fd, bat (optional)

📁 Folder Structure

~/.config/nvim/
├── init.lua
├── lua/
│   ├── plugins/
│   │   ├─ theme_switcher.lua
│   │   ├─ lsp_dap.lua
│   │   ├─ telescope.lua
│   │   └─ harpoon.lua

🧘 Usage Tips

Use <leader>th to open the theme picker.

Use <leader>f to find files with Telescope.

Use Harpoon for jumping between files with custom keymaps.

LSP and DAP configs are auto-installed via Mason.

📦 Setup

git clone https://github.com/yourusername/nvim-config ~/.config/nvim
nvim

🗒 Notes

Themes persist across sessions.

Designed for dark environments only.

Easy to extend with more plugins or personal keymaps.

📸 Preview
* not now am sorry guys
