-- In-buffer Markdown rendering (headings, bullets, code fences, tables, links).
--
-- Needs the tree-sitter `markdown` and `markdown_inline` parsers and mini.nvim
-- (both from init.lua) - nothing else.

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  -- LaTeX rendering needs the tree-sitter `latex` parser plus `utftex` or
  -- `latex2text`. None of the three is installed and `utftex` is not in the
  -- Arch repos, so leaving this on only produces three `:checkhealth`
  -- warnings. Install them and set this to true to turn it back on.
  latex = { enabled = false },
}
