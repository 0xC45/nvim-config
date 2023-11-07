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
  priority = 1000,
  config = config,
}
