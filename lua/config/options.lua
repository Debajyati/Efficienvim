-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here

vim.opt.background = "dark"

-- If you are using a transparent terminal and want Neovim to be transparent also,
-- then Uncomment the 2 lines below.
-- vim.api.nvim_set_hl(0, "Normal", { bg="none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })


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

-- Always send text selected in VISUAL Mode either
-- deleted or copied with registers to clipboard.
vim.opt.clipboard:append("unnamedplus") -- Kind of failsafe and also convenient!!

-- Although the above command should be more than enough but if & only if 
-- the above command doesn't work well and you want a custom keybinding,
-- READ!! the next 5 lines and uncomment the commented vim option code.
-- xclip is used as default. If you use any other clipboard manager,  
-- then you have to change the command accordingly.
-- In windows the clipboard input tool is Set-Clipboard.
-- With this line you can efficiently send copied texts selected in 
-- VISUAL mode to clipboard with your custom keybinding `Ctrl+C`.

-- vim.api.nvim_set_keymap("v", "<C-c>", ":w !xclip -i -sel c<CR><CR>", { noremap = true })


vim.cmd("set number")
vim.cmd("set cursorline")

