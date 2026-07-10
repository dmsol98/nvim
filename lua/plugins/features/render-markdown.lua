return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},

    config = function()
      -- require('render-markdown').setup({
      local set = vim.keymap.set

      set('n', '<leader>tm', require('render-markdown').buf_toggle, { desc = "[T]oggle [M]arkdown" })
      -- })
    end,
  }
}
