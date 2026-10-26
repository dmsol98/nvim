return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {

      -- Telescope
      {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
          },
        },
      },

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
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
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
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },
      })

      -- Enable LSPs
      vim.lsp.enable({ "lua_ls", "pyright", "ruff", "clangd" })

      -- Keybind for diagnostic details
      vim.keymap.set("n", "<leader>e", function()
        -- Make the diagnostic float focusable. Enter with the same command.
        vim.diagnostic.open_float(nil, { focus = true, scope = "line" })
      end, { desc = "Show diagnostics" })

      --Keymaps
      local tb = require("telescope.builtin")
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
          end

          local opts_lsp = require("telescope.themes").get_ivy({
            layout_config = { width = 0.50, height = 0.50 },
            path_display = { "smart" },
            -- fname_width = 5,
          })

          -- Navigation
          map("<leader>ld", tb.lsp_definitions, "Go to definition")
          map("<leader>lD", vim.lsp.buf.declaration, "Go to declaration")
          map("<leader>lr", tb.lsp_references, "List references")
          map("<leader>li", tb.lsp_implementations, "List implementations")
          map("<leader>lt", tb.lsp_type_definitions, "Go to type definition")
          map("<leader>lR", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>la", vim.lsp.buf.code_action, "Code action")
          map("<leader>le", function()
            tb.diagnostics({ bufnr = 0 })
          end, "Buffer diagnostic list")
          map("<leader>lE", tb.diagnostics, "Project diagnostic list")
          map("<leader>ls", function()
            tb.lsp_document_symbols(opts_lsp)
          end, "Document symbols")
          map("<leader>lS", function()
            tb.lsp_dynamic_workspace_symbols(opts_lsp)
          end, "Workspace symbols")
        end,
      })
    end,
  },
}
