return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      {
        "mfussenegger/nvim-dap-python",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Point nvim-dap-python at the debugpy venv Mason installs.
      -- Path differs on Windows (Scripts/python.exe) vs Linux (bin/python).
      local mason_path = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages", "debugpy", "venv")
      local is_windows = vim.uv.os_uname().sysname == "Windows_NT"
      local debugpy_python = is_windows and vim.fs.joinpath(mason_path, "Scripts", "python.exe")
          or vim.fs.joinpath(mason_path, "bin", "python")

      require("dap-python").setup(debugpy_python)

      -- Auto open/close the UI around a debug session
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Breakpoint sign appearance
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapStopped",
        { text = "→", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "" }
      )

      -- F-key keybinds
      vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F3>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<F5>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<F6>", dap.repl.open, { desc = "Debug: Open REPL" })
      vim.keymap.set("n", "<F11>", dap.terminate, { desc = "Debug: Terminate" })
      vim.keymap.set("n", "<F12>", dapui.toggle, { desc = "Debug: Toggle UI" })
    end,
  },
}
