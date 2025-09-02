-- Set to true if nerd font is available in the terminal
vim.g.have_nerd_font = true

-- Require core settings first
require("config.options")
require("config.keymaps")
-- require("config.autocmd")
require("config.lazy")
