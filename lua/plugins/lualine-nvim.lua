local config = function()
  local theme = require("lualine.themes.catppuccin")

  require("lualine").setup({
    options = {
      -- Use catppuccin theme (to match colorscheme).
      theme = theme,
      -- Use a single (global) statusline for every window.
      globalstatus = true,
    },
    -- Show only buffers on left side.
    -- Minimize output, do not show 'encoding', 'fileformat', or 'filetype'.
    sections = {
      lualine_a = { "buffers" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "progress" },
      lualine_y = { "location" },
      lualine_z = { "mode" },
    },
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
