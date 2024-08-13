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
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			-- separator_style = "slant",
			separator_style = "thick",
		},
	},
}
