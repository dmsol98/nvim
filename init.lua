-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if nerd font is available in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default and use relative numbering
vim.o.number = true
vim.o.relativenumber = true

-- Set tab options
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Enable mouse mode
vim.o.mouse = "a"

-- Don't show the vim mode (it's already in the status line)
vim.o.showmode = true

-- Sync clipboard between OS and NeoVim
-- Schedule the setting after 'UiEnter' because it can increase startup time.
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Wrapped lines stay indented the same amount as the beginning of that line
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default (dedicated area for errors and warnings)
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 10

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
