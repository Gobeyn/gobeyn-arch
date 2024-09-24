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

-- Greek letters
vim.keymap.set("i", "<C-g>a", "𝛼", { buffer = 0 })
vim.keymap.set("i", "<C-g>b", "𝛽", { buffer = 0 })
vim.keymap.set("i", "<C-g>c", "𝜒", { buffer = 0 })
vim.keymap.set("i", "<C-g>d", "𝛿", { buffer = 0 })
vim.keymap.set("i", "<C-g>D", "𝚫", { buffer = 0 })
vim.keymap.set("i", "<C-g>e", "𝜀", { buffer = 0 })
vim.keymap.set("i", "<C-g>1", "𝜂", { buffer = 0 })
vim.keymap.set("i", "<C-g>g", "𝛾", { buffer = 0 })
vim.keymap.set("i", "<C-g>G", "𝚪", { buffer = 0 })
vim.keymap.set("i", "<C-g>i", "𝜄", { buffer = 0 })
vim.keymap.set("i", "<C-g>k", "𝜅", { buffer = 0 })
vim.keymap.set("i", "<C-g>l", "𝜆", { buffer = 0 })
vim.keymap.set("i", "<C-g>L", "𝛬", { buffer = 0 })
vim.keymap.set("i", "<C-g>m", "𝜇", { buffer = 0 })
vim.keymap.set("i", "<C-g>n", "𝜈", { buffer = 0 })
vim.keymap.set("i", "<C-g>o", "𝜔", { buffer = 0 })
vim.keymap.set("i", "<C-g>O", "𝛀", { buffer = 0 })
vim.keymap.set("i", "<C-g>f", "𝜑", { buffer = 0 })
vim.keymap.set("i", "<C-g>F", "𝚽", { buffer = 0 })
vim.keymap.set("i", "<C-g>p", "𝜓", { buffer = 0 })
vim.keymap.set("i", "<C-g>P", "𝚿", { buffer = 0 })
vim.keymap.set("i", "<C-g>3", "𝜋", { buffer = 0 })
vim.keymap.set("i", "<C-g>#", "𝚷", { buffer = 0 })
vim.keymap.set("i", "<C-g>r", "𝜌", { buffer = 0 })
vim.keymap.set("i", "<C-g>s", "𝛔", { buffer = 0 })
vim.keymap.set("i", "<C-g>S", "𝚺", { buffer = 0 })
vim.keymap.set("i", "<C-g>2", "𝜏", { buffer = 0 })
vim.keymap.set("i", "<C-g>t", "𝜃", { buffer = 0 })
vim.keymap.set("i", "<C-g>T", "𝚯", { buffer = 0 })
vim.keymap.set("i", "<C-g>u", "𝜐", { buffer = 0 })
vim.keymap.set("i", "<C-g>U", "𝚼", { buffer = 0 })
vim.keymap.set("i", "<C-g>x", "𝝃", { buffer = 0 })
vim.keymap.set("i", "<C-g>X", "𝚵", { buffer = 0 })
vim.keymap.set("i", "<C-g>z", "𝛇", { buffer = 0 })
