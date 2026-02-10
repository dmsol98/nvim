return {
  {
    'numToStr/FTerm.nvim',
    config = function()
      local fterm = require('FTerm')

      -- Pick shell based on OS
      local cmd
      if vim.fn.has("win32") == 1 then
        if vim.fn.executable("pwsh") == 1 then
          cmd = { "pwsh", "-NoLogo" }
        else
          cmd = { "powershell", "-NoLogo" }
        end
      else
        cmd = { vim.env.SHELL or "/bin/zsh" }
      end

      -- FTerm setup MUST happen before toggle()
      fterm.setup({
        cmd = cmd,
      })

      -- Keymaps
      vim.keymap.set('n', '<leader>tt', function() fterm.toggle() end, { desc = '[T]oggle [T]erminal' })
      vim.keymap.set('t', '<leader>tt', function() fterm.toggle() end, { desc = '[T]oggle [T]erminal' })
    end,
  },
}
