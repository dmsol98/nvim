return {
  {
    'numToStr/FTerm.nvim',
    config = function()
      local fterm = require('FTerm')
      vim.keymap.set('n', '<leader>tt', function() fterm.toggle() end, { desc = '[T]oggle [T]erminal' })
      vim.keymap.set('t', '<leader>tt', function() fterm.toggle() end, { desc = '[T]oggle [T]erminal' })
    end,
  },
}
