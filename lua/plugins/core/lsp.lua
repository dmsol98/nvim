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
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThridParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- Python
      local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

      if is_windows then
        -- Windows: Pylance
        vim.lsp.config("pylance", {})
        vim.lsp.enable("pylance")
      else
        -- Linux: Pyright
        vim.lsp.config("pyright", {})
        vim.lsp.enable("pyright")
        -- Ruff (linting)
        vim.lsp.config("ruff_lsp", {})
        vim.lsp.enable("ruff_lsp")
      end

      -- C/C++
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy" },
      })
      vim.lsp.enable("clangd")

      -- Keybind for diagnostic details
      vim.keymap.set("n", "<leader>e", function()
          -- Make the diagnostic float focusable. Enter with <C-w>w
          vim.diagnostic.open_float(nil, {
            focus = true,
            scope = "line",
          })
        end,
        { desc = "Show diagnostics" })

      -- Autoformatting (linting)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end

          if client:supports_method('textDocument/completion', 0) then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end,
  },
}
