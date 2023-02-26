vim.g.mapleader = " "

local toggle_relativenumber = function()
    vim.o.relativenumber = not vim.o.relativenumber
end

require("matheusmv.util").set_nvim("keymap", {
    { { 'n', 'v' },      '<Space>',   '<Nop>',                     { silent = true } },
    { 'i',               '<C-c>',     '<Esc>' },
    { 'n',               '<leader>w', ':w<CR>' },
    { { 'n', 'v', 'i' }, '<A-,>',     ':bp<CR>' },
    { { 'n', 'v', 'i' }, '<A-.>',     ':bn<CR>' },
    { { 'n', 'v', 'i' }, '<A-c>',     ':bd<CR>' },
    { 'n',               '<leader>F', vim.lsp.buf.format },
    { 'n',               '<leader>r', toggle_relativenumber },
    { 'n',               'k',         "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
    { 'n',               'j',         "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },
    { 'n',               '[d',        vim.diagnostic.goto_prev },
    { 'n',               ']d',        vim.diagnostic.goto_next },
    { 'n',               '<leader>e', vim.diagnostic.open_float },
    { 'n',               '<leader>q', vim.diagnostic.setloclist },
}, function(prop, _, value)
    prop.set(value[1], value[2], value[3], value[4])
end)
