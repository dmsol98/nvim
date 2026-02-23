return {
  "sindrets/diffview.nvim",
  config = function()
    vim.keymap.set('n', '<leader>do', '<CMD>DiffviewOpen<CR>', { desc = '[D]iffview [O]pen' })
    vim.keymap.set('n', '<leader>dc', '<CMD>DiffviewClose<CR>', { desc = '[D]iffview [C]lose' })
  end,
}
