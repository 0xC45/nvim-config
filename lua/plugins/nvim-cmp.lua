local config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  cmp.setup({
    -- Use luasnip for snippets.
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    -- Configure keyboard mappings.
    mapping = cmp.mapping.preset.insert({
      ["<C-a>"] = cmp.mapping.complete(),                 -- show completions
      ["<C-e>"] = cmp.mapping.abort(),                    -- close completions
      ["<C-p>"] = cmp.mapping.select_prev_item(),         -- previous suggestion
      ["<C-n>"] = cmp.mapping.select_next_item(),         -- next suggestion
      ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),            -- scroll up docs
      ["<C-f>"] = cmp.mapping.scroll_docs(4),             -- scroll down docs
    }),
    -- Specify completion sources.
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer",  keyword_length = 4 },
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
          nvim_lsp = "[lsp]",
          nvim_lua = "[lua]",
          luasnip = "[snip]",
          buffer = "[buf]",
          path = "[file]",
        })
      }),
    },
    -- Configure completion behavior to be same as vim.
    completion = {
      completeopt = table.concat(vim.opt.completeopt:get(), ","),
    },
    -- Disable LSP-suggested "pre-select" of completion options.
    -- I prefer to either manually select an option or just use the first option.
    preselect = cmp.PreselectMode.None,
  })

  -- Setup "/" cmdline completions.
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Setup ":" cmdline completions.
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
  })
end

return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  config = config,
  dependencies = {
    -- Use LuaSnip snippet engine.
    "L3MON4D3/LuaSnip",
    -- Provide icons for completion list entries.
    "onsails/lspkind.nvim",
    -- Provide "nvim_lsp" source for LSP completions.
    "hrsh7th/cmp-nvim-lsp",
    -- Provide "nvim_lua" source for neovim lua api completions.
    "hrsh7th/cmp-nvim-lua",
    -- Provide "luasnip" source for snippet completions.
    "saadparwaiz1/cmp_luasnip",
    -- Provide "buffer" source for in-buffer completions.
    "hrsh7th/cmp-buffer",
    -- Provide "path" source for filesystem path completions.
    "hrsh7th/cmp-path",
    -- Provide completions for command mode ("/" and ":")
    "hrsh7th/cmp-cmdline"
  },
}
