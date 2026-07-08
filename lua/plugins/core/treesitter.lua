return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    -- Languages
    local lang_required = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }
    local lang_custom = { "bash", "cmake", "cpp", "json", "matlab", "sql", "toml", "xml", "yaml" }

    -- Concatenate languages to install
    local lang_all = {}
    for _, lang in ipairs(lang_required) do
      table.insert(lang_all, lang)
    end
    for _, lang in ipairs(lang_custom) do
      table.insert(lang_all, lang)
    end

    -- File types
    local ft_required = { "c", "lua", "vim", "vimdoc", "query", "markdown" }
    local ft_custom = { "bash", "cmake", "cpp", "json", "matlab", "sql", "toml", "xml", "yaml" }

    -- Concatenate file types to install
    local ft_all = {}
    for _, ft in ipairs(ft_required) do
      table.insert(ft_all, ft)
    end
    for _, ft in ipairs(ft_custom) do
      table.insert(ft_all, ft)
    end

    ts.install( lang_all )

    vim.api.nvim_create_autocmd("FileType", {
        pattern = ft_all,
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
  end,
}
