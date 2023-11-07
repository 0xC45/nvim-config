local config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  require("luasnip/loaders/from_vscode").lazy_load()

  cmp.setup({
    -- Use luasnip for snippets.
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    -- Configure keyboard mappings.
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-a>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(),    -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    -- Specify completion sources.
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
    -- Configure completion window formatting.
    formatting = {
      -- Use lspkind to provide icons for completions.
      format = lspkind.cmp_format({
        -- Show symbols and text.
        mode = "symbol_text",
        -- Set max window width to 50, truncate with ...
        maxwidth = 50,
        ellipsis_char = "...",
        -- Show completion sources.
        menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          luasnip = "[LuaSnip]",
          buffer = "[Buffer]",
          path = "[Path]",
        })
      }),
    },
  })
end

return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  config = config,
  dependencies = {
    -- Provide "nvim_lsp" source for LSP completions.
    "hrsh7th/cmp-nvim-lsp",
    -- Provide "nvim_lua" source for neovim lua api completions.
    "hrsh7th/cmp-nvim-lua",
    -- Provide "luasnip" source for snippet completions.
    {
      "L3MON4D3/LuaSnip",
      version = "2.*",
      build = "make install_jsregexp",
    },
    -- Provide "buffer" source for in-buffer completions.
    "hrsh7th/cmp-buffer",
    -- Provide "path" source for filesystem path completions.
    "hrsh7th/cmp-path",
    -- Provide icons for completion list entries.
    "onsails/lspkind.nvim",
  },
}
