--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- Author: Aaron Gobeyn
-- Date: August 13th 2024
-- Documentation: https://neovim.io/
return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme rose-pine-moon")
		-- vim.cmd("colorscheme rose-pine-dawn")
	end,
}
