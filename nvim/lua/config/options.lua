vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set copilot to manual trigger
vim.g.copilot_no_tab_map = true

-- colors/sytnax
vim.o.syntax = "ON"
vim.o.termguicolors = true
vim.o.background="dark"

-- share clipboard
vim.o.clipboard = 'unnamedplus'


-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = [[ ]]


vim.o.compatible = false -- forget about vi compatibility
-- vim.o.number = false -- no line nums on init
vim.opt.foldenable = false
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.langmenu = 'en_US.utf-8'
vim.o.sidescroll = 1
vim.o.sidescrolloff = 1
vim.o.scrolloff = 9
vim.o.ttyfast = true
vim.o.cursorline = true -- highliht current line
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.history = 10000
vim.o.undolevels = 2000
vim.o.wildignore = '+*.o,*.obj,*.bak,*.exe,*.pyc,*.class,**/node_modules/**'
vim.o.wrap = false
vim.o.textwidth = 0 -- no wordwrap
vim.o.wrapmargin = 0
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.visualbell = false
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.hidden = true -- https://medium.com/usevim/vim-101-set-hidden-f78800142855
vim.o.backup = false
vim.o.writebackup = false
vim.o.cmdheight = 1
-- vim.o.autoindent = true
vim.o.shortmess = "Ot" -- http://vimdoc.sourceforge.net/htmldoc/options.html#'shortmess'
