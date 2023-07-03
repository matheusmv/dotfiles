require("matheusmv.util").set_nvim("opt", {
    cursorline = true,
    number = true,
    relativenumber = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    hlsearch = false,
    incsearch = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    updatetime = 50,
    completeopt = { "menu", "preview" },
    cmdheight = 1,
    colorcolumn = "80",
    inccommand = "split",
    ignorecase = true,
    smartcase = true,
    clipboard = "unnamedplus"
}, function(prop, option, value)
    prop[option] = value
end)

vim.opt.isfname:append("@-@")
