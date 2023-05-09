-- Set syntax/indents for non-standard file types
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.pyi', command = 'set syntax=python'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.sk', command = 'set syntax=skull filetype=skull'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.test', command = 'set syntax=mypyc_test_cases filetype=mypyc_test_cases'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.c', command = 'set syntax=c filetype=c'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.h', command = 'set syntax=c filetype=c'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.ll', command = 'set syntax=llvm filetype=llvm'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = 'Dockerfile.*', command = 'set syntax=dockerfile filetype=dockerfile'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.py', command = 'set commentstring=#\\ %s'})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {pattern = '*.v', command = 'set syntax=v filetype=v'})

-- Set preferred indents for built-in file types
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python,java,rust',
  command = 'setlocal ts=4 sw=4 sts=4 expandtab'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown,vue,typescript,html,javascript,css,scss,json,yaml,skull,toml',
  command = 'setlocal ts=2 sw=2 sts=2 expandtab'
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  command = 'setlocal nonumber norelativenumber'
})
