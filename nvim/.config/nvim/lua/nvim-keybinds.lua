--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- Author: Aaron Gobeyn
-- Date: August 13th 2024
-- Documentation: https://neovim.io/

-- Change leader key to space instead of backslash
vim.g.mapleader = " "

-- Clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Increment and decrement number by one
vim.keymap.set("n", "<leader>+", "<C-a>") -- Increment
vim.keymap.set("n", "<leader>-", "<C-x>") -- Decrement

-- Splitting windows
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- Split vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- Split horizontally
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- Split close
vim.keymap.set("n", "<leader>sc", "<C-w>w") -- Split change

-- Handling window tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- Tab open
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- Tab close
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- Tab next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- Tab previous

-- Opening terminal in a new window and enter insert mode
vim.keymap.set("n", "<leader>qq", "<cmd>tab term<CR>i")
