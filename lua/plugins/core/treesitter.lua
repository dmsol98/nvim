return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local lang_required = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }
      local lang_custom = { "bash", "cmake", "cpp", "json", "matlab", "toml", "xml", "yaml" }
      local lang_all = {}
      for _, lang in ipairs(lang_required) do
        table.insert(lang_all, lang)
      end
      for _, lang in ipairs(lang_custom) do
        table.insert(lang_all, lang)
      end
      require'nvim-treesitter.configs'.setup {
        ensure_installed = lang_all,
        highlight = {
          enable = true,
          disable = function(lang, buf)
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                  return true
              end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  }
}
