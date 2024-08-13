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
	-- Add keywords: PERF, HACK, TODO, NOTE, FIX, WARNING and a colon in a comment
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")
		vim.keymap.set("n", "<leader>cn", function()
			todo_comments.jump_next()
		end, {}) -- Comment next
		vim.keymap.set("n", "<leader>cp", function()
			todo_comments.jump_prev()
		end, {}) -- Comment previous
		todo_comments.setup()
	end,
}
