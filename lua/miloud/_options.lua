local options = {
    scrolloff = 10,
    number = true,
    relativenumber = true,
    expandtab = true,
    smartindent = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    background = 'dark',
    termguicolors = true,
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    timeoutlen = 1000,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    cursorline = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    sidescrolloff = 8,
    guifont = "monospace:h17",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.neoformat_try_node_exe = 1

--colorsceme
vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd "colorscheme tokyonight-moon"
