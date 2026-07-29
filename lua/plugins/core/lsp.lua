return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {

    -- Mason
      {
        "mason-org/mason.nvim",
        opts = {},
      },

      -- Mason tool installer
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
          ensure_installed = {
            "lua-language-server",
            "pyright",
            "ruff",
            "clangd",
            "stylua",
            "clang-format",
            "debugpy",
          },
        },
      },

      -- LazyDev
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

    -- LSP configuration
    config = function()
      -- Global diagnostics
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        cmd = {
          "lua-language-server",
          "--logpath=" .. vim.fs.joinpath(vim.fn.stdpath("cache"), "lua_ls", "log"),
          "--metapath=" .. vim.fs.joinpath(vim.fn.stdpath("cache"), "lua_ls", "meta"),
        },
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Python
      vim.lsp.config("pyright", {
        settings = {
          pyright = { disableOrganizeImports = true }, -- Let ruff own import sorting
        },
      })

      vim.lsp.config("ruff", {
        cmd = { "ruff", "server" },
      })

      -- C/C++
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy" },
      })

      -- Enable LSPs
      vim.lsp.enable({ "lua_ls", "pyright", "ruff", "clangd" })

      -- Keybind for diagnostic details
      vim.keymap.set("n", "<leader>e", function()
        -- Make the diagnostic float focusable. Enter with the same command.
        vim.diagnostic.open_float(nil, { focus = true, scope = "line" })
      end, { desc = "Show diagnostics" })
    end,
  },
}
