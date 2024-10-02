-- TODO:  
-- If you are using a transparent terminal and want Neovim to be transparent also,
-- then Uncomment the commented block of code (--[[]]) below

-- set transparent background for floating and normal windows by default

--[[ vim.api.nvim_create_augroup("colortheme", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group    = "colortheme",
  pattern  = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
    vim.api.nvim_set_hl(0, "Normal", { bg="none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })
  end
}) ]]

-- Add any custom autocommands here below
