local opt = vim.o

-- Misc defaults
opt.wrap = false
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
opt.splitbelow = true
opt.splitright = true
opt.cursorline = true
opt.guicursor = ''

-- Change search behavior/colors
opt.incsearch = true
opt.hlsearch = true
opt.gdefault = true

-- Store swap files outside of code
vim.api.nvim_command("set dir=~/.cache/swp")

-- Don't keep undofiles across reboots
opt.undofile = true
opt.undodir = '/tmp'

-- Mouse settings
opt.mouse = 'a'
opt.mousemodel = 'extend'

-- Add clipboard capabilities if available
if vim.fn.has('unnamedplus') == 1 then
  opt.clipboard = 'unnamed,unnamedplus'
end

-- Add additional paths
opt.path = ',./,/usr/include/'

-- Use prettier display characters
opt.listchars = 'tab:→ '
opt.fillchars = 'vert:│,eob: '
opt.list = true

opt.completeopt = 'longest,menuone'
