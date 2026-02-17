# Neovim Config

A blazing fast, minimalist Neovim configuration built for developers who love dark themes and smooth workflows.

![Neovim](https://img.shields.io/badge/Neovim-0.9+-57a143?style=flat&logo=neovim)
![License](https://img.shields.io/github/license/angrycar/Neovim-dotfiles)

## Features

### Themes
Beautiful dark themes built-in with instant switching:
- **Catppuccin** (Mocha)
- **Tokyo Night**
- **Gruvbox**
- **Rose Pine**
- **Kanagawa**
- **Nord**
- **VSCode Dark+**

Press `<leader>th` to cycle through themes. Your choice is saved automatically.

### Development Tools

| Feature | Plugin | Description |
|---------|--------|-------------|
| LSP | `mason.nvim` + `lspconfig` | Language server support for 15+ languages |
| Completion | `nvim-cmp` | Fast autocomplete with LSP, snippets, buffer |
| Debugging | `nvim-dap` | Debug C, C++, Rust, Zig with LLDB |
| Search | `telescope.nvim` | Fuzzy file finding, grep, and more |
| Navigation | `harpoon` | Quick file jumping with visual markers |
| Git | `gitsigns` | Inline git diffs and hunks |
| Snippets | `LuaSnip` | Fast snippet engine |

### Supported Languages
- Lua, C/C++, Rust, Go, Java, Python
- Zig, Dart, Odin

## Keybindings

### General
| Key | Action |
|-----|--------|
| `<leader>e` | Open Netrw file explorer |
| `<Ctrl-h/j/k/l>` | Navigate Tmux panes |

### Telescope
| Key | Action |
|-----|--------|
| `<leader>f` | Find files |
| `<leader>sg` | Grep search |

### LSP
| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gD` | Go to definition |
| `<leader>cq` | Code action |

### Debugging
| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue / Start |
| `<leader>do` | Step over |
| `<leader>di` | Step into |
| `<leader>du` | Step out |

### Harpoon
| Key | Action |
|-----|--------|
| `<leader>a` | Add file to harpoon |
| `<leader>1-3` | Jump to harpooned file |

## Requirements

- **Neovim** 0.9 or higher
- **Nerd Font** (for icons)
- **Ripgrep** (for Telescope)
- **Tmux** (optional, for pane navigation)

## Installation

```bash
# Clone the repository
git clone https://github.com/angrycar/Neovim-dotfiles ~/.config/nvim

# Start Neovim (plugins will install automatically)
nvim
```

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/
│   │   ├── themes.lua       # Theme switcher
│   │   ├── buffers.lua     # Buffer management
│   │   └── zig.lua         # Zig-specific config
│   └── plugins/
│       ├── themes.lua      # Theme plugins
│       ├── lsp-config.lua  # LSP setup
│       ├── debugging.lua   # DAP config
│       ├── telescope.lua   # Fuzzy finder
│       ├── harpoon.lua     # File navigation
│       └── ...
└── lazy-lock.json
```

## Notes

- Themes persist across sessions via auto-save
- All LSP servers auto-install via Mason on first use
- Optimized for dark environments
- Inspired by LazyVim but lighter

## Screenshot

*Coming soon*

## License

MIT
