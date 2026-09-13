-- Leap: label-based motion. Installed from Codeberg, NOT GitHub.
--
-- Source of truth: https://codeberg.org/andyg/leap.nvim
-- The GitHub repo (ggandor/leap.nvim) is a migration stub - its README's first
-- line is "[Moved to Codeberg]". Codeberg is the actively developed tree.

local cb = function(repo) return 'https://codeberg.org/' .. repo end

vim.pack.add { cb 'andyg/leap.nvim' }

-- Default `s` and `S`, as upstream documents. leap.nvim has no
-- `add_default_mappings()` function - the mappings are explicit `<Plug>` sets.
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', { desc = 'Leap: jump to label' })
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)', { desc = 'Leap: jump across windows' })

-- DELIBERATELY OMITTED: leap's README also recommends
--
--   vim.keymap.set({ 'x', 'o' }, 'an', function() ... leap.treesitter.select ... end)
--
-- Neovim 0.12 already defines `an` (and `in`) as built-in incremental
-- tree-sitter selection - see `_core/defaults.lua:470` in the Neovim runtime,
-- documented as `v_an` / `v_in` at `runtime/doc/treesitter.txt:612-635`. The
-- built-in is strictly more capable: it falls back to
-- `vim.lsp.buf.selection_range()` when there is no parser, where leap's version
-- simply does nothing. Overriding it would be a pure downgrade.
--
-- min-ai in section 4 is configured the same way for the same reason
-- (around_next = 'aa', inside_next = 'ii'), so `an`/`in` stay Neovim's.
