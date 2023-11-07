local opts = {
	update_focused_file = {
		-- Follow current buffer, focus on file.
		enable = true,
	},
	view = {
		-- Don't automatically resize all windows when opening a file.
		preserve_window_proportions = true,
		-- Show on right side.
		side = "right",
		-- Make it a bit wider (default = 30).
		width = 40,
	},
}

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	opts = opts,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
