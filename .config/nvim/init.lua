local opt = vim.o
local g = vim.g
local cmd = vim.api.nvim_command
local exec = vim.api.nvim_exec
local map = vim.api.nvim_set_keymap
local create_user_command = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd

g.coc_global_extensions = {
  'coc-tsserver',
  'coc-rust-analyzer',
  'coc-pyright',
  'coc-json',
  'coc-yaml',
  'coc-docker',
}

-- to install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
vim.call('plug#begin', '~/.cache/nvim/')

local Plug = vim.fn['plug#']

Plug('airblade/vim-gitgutter')
Plug('junegunn/fzf', {dir = '~/.config/.fzf'})
Plug('junegunn/fzf.vim')
Plug('Glench/Vim-Jinja2-Syntax')
Plug('tpope/vim-surround')
Plug('morhetz/gruvbox')
Plug('dosisod/vim-skull')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-treesitter/playground')
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('numToStr/Comment.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('~/git/tree-sitter-skull')
Plug('tpope/vim-repeat')
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries'})

vim.call('plug#end')

-- make using Plug easier
create_user_command('PI', 'PlugInstall', {})
create_user_command('PC', 'PlugClean', {})
create_user_command('PU', 'PlugUpdate', {})

opt.syntax = 'on'

opt.background = 'dark'
cmd('colorscheme gruvbox')
opt.tgc = true


-- gitgutter settings
opt.updatetime = 100
exec([[
hi GruvBoxRedSign guifg=#fb4934 guibg=bg
hi GruvBoxAquaSign guifg=#8ec07c guibg=bg
hi GruvBoxGreenSign guifg=#b8bb26 guibg=bg
hi SignColumn guibg=bg
hi CursorLineNr guibg=bg
hi Operator ctermfg=223 guifg=#ebdbb2
]], true)

map('n', '<leader>j', ':GitGutterNextHunk<CR>', {})
map('n', '<leader>k', ':GitGutterPrevHunk<CR>', {})

map('n', '<SPACE>', ':GFiles<CR>', {noremap = true})
map('n', '<C-SPACE>', ':FZF<CR>', {noremap = true})

g.fzf_preview_window = ''

map('i', '<C-x><C-l>', '<plug>(fzf-complete-line)', {})
map('i', '<C-x><C-p>', '<plug>(fzf-complete-path)', {})

-- CoC setup
map('n', 'gd', '<Plug>(coc-definition)', {silent = true})
map('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
map('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
map('n', 'gr', '<Plug>(coc-references)', {silent = true})
map('n', 'K', ':call ShowDocumentation()<CR>', {noremap = true, silent = true})

create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.pyi', command = 'set syntax=python'})
create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.sk', command = 'set syntax=skull filetype=skull'})
create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.c', command = 'set syntax=c filetype=c'})
create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.h', command = 'set syntax=c filetype=c'})
create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.ll', command = 'set syntax=llvm filetype=llvm'})
create_autocmd({'BufNewFile', 'BufRead'}, {pattern = 'Dockerfile.*', command = 'set syntax=dockerfile filetype=dockerfile'})
create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.py', command = 'set commentstring=#\\ %s'})


create_autocmd('TermOpen', {
  pattern = '*',
  command = 'setlocal nonumber norelativenumber'
})

create_autocmd('FileType', {
  pattern = 'python,java,rust',
  command = 'setlocal ts=4 sw=4 sts=4 expandtab'
})

create_autocmd('FileType', {
  pattern = 'markdown,vue,typescript,html,javascript,css,scss,json,yaml,skull,toml',
  command = 'setlocal ts=2 sw=2 sts=2 expandtab'
})

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'javascript', 'typescript', 'python', 'html', 'skull', 'query', 'rust', 'go' },
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

require('Comment').setup()

require('colorizer').setup()

require('Comment.ft')

-- go LSP setup
g.go_def_mode = 'gopls'
g.go_info_mode = 'gopls'


-- setup splits
opt.splitbelow = true
opt.splitright = true

-- sane defaults
cmd('set nowrap')
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.showcmd = true
opt.wildmenu = true
opt.scrolloff = 2
opt.sidescrolloff = 2
opt.lazyredraw = true
opt.ignorecase = true
opt.smartcase = true
cmd("set dir=~/.cache/swp")
opt.undofile = true
opt.undodir = '/tmp'
opt.mousemodel = 'extend'
opt.mouse = 'a'

-- disable tab options set by plugins
cmd('filetype plugin indent off')

-- add clipboard capabilities if available
if vim.fn.has('unnamedplus') == 1 then
  opt.clipboard = 'unnamed,unnamedplus'
end

-- added possible paths for `gf` command
opt.path = ',./,/usr/include/,/usr/include/llvm-c-10'

-- changes search functionality/colors
opt.incsearch = true
opt.hlsearch = true
opt.gdefault = true

-- whitespace highlighters
cmd('hi NoWhitespace term=standout cterm=standout ctermfg=196 ctermbg=234')
cmd('hi SpecialKey term=bold ctermfg=237')
cmd("match noWhitespace '\\s\\+$'")
opt.listchars = 'tab:→ '
opt.fillchars = 'vert:│,eob: '
opt.list = true

opt.cursorline = true
opt.guicursor = ''

-- ALT+UP and ALT+DOWN to switch up and down buffers
map('', '<M-UP>', ':bp<CR>', {silent = true})
map('!', '<M-UP>', '<ESC>:bp<CR>a', {silent = true})
map('', '<M-DOWN>', ':bn<CR>', {silent = true})
map('!', '<M-DOWN>', '<ESC>:bn<CR>a', {silent = true})

-- open nvimrc/bashrc from inside vim
create_user_command('V', 'e ~/.config/nvim/init.lua', {})
create_user_command('B', 'e ~/.bashrc', {})

-- auto block creation
map('i', '{<CR>', '{<CR><TAB><END><CR><BS>}<ESC>kI', {noremap = true})
map('i', '(<CR>', '(<CR><TAB><END><CR><BS>)<ESC>kI', {noremap = true})

-- below copied from:
-- https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
-- https://github.com/maralla/completor.vim
opt.completeopt = 'longest,menuone'

map('i', '<Tab>', [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], {expr = true, noremap = true})
exec([[
inoremap <silent><expr> <C-N>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<C-N>" :
  \ coc#refresh()
]], true)

map('', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', {silent = true})
map('', '<leader>n', [[:let @/ = ""<CR>]], {silent = true})

-- makes quiting easier
create_user_command('WQ', 'wq', {})
create_user_command('Wq', 'wq', {})
create_user_command('W', 'w', {})

-- switch between buffers easily
map('n', '<C-J>', '<C-W>j', {noremap = true})
map('n', '<C-K>', '<C-W>k', {noremap = true})
map('n', '<C-L>', '<C-W>l', {noremap = true})
map('n', '<C-H>', '<C-W>h', {noremap = true})

map('t', '<C-J>', '<C-W>j', {noremap = true})
map('t', '<C-K>', '<C-W>k', {noremap = true})
map('t', '<C-L>', '<C-W>l', {noremap = true})
map('t', '<C-H>', '<C-W>h', {noremap = true})

map('n', '<C-S-LEFT>', '<C-W><', {noremap = true, silent = true})
map('n', '<C-S-RIGHT>', '<C-W>>', {noremap = true, silent = true})
map('n', '<C-S-UP>', '<C-W>+', {noremap = true, silent = true})
map('n', '<C-S-DOWN>', '<C-W>-', {noremap = true, silent = true})

map('i', '<F1>', '<nop>', {})
map('n', '<F1>', '<nop>', {})

-- makes sourcing vimrc easier
create_user_command('S', 'source ~/.config/nvim/init.lua', {})

create_user_command('S4', 'set tabstop=4 shiftwidth=4 softtabstop=4 expandtab', {})
create_user_command('S2', 'set tabstop=2 shiftwidth=2 softtabstop=2 expandtab', {})

-- enable emacs like movement when in command line mode
map('c', '<C-B>', '<left>', {noremap = true})
map('c', '<C-F>', '<right>', {noremap = true})

-- bad habbits
map('', '<up>', '<nop>', {})
map('', '<down>', '<nop>', {})
map('', '<left>', '<nop>', {})
map('', '<right>', '<nop>', {})
map('i', '<up>', '<nop>', {})
map('i', '<down>', '<nop>', {})
map('i', '<left>', '<nop>', {})
map('i', '<right>', '<nop>', {})
map('c', '<up>', '<nop>', {})
map('c', '<down>', '<nop>', {})
map('c', '<left>', '<nop>', {})
map('c', '<right>', '<nop>', {})
map('t', '<up>', '<nop>', {})
map('t', '<down>', '<nop>', {})
map('t', '<left>', '<nop>', {})
map('t', '<right>', '<nop>', {})

exec([[
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]], true)
