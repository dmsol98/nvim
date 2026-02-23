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
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope [F]ind [F]iles in CWD' })
      vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = 'Telescope [F]ind [A]ll in CWD' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope [F]ind [B]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope [F]ind [H]elp Tags' })
      vim.keymap.set('n', '<leader>fi', function()
        local opts = require("telescope.themes").get_dropdown({
          layout_config = {
            width = 0.80,
            height = 0.50,
          },
        })
        builtin.current_buffer_fuzzy_find(opts)
      end, { desc = 'Telescope [F]ind [I]n Current Buffer' })
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { cwd = vim.fn.stdpath("config") }
      end, { desc = 'Telescope [F]ind [P]lugin Files' })
      vim.keymap.set('n', '<leader>fp', function()
        builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }
      end, { desc = 'Telescope [F]ind [C]onfig Files' })
    end,

  },
}
