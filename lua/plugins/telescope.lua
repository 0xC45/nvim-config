local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          -- Scroll down with Ctrl+j
          ["<C-j>"] = "move_selection_next",
          -- Scroll up with Ctrl+k
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  lazy = false,
  config = config,
  dependencies = {
    -- Plenary is a required dependency.
    -- Ref: https://github.com/nvim-telescope/telescope.nvim#required-dependencies
    "nvim-lua/plenary.nvim"
  },
}
