local opts = {
  scope = {
    -- Remove highlighting for current scope.
    enabled = false,
  },
}

return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = false,
  -- Lazy cannot automatically determine the main module for this plugin
  -- (based on its name), so it needs to be specified manually.
  main = "ibl",
  opts = opts,
}
