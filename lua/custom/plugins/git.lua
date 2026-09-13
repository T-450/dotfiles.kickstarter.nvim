-- Git tooling: vim-fugitive (full Git porcelain) + git-blame.nvim (per-line blame).
--
-- vim-fugitive is a plugin-script-only Vim plugin: it ships no lua/ directory
-- and has no setup() function. Installing it is the whole configuration; its
-- commands (:Git, :Git blame, :Git log, :GBrowse, ...) become available
-- immediately. It does not overlap gitsigns.nvim - gitsigns is gutter signs and
-- hunk staging, fugitive is the full Git command surface.

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'tpope/vim-fugitive', gh 'f-person/git-blame.nvim' }

-- git-blame.nvim ships `enabled = true` by default, which would put an
-- always-on virtual-text blame on every line. gitsigns already owns that
-- surface (<leader>tb, defined in section 4), and running both at once draws
-- two blame strings on the same line, so this starts off and is toggled on
-- demand. Only enable one of the two at a time.
require('gitblame').setup {
  enabled = false,
  date_format = '%Y-%m-%d',
  message_template = ' <author> • <date> • <summary>',
}

-- `gb` rather than reusing gitsigns' `tb`, so the two are independently
-- addressable and the overlap is visible in the keymap list.
vim.keymap.set('n', '<leader>gb', '<cmd>GitBlameToggle<cr>', { desc = 'Git [b]lame this line (toggle)' })
vim.keymap.set('n', '<leader>gB', '<cmd>GitBlameOpenCommitURL<cr>', { desc = 'Git [B]lame: open commit in browser' })
