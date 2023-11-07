local config = function()
  local lspconfig = require("lspconfig")

  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  local diagnostic_signs = { Error = " ", Warn = " ", Hint = "󰐗 ", Info = " " }
  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local on_attach = function(client, bufnr)
    -- Enable automatic formatting on save.
    require("lsp-format").on_attach(client, bufnr)

    -- Add LSP key mappings.
    local mapkey = require("util.keymapper").mapkey
    local opts = { noremap = true, silent = true, buffer = bufnr }
    mapkey("<leader>fd", "Lspsaga finder", "n", opts)                 -- go to definition
    mapkey("<leader>gd", "Lspsaga peek_definition", "n", opts)        -- peak definition
    mapkey("<leader>gD", "Lspsaga goto_definition", "n", opts)        -- go to definition
    mapkey("<leader>ca", "Lspsaga code_action", "n", opts)            -- see available code actions
    mapkey("<leader>rn", "Lspsaga rename", "n", opts)                 -- smart rename
    mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts)   -- show  diagnostics for line
    mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
    mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts)   -- jump to prev diagnostic in buffer
    mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts)   -- jump to next diagnostic in buffer
    mapkey("K", "Lspsaga hover_doc", "n", opts)                       -- show documentation for what is under cursor
  end

  -- Configure Go.
  local golangci_lint = require("efmls-configs.linters.golangci_lint")
  local gofumpt = require("efmls-configs.formatters.gofumpt")
  lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      gopls = {
        -- Use gofumpt for formatting.
        gofumpt = true,
      },
    },
  })

  -- Configure Lua.
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          -- Make lua_ls recognize "vim" as a global.
          globals = { "vim" },
        },
        workspace = {
          -- Make lua_ls aware of neovim runtime files.
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })

  -- Configure Python.
  local flake8 = require("efmls-configs.linters.flake8")
  local black = require("efmls-configs.formatters.black")
  lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- Configure efm server.
  lspconfig.efm.setup({
    filetypes = {
      "go",
      "lua",
      "python",
    },
    settings = {
      languages = {
        go = { golangci_lint, gofumpt },
        lua = { luacheck, stylua },
        python = { flake8, black },
      },
    },
  })
end

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = config,
  dependencies = {
    -- Load neoconf before setting up nvim-lspconfig.
    -- Ref: https://github.com/folke/neoconf.nvim#-setup
    "folke/neoconf.nvim",
    -- Load mason and then mason-lspconfig before starting LSP servers.
    -- Ref: https://github.com/williamboman/mason-lspconfig.nvim#setup
    "williamboman/mason-lspconfig.nvim",
    -- Provide LSP servers with knowledge of nvim-cmp completion capabilities.
    "hrsh7th/cmp-nvim-lsp",
    -- Provide UI for LSP interactions.
    "glepnir/lspsaga.nvim",
    -- Automatically format buffers on save.
    "lukas-reineke/lsp-format.nvim",
    -- Provide reasonable default configurations for linters and formatters.
    "creativenull/efmls-configs-nvim",
  },
}
