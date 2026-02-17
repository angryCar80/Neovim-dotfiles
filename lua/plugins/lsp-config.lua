return {
  -- 🧱 Mason (LSP installer)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- 🔧 Mason-LSPConfig (bridge between mason & lspconfig)
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "rust_analyzer",
          "pyright",
          "gopls",
          "jdtls",
          "zls",
          "ols",
          -- "c3-lsp",
        }
      })
    end,
  },

  -- 🔌 Native LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 🧠 Lua LSP
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- 💻 C/C++ LSP
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })



      -- 🦀 Rust LSP
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
          },
        },
      })
      -- 🐹 Go LSP
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      -- ☕ Java LSP
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        cmd = {
          "jdtls",
          "--java-executable",
          vim.fn.exepath("java"),
        },
        root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git", "mvnw", "gradlew"),
        single_file_support = true,
        init_options = {
          jvm_args = {},
          workspace = vim.fn.stdpath("cache") .. "/jdtls/workspace",
        },
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.Assume.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.junit.jupiter.api.Assumptions.*",
                "org.junit.jupiter.api.DynamicContainer.*",
                "org.junit.jupiter.api.DynamicTest.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            format = {
              enabled = true,
            },
          },
        },
      })
      -- Zig LSP
      lspconfig.zls.setup({
        capabilities = capabilities,
      })
      -- 🎯 Dart LSP
      lspconfig.dartls.setup({
        capabilities = capabilities,
      })
      -- 🐦 Odin LSP
      lspconfig.ols.setup({
        capabilities = capabilities,
      })
      -- 🔷 C3 LSP
      -- lspconfig.c3_lsp.setup({
      --   capabilities = capabilities,
      -- })
      -- 🔍 Useful keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
      vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set({ "n", "v" }, "<leader>cq", vim.lsp.buf.code_action, { desc = "Code action" })

      -- 💬 Auto popup diagnostics
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
        end,
      })

      -- Optional: faster CursorHold delay
      vim.o.updatetime = 300
    end,
  },
}
