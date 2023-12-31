local opt = vim.opt

------------------------
-- Tabs / Indentation --
------------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

------------
-- Search --
------------
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

----------------
-- Appearance --
----------------
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10

--------------
-- Behavior --
--------------
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.completeopt = "menu,menuone,noinsert"
