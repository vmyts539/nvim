-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
map("n", "<C-S-Up>", "<cmd>resize -2<cr>", { desc = "Increase Window Height" })
map("n", "<C-S-Down>", "<cmd>resize +2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-S-Left>", "<cmd>vertical resize +2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-S-Right>", "<cmd>vertical resize -2<cr>", { desc = "Increase Window Width" })
