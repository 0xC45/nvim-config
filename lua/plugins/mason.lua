local opts = {
  -- Use nerd font icons.
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

return {
  "williamboman/mason.nvim",
  opts = opts,
}
