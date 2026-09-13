-- File explorer. Installed from https://github.com/nvim-tree/nvim-tree.lua
--
-- netrw is disabled in section 1 of init.lua. That is required, not optional -
-- see `:help nvim-tree-netrw` in the plugin's own docs: with netrw still
-- loaded, both explorers claim the same directories.
--
-- Icons come from MiniIcons.mock_nvim_web_devicons() (section 4, requires
-- vim.g.have_nerd_font), so nvim-web-devicons is deliberately NOT installed -
-- it would only duplicate the icon set and double the load cost.

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'nvim-tree/nvim-tree.lua' }

require('nvim-tree').setup {
  -- The explorer is a navigation surface, not a persistent sidebar.
  view = { width = 34, side = 'left' },
  renderer = { group_empty = true },
  -- Keep dotfiles visible: this is a config/dev repo where .gitignore,
  -- .luarc.json and friends matter.
  filters = { dotfiles = false },
  -- Don't hijack netrw's directory-open behaviour twice.
  hijack_directories = { enable = false },
}

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = '[E]xplore: toggle file tree' })
vim.keymap.set('n', '<leader>E', '<cmd>NvimTreeFindFile<cr>', { desc = '[E]xplore: reveal current file' })
