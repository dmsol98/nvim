return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
      local telescope = require('telescope')
      telescope.setup {
        defaults = {
          mappings = {
            i = { ["<C-h>"] = "which_key" }
          }
        },
        pickers = {
          find_files = { hidden = true }
        },
        extensions = {
          fzf = {}
        },
      }

      telescope.load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fp', function()
        local opts = require("telescope.themes").get_dropdown({
          layout_config = {
            width = 0.80,
            height = 0.50,
          },
        })
        builtin.current_buffer_fuzzy_find(opts)
      end, { desc = 'Telescope find in current buffer' })
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { cwd = vim.fn.stdpath("config") }
      end, { desc = 'Telescope find config files' })
    end,

  },
}
