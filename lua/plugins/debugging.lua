return {
  -- LSP for C/C++
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "zls" },
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- Zig LSP
      lspconfig.zls.setup({
        capabilities = capabilities,
      })
    end,
  },

  -- DAP with LLDB
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      -- Keymaps for debugging
      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<Leader>dc", dap.continue, {})
      vim.keymap.set("n", "<Leader>do", dap.step_over, {})
      vim.keymap.set("n", "<Leader>di", dap.step_into, {})
      vim.keymap.set("n", "<Leader>du", dap.step_out, {})

      -- Zig-specific keymaps
      vim.keymap.set("n", "<Leader>zr", function()
        vim.cmd("terminal zig build run")
        vim.cmd("startinsert")
      end, { desc = "Zig build run" })
      
      vim.keymap.set("n", "<Leader>zb", function()
        vim.cmd("terminal zig build")
        vim.cmd("startinsert")
      end, { desc = "Zig build" })
      
      vim.keymap.set("n", "<Leader>zt", function()
        vim.cmd("terminal zig test")
        vim.cmd("startinsert")
      end, { desc = "Zig test" })

      -- LLDB Adapter (Linux)
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-dap", -- use lldb-dap for better DAP support
        name = "lldb",
      }

      -- Config for C/C++
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
          },
        }
      end

      -- Config for Zig
      dap.configurations.zig = {
        {
          name = "Launch Zig",
          type = "lldb",
          request = "launch",
          program = function()
            -- Try to find the executable in common Zig output directories
            local exe_path = vim.fn.getcwd() .. "/zig-out/bin/" .. vim.fn.fnamemodify(vim.fn.expand("%:t:r"), ":r")
            if vim.fn.filereadable(exe_path) == 0 then
              exe_path = vim.fn.input("Path to Zig executable: ", exe_path, "file")
            end
            return exe_path
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
        {
          name = "Launch Zig (Debug)",
          type = "lldb",
          request = "launch",
          program = function()
            local exe_path = vim.fn.getcwd() .. "/zig-out/bin/" .. vim.fn.fnamemodify(vim.fn.expand("%:t:r"), ":r")
            if vim.fn.filereadable(exe_path) == 0 then
              exe_path = vim.fn.input("Path to Zig executable: ", exe_path, "file")
            end
            return exe_path
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
          args = {},
        },
      }
    end,
  },
}

