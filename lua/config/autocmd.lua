-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
  vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
