return {
  {
    'lewis6991/gitsigns.nvim',

    config = function()
      require('gitsigns').setup {
        signs                        = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged                 = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged_enable          = true,
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          follow_files = true
        },
        auto_attach                  = true,
        attach_to_untracked          = false,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
          -- Options passed to nvim_open_win
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },

        on_attach                    = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "[S]tage Hunk" })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "[R]eset Hunk" })

          map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = "[S]tage Hunk" })

          map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = "[R]eset Hunk" })

          map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "[S]tage Buffer" })
          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "[R]eset Buffer" })
          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "[P]review Hunk" })
          map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "[I]nline Preview Hunk" })

          map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
          end, { desc = "[B]lame Line" })

          map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = "[Q]uickFixList All Buffers" })
          map('n', '<leader>hq', gitsigns.setqflist, { desc = "[Q]uickFixList Current Buffer" })

          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "[T]oggle Current Line [B]lame" })
          map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "[T]oggle [W]ord Diff" })
          map('n', '<leader>tn', gitsigns.toggle_numhl, { desc = "[T]oggle [N]umber Highlight" })
          map('n', '<leader>tl', gitsigns.toggle_linehl, { desc = "[T]oggle [L]ine Highlight" })
          map('n', '<leader>ts', gitsigns.toggle_signs, { desc = "[T]oggle [S]igns" })

          -- Text object
          map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = "Select [I]n Hunk" })
        end
      }
    end,
  },
}
