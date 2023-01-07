-- Git related
vim.api.nvim_set_keymap('n', '<leader>j', ':GitGutterNextHunk<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>k', ':GitGutterPrevHunk<CR>', {})

-- FZF related
vim.api.nvim_set_keymap('n', '<SPACE>', ':GFiles<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-SPACE>', ':FZF<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-x><C-l>', '<plug>(fzf-complete-line)', {})
vim.api.nvim_set_keymap('i', '<C-x><C-p>', '<plug>(fzf-complete-path)', {})

-- CoC related
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true})
vim.api.nvim_set_keymap('n', 'K', ':call ShowDocumentation()<CR>', {noremap = true, silent = true})
vim.api.nvim_exec([[
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

-- ALT+UP and ALT+DOWN to switch up and down buffers
vim.api.nvim_set_keymap('', '<M-UP>', ':bp<CR>', {silent = true})
vim.api.nvim_set_keymap('!', '<M-UP>', '<ESC>:bp<CR>a', {silent = true})
vim.api.nvim_set_keymap('', '<M-DOWN>', ':bn<CR>', {silent = true})
vim.api.nvim_set_keymap('!', '<M-DOWN>', '<ESC>:bn<CR>a', {silent = true})

-- Auto bracket/block creation
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR><TAB><END><CR><BS>}<ESC>kI', {noremap = true})
vim.api.nvim_set_keymap('i', '(<CR>', '(<CR><TAB><END><CR><BS>)<ESC>kI', {noremap = true})

-- Autocomplete related
vim.api.nvim_set_keymap('i', '<Tab>', [[coc#pum#visible() ? coc#pum#confirm() : "<Tab>"]], {expr = true, noremap = true})
vim.api.nvim_exec([[
inoremap <silent><expr> <C-N>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<C-N>" :
  \ coc#refresh()
]], true)
vim.api.nvim_set_keymap('', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', {silent = true})
vim.api.nvim_set_keymap('', '<leader>n', [[:let @/ = ""<CR>]], {silent = true})

-- Makes switching between buffers easier
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W>h', {noremap = true})

vim.api.nvim_set_keymap('t', '<C-J>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-K>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-L>', '<C-W>l', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-H>', '<C-W>h', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-S-LEFT>', '<C-W><', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-S-RIGHT>', '<C-W>>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-S-UP>', '<C-W>+', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-S-DOWN>', '<C-W>-', {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<F1>', '<nop>', {})
vim.api.nvim_set_keymap('n', '<F1>', '<nop>', {})

-- Enable emacs like movement when in command line mode
vim.api.nvim_set_keymap('c', '<C-B>', '<left>', {noremap = true})
vim.api.nvim_set_keymap('c', '<C-F>', '<right>', {noremap = true})

-- Bad habbits
vim.api.nvim_set_keymap('', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('', '<right>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<right>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<right>', '<nop>', {})
vim.api.nvim_set_keymap('t', '<up>', '<nop>', {})
vim.api.nvim_set_keymap('t', '<down>', '<nop>', {})
vim.api.nvim_set_keymap('t', '<left>', '<nop>', {})
vim.api.nvim_set_keymap('t', '<right>', '<nop>', {})
