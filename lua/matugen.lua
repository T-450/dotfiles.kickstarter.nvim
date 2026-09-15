 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#262626',
    base01 = '#303030',
    base02 = '#3a3a3a',
    base03 = '#6f6f6f',
    base04 = '#bcbcbc',
    base05 = '#bcbcbc',
    base06 = '#bcbcbc',
    base07 = '#bcbcbc',
    base08 = '#af5f5f',
    base09 = '#ffffaf',
    base0A = '#5fafaf',
    base0B = '#87afd7',
    base0C = '#ffff80',
    base0D = '#96bfe9',
    base0E = '#96e9e9',
    base0F = '#bef4f4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#bcbcbc',          bg = '#262626' })
  hi('TelescopeBorder',         { fg = '#6f6f6f',             bg = '#262626' })
  hi('TelescopePromptNormal',   { fg = '#bcbcbc',          bg = '#262626' })
  hi('TelescopePromptBorder',   { fg = '#6f6f6f',             bg = '#262626' })
  hi('TelescopePromptPrefix',   { fg = '#87afd7',             bg = '#262626' })
  hi('TelescopePromptCounter',  { fg = '#bcbcbc',  bg = '#262626' })
  hi('TelescopePromptTitle',    { fg = '#262626',             bg = '#87afd7' })
  hi('TelescopePreviewTitle',   { fg = '#262626',             bg = '#5fafaf' })
  hi('TelescopeResultsTitle',   { fg = '#262626',             bg = '#ffffaf' })
  hi('TelescopeSelection',      { fg = '#bcbcbc',          bg = '#3a3a3a' })
  hi('TelescopeSelectionCaret', { fg = '#87afd7',             bg = '#3a3a3a' })
  hi('TelescopeMatching',       { fg = '#87afd7',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
