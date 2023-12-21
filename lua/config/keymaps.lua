-- Add any additional keymaps here

-- setting global mapleader
vim.g.mapleader = " "

-- Don't uncomment the line below if are using Neotree plugin as file explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- telescope keymaps
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = "find files" })
vim.keymap.set('n', '<leader>gf', telescope_builtin.git_files, { desc = "git files" })
vim.keymap.set('n', '<leader>ps', function()
  telescope_builtin.grep_string({ search = vim.fn.input("Grep > ")});
end,
  { desc = "find string" })

-- vim-fugitive keymaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "fugitive" })

-- undotree keymaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle undotree" })

-- vim-tmux-navigator keymaps
vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { desc = "navigate left" })
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, { desc = "navigate down" })
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, { desc = "navigate up" })
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, { desc = "navigate right" })


