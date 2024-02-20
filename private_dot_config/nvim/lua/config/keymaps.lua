-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- It don't work on Mac OS because <C-left> is to switch desktop
-- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

keymap.set("n", "<leader>wk", "<cmd>resize +2<cr>", { noremap = true, silent = true, desc = "Increase window height" })
keymap.set("n", "<leader>wj", "<cmd>resize -2<cr>", { noremap = true, silent = true, desc = "Decrease window height" })
keymap.set(
  "n",
  "<leader>wh",
  "<cmd>vertical resize -2<cr>",
  { noremap = true, silent = true, desc = "Decrease window width" }
)
keymap.set(
  "n",
  "<leader>wl",
  "<cmd>vertical resize +2<cr>",
  { noremap = true, silent = true, desc = "Increase window width" }
)
