local opts = {
	scope = {
		-- Remove annoying highlighting for current scope.
		enabled = false,
	},
}

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	lazy = false,
	opts = opts,
}
