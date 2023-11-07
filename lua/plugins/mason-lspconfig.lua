local opts = {
  -- Add LSP support for these languages.
  ensure_installed = {
    "efm",
    "gopls",
    "lua_ls",
  },
  -- Automatically install LSP servers.
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  dependencies = {
    "williamboman/mason.nvim"
  },
}
