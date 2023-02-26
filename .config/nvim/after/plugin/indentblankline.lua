vim.opt.list = true
vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

require('indent_blankline').setup {
    show_trailing_blankline_indent = false,
}
