local config = function()
  require("lspsaga").setup({
    -- Use enter to open file in finder.
    finder = {
      keys = {
        toggle_or_open = "<CR>",
      },
    },
    -- Use enter to open file in definition preview.
    definition = {
      keys = {
        edit = "<CR>",
      },
    },
  })
end

return {
  "glepnir/lspsaga.nvim",
  config = config,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    'nvim-tree/nvim-web-devicons'
  },
}
