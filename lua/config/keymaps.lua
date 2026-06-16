-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>cy", function()
  local line_num = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = line_num })

  if #diagnostics > 0 then
    vim.fn.setreg("+", diagnostics[1].message)
    vim.notify("Diagnostic copied to clipboard!", vim.log.levels.INFO)
  else
    vim.notify("No diagnostic found on this line.", vim.log.levels.WARN)
  end
end, { desc = "Copy diagnostic to clipboard" })
