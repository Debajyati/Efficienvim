-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here

vim.opt.background = "dark"
-- vim.api.nvim_set_hl(0, "Normal", { bg="none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })


vim.opt.guicursor = ""
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.wrap = false

vim.opt.undofile = true
-- vim.opt.undodir = 


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.cmd("filetype plugin indent on")
