return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
          },
        },
      })
      vim.keymap.set('n', '\\', '<CMD>Neotree toggle<CR>', { desc = 'Open Neotree' })
      vim.keymap.set('n', '<leader>gs', '<CMD>Neotree float git_status<CR>', { desc = 'Neotree Git Status' })
    end,
  }
}
