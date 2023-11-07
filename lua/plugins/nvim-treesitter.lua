local config = function()
	require("nvim-treesitter.configs").setup({
		-- Add treesitter support for these languages.
		ensure_installed = {
			"bash",
			"css",
			"dockerfile",
			"go",
			"html",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"yaml",
		},
		-- Do not automatically try to install
		-- parsers for unknown languages.
		auto_install = false,
		-- Add syntax hilighting support.
		highlight = {
			enable = true,
		},
		-- Add AST-based selection support.
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "vin",
				node_incremental = "vii",
				scope_incremental = "via",
				node_decremental = "vid",
			},
		},
    -- Add indentation support.
		indent = {
			enable = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
