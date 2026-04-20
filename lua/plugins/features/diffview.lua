return {
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set('n', '<leader>dd', '<CMD>DiffviewOpen<CR>', { desc = '[D]iffview [D]iff' })
      vim.keymap.set('n', '<leader>dh', '<CMD>DiffviewFileHistory<CR>', { desc = '[D]iffview [H]istory' })
      vim.keymap.set('n', '<leader>dc', '<CMD>DiffviewClose<CR>', { desc = '[D]iffview [C]lose' })
    end,
  },
}
