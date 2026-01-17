return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()

      -- Global diagnostics config
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
        },
      })

      -- Lua LSP
      vim.lsp.config("lua_ls", {})
      vim.lsp.enable("lua_ls")

      -- Keybind for diagnostic details
      vim.keymap.set("n", "<leader>e", function()
        -- Make the diagnostic float focusable. Enter with <C-w>w
        vim.diagnostic.open_float(nil, {
          focus = true,
          scope = "line",
        })
      end,
      { desc = "Show diagnostics" })
    end,
  },
}
