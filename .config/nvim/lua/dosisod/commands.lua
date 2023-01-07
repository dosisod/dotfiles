-- Makes using Plug easier
vim.api.nvim_create_user_command('PI', 'PlugInstall', {})
vim.api.nvim_create_user_command('PC', 'PlugClean', {})
vim.api.nvim_create_user_command('PU', 'PlugUpdate', {})

-- Opens nvimrc/bashrc from inside vim
vim.api.nvim_create_user_command('V', 'e ~/.config/nvim/init.lua', {})
vim.api.nvim_create_user_command('B', 'e ~/.bashrc', {})

-- For quiting easier
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})

-- For sourcing vimrc easier
vim.api.nvim_create_user_command('S', 'source ~/.config/nvim/init.lua', {})

-- Changes tabsize for current buffer
vim.api.nvim_create_user_command('S4', 'set tabstop=4 shiftwidth=4 softtabstop=4 expandtab', {})
vim.api.nvim_create_user_command('S2', 'set tabstop=2 shiftwidth=2 softtabstop=2 expandtab', {})
