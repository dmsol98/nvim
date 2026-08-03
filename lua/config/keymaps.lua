-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Define variable
local set = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Lua development shortcuts
set("n", "<leader>x", "<CMD>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<CMD>source %<CR>", { desc = "Execute the current file" })

-- Keybinds to make split navigation easier
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Control the size of window splits
set("n", "<M-,>", "<C-W>5<", { desc = "Increase witdth" })
set("n", "<M-.>", "<C-W>5>", { desc = "Decrease witdth" })
set("n", "<M-'>", "<C-W>+", { desc = "Increase height" })
set("n", "<M-/>", "<C-W>-", { desc = "Decrease height" })

-- Windows and tabs
set("n", "<C-w>C", "<CMD>tabclose<CR>", { desc = "Close current tab" })
set("n", "<C-w>t", "<CMD>tabnew<CR>", { desc = "Open new tab" })
set("n", "<C-Right>", "<CMD>tabmove +1<CR>", { desc = "Move tab right" })
set("n", "<C-Left>", "<CMD>tabmove -1<CR>", { desc = "Move tab left" })
