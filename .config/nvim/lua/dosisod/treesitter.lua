require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c',
    'cpp',
    'css',
    'go',
    'help',
    'html',
    'javascript',
    'lua',
    'mypyc_ir',
    'mypyc_test_cases',
    'python',
    'query',
    'rust',
    'skull',
    'typescript',
  },
  highlight = {
    enable = true
  }
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.skull = {
  install_info = {
    url = '~/git/tree-sitter-skull',
    files = {'src/parser.c'},
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = 'sk',
}

parser_config.mypyc_test_cases = {
  install_info = {
    url = "~/git/tree-sitter-mypyc",
    files = {"mypyc_test_cases/src/parser.c"},
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = "test",
}

parser_config.mypyc_ir = {
  install_info = {
    url = "~/git/tree-sitter-mypyc",
    files = {"mypyc_ir/src/parser.c"},
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
}

-- Setup tree-sitter context plugin
require('treesitter-context').setup {
  patterns = {
    default = {
      'class',
      'function',
      'method',
    },
  },
}
