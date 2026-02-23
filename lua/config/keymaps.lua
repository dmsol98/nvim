-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Keybinds to make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Windows and tabs
vim.keymap.set("n", "<C-w>c", "<CMD>tabclose<CR>", { desc = "Close current tab" })

-- Fzf Lua
vim.keymap.set('n', '<leader>fs', "<CMD>FzfLua colorschemes<CR>", { desc = 'FzfLua [F]ind Color[S]cheme' })
