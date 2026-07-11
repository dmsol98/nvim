return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>F",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        python = { "ruff_format" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback", -- use LSP formatting only if no conform formatter is configured for the filetype
      },
    },
  },
}
