require("matheusmv.packer")
require("matheusmv.config")
require("matheusmv.remap")

local augroup = vim.api.nvim_create_augroup

local matheusmv_group = augroup("matheusmv", {})
local packer_group = augroup("Packer", { clear = true })
local yank_group = augroup("HighlightYank", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
    group = matheusmv_group,
    pattern = '*',
    command = [[%s/\s\+$//e]],
})

autocmd('BufWritePost', {
    group = packer_group,
    pattern = vim.fn.expand('$MYVIMRC'),
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
