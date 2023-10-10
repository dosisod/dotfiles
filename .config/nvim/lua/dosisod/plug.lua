-- Required to be put above plug install
vim.g.coc_global_extensions = {
  'coc-tsserver',
  'coc-rust-analyzer',
  'coc-pyright',
  'coc-json',
  'coc-yaml',
  'coc-docker',
  'coc-kotlin',
}

-- To install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
vim.call('plug#begin', '~/.cache/nvim/')

local Plug = vim.fn['plug#']

Plug('airblade/vim-gitgutter')
Plug('junegunn/fzf', {dir = '~/.config/.fzf'})
Plug('junegunn/fzf.vim')
Plug('tpope/vim-surround')
Plug('morhetz/gruvbox')
Plug('dosisod/vim-skull')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-treesitter/playground')
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('numToStr/Comment.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('~/git/tree-sitter-skull')
Plug('~/git/tree-sitter-mypyc', {rtp = 'mypyc_test_cases'})
Plug('~/git/tree-sitter-mypyc', {rtp = 'mypyc_ir'})
Plug('~/git/tree-sitter-cicada')
Plug('tpope/vim-repeat')
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries'})
Plug('nvim-treesitter/nvim-treesitter-context')

vim.call('plug#end')

-- Setup "Comment" package
require('Comment').setup()
require('Comment.ft')

-- Setup Go LSP package
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'

-- Gitgutter settings
vim.opt.updatetime = 50

-- Disable FZF preview window
vim.g.fzf_preview_window = ''

-- Don't allow plugins to change indentation
vim.api.nvim_command('filetype plugin indent off')
