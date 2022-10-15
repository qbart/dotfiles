-- TOC:
-- plugins
-- options
-- setup
-- keys

----
-- plugins
----

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- start secreen
  use { 'mhinz/vim-startify' }

   -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }
  
  -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter' 
  -- Additional textobjects for treesitter
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } 
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'                                                          

  -- auto close brackets
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- commentary
  use { 'numToStr/Comment.nvim' }

  -- git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- show idents
  use "lukas-reineke/indent-blankline.nvim"

  -- theme
  use 'Mofiqul/dracula.nvim'

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end


----
-- options
----
-- See `:help vim.o`
--

-- colors/sytnax
vim.opt.syntax = "ON"     
vim.o.termguicolors = true  
-- colorscheme
vim.api.nvim_command('colorscheme dracula') 

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
vim.g.maplocalleader = ' '


----
-- plugins setup
----

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
  },
}
require("nvim-autopairs").setup {}
require('gitsigns').setup {}

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 
    'c',
    'cpp',
    'go',
    'lua',
    'python',
    'rust',
    'typescript',
    'hcl',
    'ruby',
    'html',
    'java',
    'javascript',
    'bash',
    'glsl',
    'wgsl',
    'make',
    'markdown',
    'toml',
    'json',
    'yaml',
    'dockerfile',
    'elixir',
    'erlang',
    'nix',
    'sql',
    'proto',
  },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

require('Comment').setup {
  toggler = {
    line = '//',
  },
  opleader = {
    line = '/',
  },
}


----
-- keys
----
vim.api.nvim_set_keymap('n', '<leader>j', [[:Telescope find_files<CR>]], {})

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


