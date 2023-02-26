require('nvim-tree').setup {
    view = {
        number = true,
        relativenumber = true,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    diagnostics = {
        enable = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}

vim.keymap.set('n', '<leader>d', ':NvimTreeToggle<CR>')
