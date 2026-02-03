-- lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
      })

      -- Load the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
