local config = function()
  require("lspsaga").setup({
    finder = {
      keys = {
        -- Use enter to open file in finder.
        toggle_or_open = "<CR>",
      },
    },
    definition = {
      keys = {
        -- Use enter to open file in definition preview.
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
