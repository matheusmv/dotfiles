require('bufferline').setup {
    options = {
        diagnostics = 'nvim_lsp',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'center',
                separator = true
            },
        },
        color_icons = true,
    },
}
