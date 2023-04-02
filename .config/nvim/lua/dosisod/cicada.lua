vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cicada',
  command = 'setlocal ts=2 sw=2 sts=2 expandtab'
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.ci', command = 'set syntax=cicada filetype=cicada'})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.cicada = {
  install_info = {
    url = "~/git/tree-sitter-cicada",
    files = {"src/parser.c"},
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = "ci",
}
