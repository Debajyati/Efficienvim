-- Add any additional autocmds here

-- setting colorscheme as default 
vim.cmd [[colorscheme habamax]]

vim.cmd("set number")
vim.cmd("set cursorline")

-- Show neotree on startup
vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
  desc = "Open Neotree automatically",
  group = "neotree",
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd [[Neotree toggle]]
    end
  end,
})
