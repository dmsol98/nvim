return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
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
          },
        },
      },
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
            diagnostics = { globals = { "vim" }, },
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
        init_options = {
          settings = {}, -- e.g. { configuration = { lint = {...} } } if you want more overrides
        },
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
        vim.diagnostic.open_float(nil, { focus = true, scope = "line", })
      end, { desc = "Show diagnostics" })

      -- Format on save for clients that support formatting
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client:supports_method("textDocument/formatting", 0) then
            return
          end
          vim.api.nvim_clear_autocmds({ event = "BufWritePre", buffer = args.buf, group = "my.lsp" })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = "my.lsp",
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end,
      })
    end,
  },
}
