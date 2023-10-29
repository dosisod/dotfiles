-- General/misc
require("dosisod.plug")
require("dosisod.mappings")
require("dosisod.commands")
require("dosisod.colors")
require("dosisod.autocommands")
require("dosisod.sets")
require("dosisod.phone")

-- Tree Sitter
require("dosisod.treesitter")
require("dosisod.cicada")

-- detect filetype
vim.filetype.add({extension = {ua = "uiua" }})

-- format on save
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*.ua',
    callback = function(_)
        vim.cmd(([[
            silent! !uiua fmt %s
        ]]):format(vim.fn.expand('<amatch>')))
    end,
})

-- activate lsp server (this can go in ftplugin so it only happens on these files)
vim.lsp.start({
  cmd = { "uiua", "lsp" }
})
