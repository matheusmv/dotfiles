require('go').setup()

local augroup = vim.api.nvim_create_augroup

local go_group = augroup('GoFormat', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
    group = go_group,
    pattern = '*.go',
    callback = function()
        require('go.format').goimport()
    end
})
