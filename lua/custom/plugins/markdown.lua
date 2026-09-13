-- In-buffer Markdown rendering (headings, bullets, code fences, tables, links).
-- Installed from https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- Requirements, per the plugin's README - all already satisfied here:
--   * tree-sitter `markdown` and `markdown_inline` parsers (section 9)
--   * nvim-treesitter (section 9) and mini.nvim (section 4) as dependencies
--   * Neovim >= 0.9 (this is 0.12.5)
--
-- No setup() options: the defaults are already what we want, and adding
-- decoration options here is exactly the kind of extra effect the colorscheme
-- choice was meant to avoid. Call `:RenderMarkdown toggle` in-buffer if you ever
-- want to see the raw source while the renderer is on.

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {}
