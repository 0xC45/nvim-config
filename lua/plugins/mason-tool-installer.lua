local opts = {
  -- Ensure these Mason packages are installed.
  ensure_installed = {
    -- Go
    "gopls",
    "golangci-lint",
    "gofumpt",
    -- Lua
    "lua-language-server",
    "luacheck",
    "stylua",
    -- Python
    "pyright",
    "flake8",
    "black",
    -- General
    "efm",
  },
}

return {
  "WhoIsSethDaniel/mason-tool-installer",
  cmd = {
    "MasonToolsInstall",
    "MasonToolsUpdate",
    "MasonToolsClean",
  },
  opts = opts,
}
