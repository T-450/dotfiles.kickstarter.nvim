-- Compatibility shim for Noctalia's generated lua/matugen.lua.
-- The local Neovim config already installs mini.nvim, whose documented
-- mini.base16 module applies Base16 palettes as highlight groups.
local M = {}

function M.setup(palette)
  require('mini.base16').setup {
    palette = palette,
    use_cterm = true,
  }
  vim.g.colors_name = 'matugen'
end

return M
