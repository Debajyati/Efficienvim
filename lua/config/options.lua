-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here

vim.opt.background = "dark"

-- If you are using a transparent terminal and want Neovim to be transparent also,
-- then Uncomment the 2 lines below.
-- vim.api.nvim_set_hl(0, "Normal", { bg="none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.wrap = false

vim.opt.undofile = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.cmd("filetype plugin indent on")

-- Uncomment the below lines to copy text always with clipboard only.
-- in the 2nd line below xclip is used as default. If you use any other
-- clipboard manager, then you have change the lines accordingly.
-- With these lines you can efficiently copy texts selected in 
-- VISUAL mode to clipboard with Ctrl+C & you won't need registers.

-- vim.opt.clipboard:append("unnamedplus")
-- vim.api.nvim_set_keymap("v", "<C-c>", ":w !xclip -i -sel c<CR><CR>", { noremap = true })

