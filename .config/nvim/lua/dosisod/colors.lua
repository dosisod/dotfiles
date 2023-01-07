-- Setup colors and colorscheme
vim.opt.syntax = 'on'
vim.opt.background = 'dark'
vim.api.nvim_command('colorscheme gruvbox')

-- Minor tweaks for highlights
vim.api.nvim_exec([[
hi GruvBoxRedSign guifg=#fb4934 guibg=bg
hi GruvBoxAquaSign guifg=#8ec07c guibg=bg
hi GruvBoxGreenSign guifg=#b8bb26 guibg=bg
hi SignColumn guibg=bg
hi CursorLineNr guibg=bg
hi Operator ctermfg=223 guifg=#ebdbb2
]], true)

-- Enable 24bit color
vim.opt.tgc = true

-- Setup "colorizer" package, must be done after setting 24bit color
require('colorizer').setup()

-- Highlight whitespace
vim.api.nvim_command('hi NoWhitespace term=standout cterm=standout ctermfg=196 ctermbg=234')
vim.api.nvim_command('hi SpecialKey term=bold ctermfg=237')
vim.api.nvim_command("match noWhitespace '\\s\\+$'")
