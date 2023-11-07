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
    -- Load mason before mason-lspconfig.
    -- Ref: https://github.com/williamboman/mason-lspconfig.nvim#setup
    "williamboman/mason.nvim"
  },
}
