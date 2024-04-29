-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- bootstrap lazy.nvim, and your plugins
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.lspsettings")
require("config.autocmds")
require("config.noicesettings")
require("config.terminal")

-- Uncomment the next line to set the autocompletion of Codeium AI as default
-- vim.g.codeium_manual = true

-- To enable automatic triggering of codeium whenever you need (for a particular session) by running the command below
-- Don't uncomment it. Just remember it. 
-- let g:codeium_manual = v:false

-- To disable automatic triggering of codeium whenever you need (for a particular session) by running the command below
-- Don't uncomment it. Just remember it. 
-- let g:codeium_manual = v:true

-- If you are using a transparent terminal and want Neovim to be transparent also,
-- then Uncomment the 2 lines below.
-- vim.api.nvim_set_hl(0, "Normal", { bg="none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })
