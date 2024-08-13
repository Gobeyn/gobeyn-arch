--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- Author: Aaron Gobeyn
-- Date: August 13th 2024
-- Documentation: https://neovim.io/

-- Show numbers on the side
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs and indentations settings
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.wrap = false

-- Add spell checker
vim.opt.spell = true

-- Change spell highlighting to underline
vim.cmd("hi clear SpellBad")
vim.cmd("hi SpellBad cterm=underline")

-- Use system clipboard as default
vim.opt.clipboard:append("unnamedplus")

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Turn off making .swp files
vim.opt.swapfile = false

-- Remove ~ symbols on the side
vim.opt.fillchars:append({ eob = " " })
