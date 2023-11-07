local config = function()
  require("catppuccin").setup({
    -- flavour = "latte",
    flavour = "mocha",
    dim_inactive = {
      -- Dim inactive windows.
      enabled = true,
    },
  })
  vim.cmd.colorscheme("catppuccin")
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  -- According to https://github.com/folke/lazy.nvim, it is
  -- recommended to set a high priority for colorschemes.
  priority = 1000,
  config = config,
}
