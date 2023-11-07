local config = function()
  -- Load LuaSnip this way based on instructions from:
  -- https://github.com/rafamadriz/friendly-snippets#with-lazynvim
  require("luasnip/loaders/from_vscode").lazy_load()
end

return {
  "L3MON4D3/LuaSnip",
  -- Follow major version 2.x (current latest release).
  version = "2.*",
  -- Install jsregexp for variable / placeholder transformations.
  -- Ref: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#transformations
  build = "make install_jsregexp",
  config = config,
  dependencies = {
    -- Provide curated collection of snippets.
    "rafamadriz/friendly-snippets"
  },
}
