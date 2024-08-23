--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- Author: Aaron Gobeyn
-- Date: August 23th 2024
-- Documentation: https://neovim.io/

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
		heading = {
			enabled = true,
			sign = true,
			position = "overlay",
			icons = { "󰲠 ", "󰲢 ", "󰲤 ", "󰲦 ", "󰲨 ", "󰲪 " },
			signs = { "󰫎 " },
			width = "full",
			left_pad = 0,
			right_pad = 0,
			min_width = 0,
			border = false,
			border_prefix = false,
			above = "▄",
			below = "▀",
			backgrounds = {
				"RenderMarkdownH1Bg",
				"RenderMarkdownH2Bg",
				"RenderMarkdownH3Bg",
				"RenderMarkdownH4Bg",
				"RenderMarkdownH5Bg",
				"RenderMarkdownH6Bg",
			},
			foregrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
			},
		},
		code = {
			enabled = true,
			sign = true,
			style = "full",
			position = "left",
			language_pad = 0,
			disable_background = { "diff" },
			width = "full",
			left_pad = 0,
			right_pad = 0,
			min_width = 0,
			border = "thin",
			above = "▄",
			below = "▀",
			highlight = "RenderMarkdownCode",
			highlight_inline = "RenderMarkdownCodeInline",
		},
		dash = {
			enabled = true,
			icon = "─",
			width = "full",
			highlight = "RenderMarkdownDash",
		},
		bullet = {
			enabled = true,
			icons = { "●", "○", "◆", "◇" },
			left_pad = 0,
			right_pad = 0,
			highlight = "RenderMarkdownBullet",
		},
		checkbox = {
			enabled = true,
			position = "inline",
			unchecked = {
				icon = "󰄱 ",
				highlight = "RenderMarkdownUnchecked",
			},
			checked = {
				icon = "󰱒 ",
				highlight = "RenderMarkdownChecked",
			},
			custom = {
				todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
			},
		},
		quote = {
			enabled = true,
			icon = "▋",
			repeat_linebreak = false,
			highlight = "RenderMarkdownQuote",
		},
		pipe_table = {
			enabled = true,
			preset = "none",
			style = "full",
			cell = "padded",
			alignment_indicator = "━",
			border = {
				"┌",
				"┬",
				"┐",
				"├",
				"┼",
				"┤",
				"└",
				"┴",
				"┘",
				"│",
				"─",
			},
			head = "RenderMarkdownTableHead",
			row = "RenderMarkdownTableRow",
			filler = "RenderMarkdownTableFill",
		},
	},
}
