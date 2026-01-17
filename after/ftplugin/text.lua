vim.opt_local.wrap = true -- Wrap text
vim.opt_local.linebreak = true -- Match indent on line break
vim.opt_local.breakindent = true -- Line break on whole words

-- Allow j/k navigation for wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
