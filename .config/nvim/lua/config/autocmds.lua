-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.keymap.set("i", "<BS>", function()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".")
  if line:sub(1, col - 2):match("^%s*$") then
    return "<C-o>k<C-o>J"
  else
    return "<BS>"
  end
end, { expr = true })
