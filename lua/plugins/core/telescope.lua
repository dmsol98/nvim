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
          find_files = {
            hidden = false,
          },
        },
        extensions = {
          fzf = {}
        },
      }

      telescope.load_extension('fzf')

      -- Set keymaps
      local builtin = require('telescope.builtin')
      -- Find files in CWD (indlude hidden, no gitignored files, no files in ".git/" folder)
      vim.keymap.set('n', '<leader>ff',
        function() builtin.find_files({ hidden = true, no_ignore = false, file_ignore_patterns = { '^.git/' } }) end,
        { desc = 'Telescope [F]ind [F]iles in CWD' })
      -- Find ALL files in CWD
      vim.keymap.set('n', '<leader>fF',
        function() builtin.find_files({ hidden = true, no_ignore = true }) end,
        { desc = 'Telescope [F]ind Hidden [F]iles in CWD' })
      -- Find files in CWD containing string using ripgrep (indlude hidden, no gitignored files, no files in ".git/" folder)
      vim.keymap.set('n', '<leader>fa',
        function() builtin.live_grep({ hidden = true, no_ignore = false, file_ignore_patterns = { '^.git/' } }) end,
        { desc = 'Telescope [F]ind [A]ll in CWD' })
      -- Find files in CWD containing string using ripgrep (respects gitignore)
      vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = 'Telescope [F]ind [A]ll in CWD' })
      -- Find all buffers
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope [F]ind [B]uffers' })
      -- Find help tag files
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope [F]ind [H]elp Tags' })
      -- Fuzzy find string in current buffer
      vim.keymap.set('n', '<leader>fi',
        function()
          local opts = require("telescope.themes").get_dropdown({ layout_config = { width = 0.80, height = 0.50, }, })
          builtin.current_buffer_fuzzy_find(opts)
        end,
        { desc = 'Telescope [F]ind [I]n Current Buffer' })
      -- Find lazy plugin files (search the plugin directory)
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { cwd = vim.fn.stdpath("config") }
      end, { desc = 'Telescope [F]ind [C]onfig Files' })
      -- Find nvim config files from any working directory
      vim.keymap.set('n', '<leader>fp', function()
        builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }
      end, { desc = 'Telescope [F]ind [P]lugin Files' })
      -- Fzf Lua
      vim.keymap.set('n', '<leader>ft',
        function()
          local opts1 = require("telescope.themes").get_dropdown({ layout_config = { width = 0.50, height = 0.50, }, })
          local opts2 = { enable_preview = true, previewer = false }
          local opts = vim.tbl_extend('force', opts1, opts2)
          builtin.colorscheme(opts)
        end,
        { desc = 'FzfLua [F]ind [T]heme' })
    end,

  },
}
