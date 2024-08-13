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
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local colors = require("nvim-highlight-colors")
		colors.setup({
			render = "virtual",
			virtual_symbol = "■",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = " ",
			virtual_symbol_position = "inline",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = false,
		})
	end,
}
