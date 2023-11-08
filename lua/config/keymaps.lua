local map = vim.keymap.set

local default_opts = {
  noremap = true,
  silent = true,
}

-------------
-- Buffers --
-------------
map("n", "<leader>bn", "<cmd>bnext<CR>", default_opts)     -- Next buffer
map("n", "<tab>", "<cmd>bnext<CR>", default_opts)          -- Next buffer
map("n", "<leader>bp", "<cmd>bprevious<CR>", default_opts) -- Prev buffer
map("n", "<S-tab>", "<cmd>bprevious<CR>", default_opts)    -- Prev buffer
map("n", "<leader>bb", "<cmd>e #<CR>", default_opts)       -- Switch to other buffer
map("n", "<leader>q", "<cmd>Bdelete<CR>", default_opts)    -- Delete current buffer

---------------------
-- Panes / Windows --
---------------------
map("n", "<leader>sv", "<cmd>vsplit<CR>", default_opts)       -- Split Vertically
map("n", "<leader>sh", "<cmd>split<CR>", default_opts)        -- Split Horizontally
map("n", "<C-h>", "<C-w>h", default_opts)                     -- Navigate Left
map("n", "<C-j>", "<C-w>j", default_opts)                     -- Navigate Down
map("n", "<C-k>", "<C-w>k", default_opts)                     -- Navigate Up
map("n", "<C-l>", "<C-w>l", default_opts)                     -- Navigate Right
map("t", "<C-h>", "<cmd>wincmd h<CR>", default_opts)          -- Navigate Left
map("t", "<C-j>", "<cmd>wincmd j<CR>", default_opts)          -- Navigate Down
map("t", "<C-k>", "<cmd>wincmd k<CR>", default_opts)          -- Navigate Up
map("t", "<C-l>", "<cmd>wincmd l<CR>", default_opts)          -- Navigate Right
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", default_opts)  -- Navigate Left
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", default_opts)  -- Navigate Down
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", default_opts)    -- Navigate Up
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", default_opts) -- Navigate Right

--------------------
-- Directory Tree --
--------------------
map("n", "<leader>m", "<cmd>NvimTreeFocus<CR>", default_opts)  -- Focus tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", default_opts) -- Toggle tree

--------------
-- Comments --
--------------
map("n", "<C-_>", "gcc", { noremap = false }) -- Comment line
map("v", "<C-_>", "gc", { noremap = false })  -- Comment lines

---------------
-- Indenting --
---------------
map("v", "<", "<gv", {}) -- Shift Indentation to Left
map("v", ">", ">gv", {}) -- Shift Indentation to Right

---------
-- LSP --
---------
map("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", default_opts)                 -- Go to definition
map("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", default_opts)        -- Peak definition
map("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", default_opts)        -- Go to definition
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", default_opts)            -- See available code actions
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", default_opts)                 -- Smart rename
map("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", default_opts)   -- Show  diagnostics for line
map("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", default_opts) -- Show diagnostics for cursor
map("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", default_opts)   -- Prev diagnostic in buffer
map("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", default_opts)   -- Next diagnostic in buffer
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", default_opts)                       -- Show documentation

---------------
-- Telescope --
---------------
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", default_opts)    -- Search keymaps
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", default_opts)  -- Search help tags
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", default_opts) -- Search filenames
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", default_opts)  -- Grep files
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", default_opts)    -- Search buffers

----------
-- Misc --
----------
map("n", "<leader>pa", "<cmd>echo expand('%:p')<CR>", default_opts)           -- Show Full File Path
map("n", "<leader>lm", "<cmd>colorscheme catppuccin-latte<CR>", default_opts) -- Light mode
map("n", "<leader>dm", "<cmd>colorscheme catppuccin-mocha<CR>", default_opts) -- Dark mode
