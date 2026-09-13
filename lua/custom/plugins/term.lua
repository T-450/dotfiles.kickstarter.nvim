-- Toggleterm: a better `:terminal`, floating and actionable from any buffer.
-- Installed from https://github.com/akinsho/toggleterm.nvim
--
-- This is the weakest dependency in the config: no upstream commit since
-- 2025-03-09 (roughly 18 months at the time of writing) and ~92 open issues.
-- It is not archived and works, but it is a genuinely unmaintained surface, so
-- it is pinned to the last release tag instead of tracking a moving branch. A
-- silent upstream change cannot surprise a pinned tag.
--
-- To move it later: change the version, then
--   :lua vim.pack.update({ 'toggleterm.nvim' })

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'akinsho/toggleterm.nvim', version = 'v2.13.1' } }

require('toggleterm').setup {
  -- <C-\> is the upstream default; stated explicitly so it survives a change
  -- to the plugin's defaults.
  open_mapping = [[<c-\>]],
  -- A floating terminal avoids stealing window layout from the code you are
  -- reading, which is the whole point of a toggleable shell.
  direction = 'float',
  shade_terminals = false,
  -- Numbering lets you keep several shells apart with :2ToggleTerm etc.
  persist_size = true,
  close_on_exit = true,
}

-- Explicit openers, so the terminal is discoverable without knowing <C-\>.
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', { desc = '[T]oggle [t]erminal (float)' })
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal size=15<cr>', { desc = '[T]oggle terminal [h]orizontal' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical size=60<cr>', { desc = '[T]oggle terminal [v]ertical' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Terminal: back to normal mode' })
