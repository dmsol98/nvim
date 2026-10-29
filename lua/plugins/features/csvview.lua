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
      { "<leader>tc", "<CMD>CsvViewToggle<CR>", desc = "[T]oggle [C]sv View" },
    },
    -- cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
}
