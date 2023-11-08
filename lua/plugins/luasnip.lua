local config = function()
  -- Load LuaSnip this way based on instructions from:
  -- https://github.com/L3MON4D3/LuaSnip#add-snippets
  require("luasnip/loaders/from_vscode").lazy_load()

  -- Configure key mappings.
  local luasnip = require("luasnip")
  vim.keymap.set({ "i" }, "<C-K>", function() luasnip.expand() end, { silent = true })      -- Expand snippet
  vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })  -- Jump next
  vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true }) -- Jump prev
  vim.keymap.set({ "i", "s" }, "<C-E>", function()                                          -- Select next choice
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end, { silent = true })
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
