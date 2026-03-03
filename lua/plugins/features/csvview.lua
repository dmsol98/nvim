return {
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
      },
    },
    keys = {
      { '<leader>cv', '<CMD>CsvViewToggle<CR>', desc = 'Toggle [C]sv [V]iew' },
    },
    -- cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  }
}
