vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- editorconfig
    use "gpanders/editorconfig.nvim"

    -- whitespace trim
    use 'cappyzawa/trim.nvim'

    -- shortcuts
    use { "folke/which-key.nvim" }

    -- go to line
    use 'nacro90/numb.nvim'

    -- minimap
    use { 'gorbit99/codewindow.nvim' }

    -- sqlite for storage
    use { "kkharji/sqlite.lua" }

    -- switch cwd based on patterns
    use { "ahmedkhalf/project.nvim" }

    -- Fuzzy Finder (files, lsp, etc)
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { "otavioschwanck/telescope-alternate" },
            { "ANGkeith/telescope-terraform-doc.nvim" },
        },
    }

    -- region selection with hop
    use { "mfussenegger/nvim-treehopper", requires = { { 'phaazon/hop.nvim' } } }

    -- nvim api
    use "folke/neodev.nvim"

    -- file/buffer/... fuzzy finder
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- clipboard manager
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'ibhagwan/fzf-lua' },
        },
    }

    -- lint
    use 'mfussenegger/nvim-lint'

    -- emoji
    use { 'xiyaowong/telescope-emoji.nvim', requires = { 'nvim-telescope/telescope.nvim' } }

    -- Additional textobjects for treesitter
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    -- lsp status
    use { 'nvim-lua/lsp-status.nvim' }
    -- display arguments names while typing
    use { 'ray-x/lsp_signature.nvim' }
    -- lsp icons
    use { 'onsails/lspkind-nvim' }
    -- Manage external editor tooling i.e LSP servers
    use 'williamboman/mason.nvim'
    -- Automatically install language servers to stdpath
    use 'williamboman/mason-lspconfig.nvim'
    -- symbols tree
    use { 'stevearc/aerial.nvim' }

    -- ts
    use { 'jose-elias-alvarez/typescript.nvim' }

    -- json schemas for various configs
    use { 'b0o/schemastore.nvim' }

    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    use { 'jose-elias-alvarez/null-ls.nvim' }

    -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    -- quickfix code actions
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }

    -- code action light bulb
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
    }

    -- structural replace
    use { "cshuaimin/ssr.nvim" }

    -- unused words
    use {
        "narutoxy/dim.lua",
        requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        config = function()
            require('dim').setup({})
        end
    }

    -- lsp integration utils (better go to def etc)
    use { 'RishabhRD/nvim-lsputils',
        requires = {
            'RishabhRD/popfix',
            'nvim-lua/plenary.nvim'
        },
    }

    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            { "hrsh7th/cmp-nvim-lua", ft = 'lua' }, -- nvim-cmp source for nvim lua
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "lukas-reineke/cmp-rg",
        }
    }

    -- lsp ui
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
    })

    -- git visualizer and merge tool
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- git in editor
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- run tests from editor
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    }

    -- pick window by char
    use {
        's1n7ax/nvim-window-picker',
        tag = 'v1.*',
    }

    --https://github.com/akinsho/bufferline.nvim

    -- syntax
    use { 'nvim-treesitter/nvim-treesitter',
        requires = {
            { 'nvim-treesitter/playground' },
            { 'p00f/nvim-ts-rainbow' },
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
        },
        run = ':TSUpdate',
    }
    -- sticky context
    use 'nvim-treesitter/nvim-treesitter-context'

    -- highlight arguments definitaions and usages
    use { 'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' },
    }

    -- convert between oneliner/multiline statement split/join
    use { 'AndrewRadev/splitjoin.vim' }

    --  FIX: hard to configure
    -- join/split
    -- use "AckslD/nvim-trevJ.lua"

    -- auto tag closing and changing matching tag
    use { 'windwp/nvim-ts-autotag' }

    -- snippets
    use({ "L3MON4D3/LuaSnip", tag = "v*", requires = {
        { 'saadparwaiz1/cmp_luasnip' },
        { "rafamadriz/friendly-snippets" },
    } })

    -- easymoition like navigation
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
    }
    -- switch tags, values, hash style etc.
    use { 'andrewradev/switch.vim' }

    -- align text, ascii tables
    use { 'godlygeek/tabular' }

    -- highlight current word
    use { 'RRethy/vim-illuminate' }

    -- fancy notifications
    use({
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require("noice").setup({
                views = {
                    cmdline_popup = {
                        border = {
                            padding = { 1, 2 },
                        },
                        filter_options = {},
                        win_options = {
                            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                        },
                    },
                },
                messages = {
                    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                    -- This is a current Neovim limitation.
                    enabled = true, -- enables the Noice messages UI
                    view = "mini", -- default view for messages
                    view_error = "mini", -- view for errors
                    view_warn = "mini", -- view for warnings
                    view_history = "split", -- view for :messages
                    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
                },
                routes = {
                    {
                        filter = { event = "msg_show", kind = "", find = " lines --" },
                        opts = { skip = true },
                    },
                    {
                        filter = { event = "msg_show", kind = "", find = " line --" },
                        opts = { skip = true },
                    },
                    {
                        filter = { event = "msg_show", kind = "", find = "Already at oldest change" },
                        opts = { skip = true },
                    },
                    {
                        filter = { event = "msg_show", kind = "", find = "--No lines in" },
                        opts = { skip = true },
                    },
                },
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
        }
    })

    -- better virtualtext diagnostic, rendered as a tree
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    })

    -- show closing context as virtualtext
    use "haringsrob/nvim_context_vt"

    -- color picker and colorizer
    use "uga-rosa/ccc.nvim"

    -- file manager
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- scrollbar
    use("petertriho/nvim-scrollbar")

    -- highlight todo/hack/note/perf/warn/fix comments
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }


    -- is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
    -- ys{motion}{char}, ds{char}, and cs{target}{replacement}
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- case converison, cru, ...
    use { 'tpope/vim-abolish' }

    -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-sleuth'

    -- fuzzy finder
    use { 'junegunn/fzf',
        dir = '~/.fzf',
        run = './install -- all',
    }

    -- better f
    use { 'rhysd/clever-f.vim' }

    -- auto close brackets
    use { "windwp/nvim-autopairs" }

    -- better file types
    use { 'nathom/filetype.nvim' }

    -- commentary
    use { 'numToStr/Comment.nvim' }

    -- git signs
    use { 'lewis6991/gitsigns.nvim' }

    -- multi cursor
    use { 'mg979/vim-visual-multi' }

    -- statusline
    use 'feline-nvim/feline.nvim'

    -- show idents
    use "lukas-reineke/indent-blankline.nvim"

    -- visual debugger
    use { "rcarriga/nvim-dap-ui", requires = {
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
    } }

    -- golang support
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommanded if need floating window support

    -- more than just a sort
    use { 'inkarkat/vim-AdvancedSorters' }

    -- theme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
    }


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

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

----
-- options
----
-- See `:help vim.o`
--

-- colors/sytnax
vim.o.syntax = "ON"
vim.o.termguicolors = true

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

----
-- keys
----
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

-- finders
--
vim.api.nvim_set_keymap('n', '<leader>j', [[:lua require('fzf-lua').files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>F', [[:lua require('fzf-lua').live_grep_native()<CR>]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', [[:lua require('fzf-lua').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', [[:lua require('fzf-lua').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', [[:lua require('fzf-lua').blines()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', [[:lua require('fzf-lua').lsp_live_workspace_symbols()<CR>]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', [[:lua require('neoclip.fzf')()<CR>]], { noremap = true, silent = true })
-- line
-- vim.api.nvim_set_keymap('n', 'n', [[:set number!<CR>]], {})
-- packer
vim.api.nvim_set_keymap('n', '<C-p>i', [[:PackerInstall<CR>]], {})
vim.api.nvim_set_keymap('n', '<C-p>u', [[:PackerUpdate<CR>]], {})
-- silence
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.api.nvim_set_keymap('n', 'Q', [[<Nop>]], { silent = true })
vim.api.nvim_set_keymap('n', '<CR>', [[:noh<CR>]], { silent = true })
-- natural order consistent with i3
vim.keymap.set({ 'n', 'v' }, ';', 'l', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'l', 'k', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'k', 'j', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'j', 'h', { noremap = true })
-- faster nav
vim.keymap.set({ 'n', 'v' }, '<C-k>', '5j', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '5k', { noremap = true })
vim.keymap.set({ 'n' }, '<C-f>', ':HopPattern<CR>', { noremap = true })
vim.keymap.set({ 'n' }, '<leader>a', [[<cmd>Telescope telescope-alternate alternate_file<CR>]], { noremap = true })
vim.g.VM_maps = {
    ["Skip Region"] = '<C-x>',
    -- ["Select Cursor Down"] = '∆', -- Option+J,
    -- ["Select Cursor Up"]   = 'Ż', --  Option+K
}
-- region selection
vim.keymap.set("o", "<leader>v", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
vim.keymap.set("x", "<leader>v", ":lua require('tsht').nodes()<CR>", { silent = true })
vim.keymap.set("n", "<leader>v", ":lua require('tsht').nodes()<CR>", { silent = true })

vim.g.VM_theme = 'purplegray'
vim.api.nvim_set_keymap('n', "<C-e>", "<cmd>Neotree source=filesystem reveal=true position=float<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-g>", "<cmd>Neotree source=git_status reveal=true position=float<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', "<tab>", "<cmd>Neotree source=buffers reveal=true position=float<CR>", { noremap = true })
-- save file
vim.api.nvim_set_keymap('n', '<C-s>', [[:w<CR>]], { noremap = true })
-- quit
vim.api.nvim_set_keymap('n', '<C-q>', [[:q<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<M-w>", function()
    local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })
-- splits
vim.api.nvim_set_keymap('n', '<C-w><C-k>', [[:sp<CR>]], {})
vim.api.nvim_set_keymap('n', '<C-w><C-l>', [[:vs<CR>]], {})
-- resize panes
vim.api.nvim_set_keymap('n', '<C-M-k>', [[:resize -3<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-l>', [[:resize +3<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-j>', [[:vertical resize -3<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', 'VIMKBRESR', [[:vertical resize +3<CR>]], { noremap = true }) -- <C-M-;> cant map to semicolon, so custom binding is done via alacritty/kitty
-- reload config
vim.api.nvim_set_keymap('n', '<C-w>r', [[:so $MYVIMRC<CR>:e!<CR>]], {})
-- buffers
-- vim.api.nvim_set_keymap('n', '<TAB>', ':bn<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':bd!<CR>', {})
-- line swapping
vim.api.nvim_set_keymap('n', '<S-k>', [[:m+<CR>==]], { noremap = true })
vim.api.nvim_set_keymap('n', '<S-l>', [[:m-2<CR>==]], { noremap = true })
vim.api.nvim_set_keymap('v', '<S-k>', [[:m'>+<CR>gv=gv]], { noremap = true })
vim.api.nvim_set_keymap('v', '<S-l>', [[:m-2<CR>gv=gv]], { noremap = true })
vim.api.nvim_set_keymap('i', '<C-S-k>', [[<Esc>:m+<CR>==gi]], { noremap = true })
vim.api.nvim_set_keymap('i', '<C-S-l>', [[<Esc>:m-2<CR>==gi]], { noremap = true })
-- diagnostic, refs, navigation outline
vim.keymap.set("n", "<C-m>", "<cmd>:NoiceHistory<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "`d", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "``", "<cmd>TodoTrouble<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-CR>", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "<localleader>u", "<cmd>lua require('fzf-lua').lsp_references()<CR>",
    { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<localleader><localleader>", ":CodeActionMenu<CR>", { silent = true })
vim.keymap.set("n", "]j", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "];", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "n", function()
    require("aerial").toggle()
    -- TODO: sync windows so they do not overlap
    -- require("codewindow").toggle_minimap()
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "<leader>r", function() require("ssr").open() end)
-- help
vim.api.nvim_set_keymap('n', '<F1>', [[:WhichKey<CR>]], { noremap = true })
-- extras
vim.api.nvim_set_keymap('n', '<leader>ie', [[:Telescope emoji<CR>]], { noremap = true })
-- git
vim.api.nvim_set_keymap('n', '<leader>gl', [[:lua require('fzf-lua').git_commits()<CR>]], {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap('n', '<leader>gbr', [[:lua require('fzf-lua').git_branches()<CR>]], {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap('n', '<leader>gb', [[:VGit buffer_blame_preview()<CR>]], {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap('n', '<leader>gap', [[:VGit buffer_diff_preview<CR>]], {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap('n', '<C-j>', [[:lua require('vgit').hunk_up()<CR>]], {
    noremap = true,
    silent = true,
})
vim.api.nvim_set_keymap('n', '<C-;>', [[:lua require('vgit').hunk_down()<CR>]], {
    noremap = true,
    silent = true,
})

----
-- plugins setup
----

require("luasnip.loaders.from_vscode").lazy_load()

local symbols = require('utils.symbols')
local colors = require("catppuccin.palettes").get_palette "mocha"

local alpha = require 'alpha'
local startify = require 'alpha.themes.startify'
startify.section.header.val = {
    [[  ▒▒▒▒▒     ▄████▄     ]],
    [[ ▒ ▄▒ ▄▒   ███▄█▀      ]],
    [[ ▒▒▒▒▒▒▒  ▐████  █  █  ]],
    [[ ▒▒▒▒▒▒▒   █████▄      ]],
    [[ ▒ ▒ ▒ ▒    ▀████▀     ]],
}
startify.section.top_buttons.val = {
    startify.button("c", "Configuration", ":e ~/d/dotfiles/nvim/init.lua<CR>"),
    startify.button("ok", "Oh, Krab!", ":e ~/oh/krab/main.go<CR>"),
}
-- disable MRU
startify.section.mru.val = {
    { type = "padding", val = 1 },
    { type = "text", val = "MRU", opts = { hl = "SpecialComment" } },
    { type = "padding", val = 1 },
    {
        type = "group",
        val = function()
            return { startify.mru(1, nil, 5) }
        end,
    },
}
-- disable MRU cwd
startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
startify.nvim_web_devicons.enabled = true
--
startify.section.bottom_buttons.val = {
    { type = "text", val = "Actions", opts = { hl = "SpecialComment" } },
    { type = "padding", val = 1 },
    startify.button("t", "Create todo.txt", ":e todo.txt<CR>"),
    startify.button("e", "New empty file", ":ene <BAR> startinsert <CR>"),
    startify.button("q", "Quit", ":qa<CR>"),
}
startify.section.footer = {
    { type = "text", val = "footer" },
}
alpha.setup(startify.config)

--
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
    transparent_background = false,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.3,
    },
    color_overrides = {},
    custom_highlights = {},
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = false,
        telescope = true,
        treesitter = true,
        fidget = false,
        aerial = true,
        barbar = false,
        beacon = false,
        coc_nvim = false,
        dashboard = false,
        fern = false,
        gitgutter = false,
        harpoon = false,
        hop = true,
        illuminate = true,
        leap = false,
        lightspeed = false,
        lsp_saga = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = false,
        neogit = false,
        neotest = false,
        neotree = true,
        notify = true,
        overseer = false,
        pounce = false,
        symbols_outline = false,
        telekasten = false,
        treesitter_context = true,
        ts_rainbow = true,
        vim_sneak = false,
        vimwiki = false,
        which_key = true,
        dap = {
            enabled = true,
            enable_ui = true,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        navic = {
            enabled = false,
            custom_bg = "NONE",
        },
    },
})
vim.api.nvim_command "colorscheme catppuccin"

require("todo-comments").setup {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = "", color = "info" },
        HACK = { icon = "", color = "error" },
        WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    colors = {
        error = { "DiagnosticError", "ErrorMsg", colors.red },
        warning = { "DiagnosticWarning", "WarningMsg", colors.peach },
        info = { "DiagnosticInfo", colors.blue },
        hint = { "DiagnosticHint", colors.teal },
        default = { "Identifier", colors.mauve },
        test = { "Identifier", "#FF00FF" }
    },
}
local feline = require "feline"

local vi_mode_utils = require 'feline.providers.vi_mode'
local vi_mode_colors = {
    NORMAL = colors.green,
    OP = colors.green,
    INSERT = colors.yellow,
    VISUAL = colors.mauve,
    LINES = colors.peach,
    BLOCK = colors.maroon,
    REPLACE = colors.red,
    COMMAND = colors.sapphire,
}

local feline_config = {
    vim_mode = {
        provider = function()
            return vi_mode_utils.get_vim_mode()
        end,
        hl = function()
            return {
                fg = vi_mode_utils.get_mode_color(),
                bg = colors.mantle,
                name = vi_mode_utils.get_mode_highlight_name(),
            }
        end,
        -- left_sep = "block",
        -- right_sep = "block",
    },
    gitBranch = {
        provider = "git_branch",
        hl = {
            fg = colors.teal,
            bg = colors.mantle,
            -- style = "bold",
        },
        -- left_sep = "block",
        -- right_sep = "block",
    },
    gitDiffAdded = {
        provider = "git_diff_added",
        hl = {
            fg = colors.green,
            bg = colors.mantle,
        },
        -- left_sep = "block",
        -- right_sep = "block",
    },
    gitDiffRemoved = {
        provider = "git_diff_removed",
        hl = {
            fg = colors.red,
            bg = colors.mantle,
        },
        -- left_sep = "block",
        -- right_sep = "block",
    },
    gitDiffChanged = {
        provider = "git_diff_changed",
        hl = {
            fg = colors.yellow,
            bg = colors.mantle,
        },
        -- left_sep = "block",
        -- right_sep = "block",
    },
    separator = {
        provider = " ",
        hl = {
            bg = colors.mantle,
        },
    },
    left_mid = {
        provider = " ",
        hl = {
            bg = colors.mantle,
        },
        left_sep = "left_rounded"
    },
    right_mid = {
        provider = " ",
        hl = {
            bg = colors.mantle,
        },
        right_sep = "right_rounded"
    },
    fileinfo = {
        provider = {
            name = "file_info",
            opts = {
                type = "relative",
            },
        },
        hl = {
            bg = colors.mantle,
            -- style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
        icon = "",
    },
    diagnostic_errors = {
        provider = "diagnostic_errors",
        hl = {
            fg = colors.red,
            bg = colors.mantle,
        },
    },
    diagnostic_warnings = {
        provider = "diagnostic_warnings",
        hl = {
            fg = colors.peach,
            bg = colors.mantle,
        },
    },
    diagnostic_hints = {
        provider = "diagnostic_hints",
        hl = {
            fg = colors.sky,
            bg = colors.mantle,
        },
    },
    diagnostic_info = {
        provider = "diagnostic_info",
        hl = {
            fg = colors.teal,
            bg = colors.mantle,
        },
    },
    position = {
        provider = "position",
        hl = {
            fg = colors.mauve,
            bg = colors.mantle,
            style = "bold",
        },
        -- left_sep = "left_rounded",
        -- right_sep = "right_rounded",
    },
    file_type = {
        provider = {
            name = "file_type",
            opts = {
                filetype_icon = true,
                case = "lowercase",
            },
        },
        hl = {
            fg = colors.text,
            bg = colors.mantle,
            -- style = "bold",
        },
        left_sep = "block",
        right_sep = "block",
    },
}

local left = {
    feline_config.left_mid,
    feline_config.position,
    feline_config.separator,
    feline_config.vim_mode,
    feline_config.right_mid,
}

local middle = {
    feline_config.left_mid,
    feline_config.fileinfo,
    feline_config.diagnostic_errors,
    feline_config.diagnostic_warnings,
    feline_config.diagnostic_info,
    feline_config.diagnostic_hints,
    feline_config.right_mid,
}

local right = {
    feline_config.left_mid,
    feline_config.file_type,
    feline_config.separator,
    feline_config.gitDiffAdded,
    feline_config.gitDiffRemoved,
    feline_config.gitDiffChanged,
    feline_config.separator,
    feline_config.separator,
    feline_config.gitBranch,
    feline_config.right_mid,
}

local components = {
    active = {
        left,
        middle,
        right,
    },
    inactive = {
        {},
        {},
        {},
    },
}

local feline_properties = {
    force_inactive = {
        filetypes = {
            '^NvimTree$',
            '^packer$',
            '^startify$',
            '^fugitive$',
            '^fugitiveblame$',
            '^qf$',
            '^help$',
            '^Trouble$',
        },
        buftypes = {
            '^terminal$',
        },
        bufnames = {}
    }
}

feline.setup({
    default_bg = colors.base,
    default_fg = colors.lavender,
    properties = feline_properties,
    components = components,
    theme = {
        bg = colors.base,
    },
    vi_mode_colors = vi_mode_colors,
})

require("scrollbar").setup()
require('gitsigns').setup {}
require("scrollbar.handlers.gitsigns").setup()

require("ssr").setup {
    min_width = 50,
    min_height = 5,
    keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_all = "<leader><cr>",
    },
}

require 'treesitter-context'.setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
        -- Patterns for specific filetypes
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        rust = {
            'impl_item',
            'struct',
            'enum',
        },
        scala = {
            'object_definition',
        },
        vhdl = {
            'process_statement',
            'architecture_body',
            'entity_declaration',
        },
        markdown = {
            'section',
        },
        elixir = {
            'anonymous_function',
            'arguments',
            'block',
            'do_block',
            'list',
            'map',
            'tuple',
            'quoted_content',
        },
        json = {
            'pair',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
}

require('fzf-lua').setup {
    winopts = {
        -- split         = "belowright new",-- open in a split instead?
        -- "belowright new"  : split below
        -- "aboveleft new"   : split above
        -- "belowright vnew" : split right
        -- "aboveleft vnew   : split left
        -- Only valid when using a float window
        -- (i.e. when 'split' is not defined, default)
        height     = 0.85, -- window height
        width      = 0.80, -- window width
        row        = 0.35, -- window row position (0=top, 1=bottom)
        col        = 0.50, -- window col position (0=left, 1=right)
        -- border argument passthrough to nvim_open_win(), also used
        -- to manually draw the border characters around the preview
        -- window, can be set to 'false' to remove all borders or to
        -- 'none', 'single', 'double', 'thicc' or 'rounded' (default)
        border     = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        fullscreen = false, -- start fullscreen?
        -- highlights should optimally be set by the colorscheme using
        -- FzfLuaXXX highlights. If your colorscheme doesn't set these
        -- or you wish to override its defaults use these:
        --[[ hl = {
        normal         = 'Normal',        -- window normal color (fg+bg)
        border         = 'FloatBorder',   -- border color
        help_normal    = 'Normal',        -- <F1> window normal
        help_border    = 'FloatBorder',   -- <F1> window border
        -- Only used with the builtin previewer:
        cursor         = 'Cursor',        -- cursor highlight (grep/LSP matches)
        cursorline     = 'CursorLine',    -- cursor line
        cursorlinenr   = 'CursorLineNr',  -- cursor line number
        search         = 'IncSearch',     -- search matches (ctags|help)
        title          = 'Normal',        -- preview border title (file/buffer)
        -- Only used with 'winopts.preview.scrollbar = 'float'
        scrollfloat_e  = 'PmenuSbar',     -- scrollbar "empty" section highlight
        scrollfloat_f  = 'PmenuThumb',    -- scrollbar "full" section highlight
        -- Only used with 'winopts.preview.scrollbar = 'border'
        scrollborder_e = 'FloatBorder',   -- scrollbar "empty" section highlight
        scrollborder_f = 'FloatBorder',   -- scrollbar "full" section highlight
        }, ]]
        preview    = {
            -- default     = 'bat',           -- override the default previewer?
            -- default uses the 'builtin' previewer
            border       = 'border', -- border|noborder, applies only to
            -- native fzf previewers (bat/cat/git/etc)
            wrap         = 'nowrap', -- wrap|nowrap
            hidden       = 'nohidden', -- hidden|nohidden
            vertical     = 'down:50%', -- up|down:size
            horizontal   = 'right:50%', -- right|left:size
            layout       = 'vertical', -- horizontal|vertical|flex
            flip_columns = 120, -- #cols to switch to horizontal on flex
            -- Only used with the builtin previewer:
            title        = true, -- preview border title (file/buf)?
            title_align  = "left", -- left|center|right, title alignment
            scrollbar    = 'float', -- `false` or string:'float|border'
            -- float:  in-window floating border
            -- border: in-border chars (see below)
            scrolloff    = '-2', -- float scrollbar offset from right
            -- applies only when scrollbar = 'float'
            scrollchars  = { '█', '' }, -- scrollbar chars ({ <full>, <empty> }
            -- applies only when scrollbar = 'border'
            delay        = 100, -- delay(ms) displaying the preview
            -- prevents lag on fast scrolling
            winopts      = { -- builtin previewer window options
                number         = true,
                relativenumber = false,
                cursorline     = true,
                cursorlineopt  = 'both',
                cursorcolumn   = false,
                signcolumn     = 'no',
                list           = false,
                foldenable     = false,
                foldmethod     = 'manual',
            },
        },
        on_create  = function()
            -- called once upon creation of the fzf main window
            -- can be used to add custom fzf-lua mappings, e.g:
            --   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
            --     { silent = true, noremap = true })
        end,
        previewers = {
            builtin = {
                syntax         = true, -- preview syntax highlight?
                syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
                syntax_limit_b = 1024 * 1024 * 10, -- syntax limit (bytes), 0=nolimit
                limit_b        = 1024 * 1024 * 50, -- preview limit (bytes), 0=nolimit
                -- preview extensions using a custom shell command:
                -- for example, use `viu` for image previews
                -- will do nothing if `viu` isn't executable
                extensions     = {
                    ["ico"] = { "viu", "-b" },
                    ["png"] = { "viu", "-b" },
                    ["jpg"] = { "viu", "-b" },
                },
            },
        },
    }
}

require('telescope').setup {
    pickers = {
        find_files = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy",
        },
        buffers = {
            theme = "ivy",
        },
        help_tags = {
            theme = "ivy",
        },
        current_buffer_fuzzy_find = {
            theme = "ivy",
        },
        lsp_workspace_symbols = {
            theme = "ivy",
        },
    },
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
    extensions = {
        emoji = {
            action = function(emoji)
                -- argument emoji is a table.
                -- {name="", value="", cagegory="", description=""}

                vim.fn.setreg("*", emoji.value)
                print([[Press "*p to paste ]] .. emoji.value)
            end,
        }
    },
}
require("telescope").load_extension("emoji")
require('telescope').load_extension('terraform_doc')
require('telescope').load_extension('telescope-alternate')

require('telescope-alternate').setup({
    mappings = {
        { '(.*).go', {
            { '[1]_test.go', 'Test' }
        } },
        { '(.*)_test.go', {
            { '[1].go', 'Implementation' }
        } },
    },
    presets = { 'rails', 'rspec', 'nestjs' }, -- Telescope pre-defined mapping presets
    transformers = { -- custom transformers
    }
})

-- On your telescope:

require("trouble").setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 12, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = { "o" }, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = { "zM", "zm" }, -- close all folds
        open_folds = { "zR", "zr" }, -- open all folds
        toggle_fold = { "zA", "za" }, -- toggle fold of current file
        previous = "l", -- previous item
        next = "k" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

require("nvim-autopairs").setup {}

require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = "all",
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "fzf", "fugitive" },
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            -- init_selection = '<CR>',
            -- scope_incremental = '<CR>',
            node_incremental = 'v',
            node_decremental = 'V',
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
            javascript = {
                __default = '// %s',
                jsx_element = '{/* %s */}',
                jsx_fragment = '{/* %s */}',
                jsx_attribute = '// %s',
                comment = '// %s'
            },
            typescriptreact = {
                __default = '// %s',
                jsx_element = '{/* %s */}',
                jsx_fragment = '{/* %s */}',
                jsx_attribute = '// %s',
                comment = '// %s'
            },
            toml = {
                __default = '# %s'
            },
        }
    },
    textobjects = {
        select = {
            enable = false,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["aC"] = "@class.outer",
                ["iC"] = "@class.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
            },
        },
        move = {
            enable = false,
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
                ['<leader>.'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>,'] = '@parameter.inner',
            },
        },
    },
}
require('hlargs').setup()

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require('Comment').setup {
    toggler = {
        line = '//',
    },
    opleader = {
        line = '/',
    },
}
local comment_ft = require('Comment.ft')
comment_ft.set('hcl', '#%s')
comment_ft.set('terraform', '#%s')
comment_ft.set('tf', '#%s')

require('window-picker').setup({
    autoselect_one = true,
    include_current_win = true,
    selection_chars = '123456789',
    use_winbar = 'winbar',
    filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'NvimTree', "neo-tree", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { 'terminal' },
        },

        -- filter using window options
        wo = {},

        -- if the file path contains one of following names, the window
        -- will be ignored
        file_path_contains = {},

        -- if the file name contains one of following names, the window will be
        -- ignored
        file_name_contains = {},
    },

    -- the foreground (text) color of the picker
    fg_color = colors.surface0,

    -- if you have include_current_win == true, then current_win_hl_color will
    -- be highlighted using this background color
    current_win_hl_color = colors.maroon,

    -- all the windows except the curren window will be highlighted using this
    -- color
    other_win_hl_color = colors.teal,
})

require("neo-tree").setup({
    enable_git_status = true,
    enable_diagnostics = true,
    use_default_mappings = false,
    sources = {
        "filesystem",
        "buffers",
        "git_status",
    },
    source_selector = {
        winbar = false,
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(_file_path)
                local nt = require("neo-tree")
                -- nt.clear_filter() -- clear file filters
                nt.close_all() -- auto close window
            end
        },
    },
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- use a custom function for sorting files and directories in the tree
    -- sort_function = function (a,b)
    --       if a.type == b.type then
    --           return a.path > b.path
    --       else
    --           return a.type > b.type
    --       end
    --   end , -- this sorts files and directories descendantly
    default_component_configs = {
        container = {
            enable_character_fade = true
        },
        indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "", -- this can only be used in the git_status source
                renamed   = "", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            }
        },
    },
    window = {
        position = "left",
        width = 50,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            -- ["<2-LeftMouse>"] = "open",
            [";"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            -- ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            ["j"] = "close_node",
            ["z"] = "close_all_nodes",
            ["Z"] = "expand_all_nodes",
            ["a"] = {
                "add",
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "relative" -- "none", "relative", "absolute"
                }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
            ["d"] = "delete",
            ["r"] = "rename",
            ["c"] = {
                "copy_to_clipboard",
                config = {
                    show_path = "relative"
                }
            },
            ["x"] = {
                "cut_to_clipboard",
                config = {
                    show_path = "relative"
                }
            },
            ["p"] = "paste_from_clipboard",
            ["y"] = function(state)
                local node = state.tree:get_node()
                local filepath = node:get_id()
                local relative_to_cwd = vim.fn.fnamemodify(filepath, ':.')

                vim.fn.setreg('"', relative_to_cwd)
                vim.fn.setreg('+', relative_to_cwd)

                print("Path copied: " .. relative_to_cwd)
            end,
            ["m"] = { "move",
                config = {
                    show_path = "relative"
                }
            },
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        }
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
                "node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
                "*.log",
                --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
                ".gitignore",
                ".terraformignore",
                ".dockerignore",
                ".goreleaser.yml",
                ".air.toml",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                ".DS_Store",
                "thumbs.db",
            },
            never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
            },
        },
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = false, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        window = {
            mappings = {
                -- ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["h"] = "toggle_hidden",
                -- ["/"] = "fuzzy_finder",
                -- ["D"] = "fuzzy_finder_directory",
                ["f"] = "filter_on_submit",
                ["<esc>"] = "clear_filter",
                -- ["[g"] = "prev_git_modified",
                -- ["]g"] = "next_git_modified",
            }
        }
    },
    buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
            mappings = {
                ["d"] = "buffer_delete",
                ["u"] = "navigate_up",
                ["."] = "set_root",
            }
        },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"]  = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                -- ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                -- ["gg"] = "git_commit_and_push",
            }
        }
    }
})
--     { key = "u", action = "dir_up" },
--     { key = "j", action = "close_node" },
--     { key = ";", action = "open_node" },
--     { key = "<Tab>", action = "preview" },
--     { key = "h", action = "toggle_dotfiles" },
--     { key = "a", action = "create" },
--     { key = "d", action = "remove" },
--     { key = "r", action = "rename" },
--     { key = "x", action = "cut" },
--     { key = "c", action = "copy" },
--     { key = "p", action = "paste" },
--     { key = "y", action = "copy_path" },
--     { key = "Y", action = "copy_name" },
--     { key = "f", action = "live_filter" },
--     { key = "F", action = "clear_live_filter" },
-- },
--
local ccc = require("ccc")
ccc.setup({
    disable_default_mappings = false,
    highlighter = {
        auto_enable = true
    },
    mappings = {
        ["<CR>"] = ccc.mapping.complete,
        ["<Tab>"] = ccc.mapping.toggle_input_mode,
        ["o"] = ccc.mapping.toggle_output_mode,
        ["a"] = ccc.mapping.toggle_alpha,
        [";"] = ccc.mapping.increase1,
        ["j"] = ccc.mapping.decrease1,
        ["<C-;>"] = ccc.mapping.increase10,
        ["<C-j>"] = ccc.mapping.decrease10,
        q = ccc.mapping.quit,
    }
})

require("hop").setup()

require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    under_cursor = true,
})

require('lspkind').init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    },
})

vim.g.did_load_filetypes = 1
require('filetype').setup({
    overrides = {
        extensions = {
            tf = "hcl",
        },
        literal = {
            gitconfig = 'gitconfig',
        },
        complex = {
            ['%.env%.*'] = 'sh',
            ['.pryrc'] = 'ruby',
        },
    },
})
require("nvim-web-devicons").set_icon {
    zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
    },
    bash = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "bash"
    },
}

require("nvim-surround").setup({
})

require('neoclip').setup({
    history = 5000,
    enable_persistent_history = true,
    length_limit = 1048576,
    continuous_sync = false,
    db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    filter = nil,
    preview = true,
    prompt = nil,
    default_register = '"',
    default_register_macros = 'q',
    enable_macro_history = true,
    content_spec_column = false,
    on_paste = {
        set_reg = false,
    },
    on_replay = {
        set_reg = false,
    },
    keys = {
        fzf = {
            select = 'default',
            paste = 'ctrl-p',
            paste_behind = 'ctrl-k',
            custom = {},
        },
    },
})

require("which-key").setup {
    layout = {
        height = { min = 4, max = 50 }, -- min and max height of the columns
        width = { min = 20, max = 80 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
}

require("project_nvim").setup {
    manual_mode = false,

    detection_methods = { "lsp", "pattern" },
    -- root dir / root patterns
    patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        ".terraform",
        ".tflint.hcl",
    },

    ignore_lsp = {},

    -- Don't calculate root dir on specific directories
    -- Ex: { "~/.cargo/*", ... }
    exclude_dirs = {},

    show_hidden = false,

    silent_chdir = true,

    scope_chdir = 'global',
}

require("aerial").setup({
    -- Priority list of preferred backends for aerial.
    -- This can be a filetype map (see :help aerial-filetype-map)
    backends = { "treesitter", "lsp", "markdown", "man" },

    layout = {
        -- These control the width of the aerial window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a list of mixed types.
        -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 20,

        -- key-value pairs of window-local options for aerial window (e.g. winhl)
        win_opts = {},

        -- Determines the default direction to open the aerial window. The 'prefer'
        -- options will open the window in the other direction *if* there is a
        -- different buffer in the way of the preferred direction
        -- Enum: prefer_right, prefer_left, right, left, float
        default_direction = "prefer_right",

        -- Determines where the aerial window will be opened
        --   edge   - open aerial at the far right/left of the editor
        --   window - open aerial to the right/left of the current window
        placement = "window",
    },

    -- Determines how the aerial window decides which buffer to display symbols for
    --   window - aerial window will display symbols for the buffer in the window from which it was opened
    --   global - aerial window will display symbols for the current window
    attach_mode = "window",

    -- List of enum values that configure when to auto-close the aerial window
    --   unfocus       - close aerial when you leave the original source window
    --   switch_buffer - close aerial when you change buffers in the source window
    --   unsupported   - close aerial when attaching to a buffer that has no symbol source
    close_automatic_events = {},

    -- Keymaps in aerial window. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
    -- Additionally, if it is a string that matches "aerial.<name>",
    -- it will use the mapping at require("aerial.action").<name>
    -- Set to `false` to remove a keymap
    keymaps = {
        -- ["?"] = "actions.show_help",
        -- ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        -- ["<2-LeftMouse>"] = "actions.jump",
        -- ["<C-v>"] = "actions.jump_vsplit",
        -- ["<C-s>"] = "actions.jump_split",
        -- ["p"] = "actions.scroll",
        ["k"] = "actions.down_and_scroll",
        ["l"] = "actions.up_and_scroll",
        -- ["{"] = "actions.prev",
        -- ["}"] = "actions.next",
        -- ["[["] = "actions.prev_up",
        -- ["]]"] = "actions.next_up",
        ["q"] = "actions.close",
        -- ["o"] = "actions.tree_toggle",
        -- ["za"] = "actions.tree_toggle",
        -- ["O"] = "actions.tree_toggle_recursive",
        -- ["zA"] = "actions.tree_toggle_recursive",
        -- ["l"] = "actions.tree_open",
        -- ["zo"] = "actions.tree_open",
        -- ["L"] = "actions.tree_open_recursive",
        -- ["zO"] = "actions.tree_open_recursive",
        -- ["h"] = "actions.tree_close",
        -- ["zc"] = "actions.tree_close",
        -- ["H"] = "actions.tree_close_recursive",
        -- ["zC"] = "actions.tree_close_recursive",
        -- ["zr"] = "actions.tree_increase_fold_level",
        -- ["zR"] = "actions.tree_open_all",
        -- ["zm"] = "actions.tree_decrease_fold_level",
        -- ["zM"] = "actions.tree_close_all",
        -- ["zx"] = "actions.tree_sync_folds",
        -- ["zX"] = "actions.tree_sync_folds",
    },

    -- When true, don't load aerial until a command or function is called
    -- Defaults to true, unless `on_attach` is provided, then it defaults to false
    lazy_load = true,

    -- Disable aerial on files with this many lines
    disable_max_lines = 10000,

    -- Disable aerial on files this size or larger (in bytes)
    disable_max_size = 2000000, -- Default 2MB

    -- A list of all symbols to display. Set to false to display all symbols.
    -- This can be a filetype map (see :help aerial-filetype-map)
    -- To see all available values, see :help SymbolKind
    filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
    },

    -- Determines line highlighting mode when multiple splits are visible.
    -- split_width   Each open window will have its cursor location marked in the
    --               aerial buffer. Each line will only be partially highlighted
    --               to indicate which window is at that location.
    -- full_width    Each open window will have its cursor location marked as a
    --               full-width highlight in the aerial buffer.
    -- last          Only the most-recently focused window will have its location
    --               marked in the aerial buffer.
    -- none          Do not show the cursor locations in the aerial window.
    highlight_mode = "split_width",

    -- Highlight the closest symbol if the cursor is not exactly on one.
    highlight_closest = true,

    -- Highlight the symbol in the source buffer when cursor is in the aerial win
    highlight_on_hover = false,

    -- When jumping to a symbol, highlight the line for this many ms.
    -- Set to false to disable
    highlight_on_jump = 300,

    -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
    -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
    -- default collapsed icon. The default icon set is determined by the
    -- "nerd_font" option below.
    -- If you have lspkind-nvim installed, it will be the default icon set.
    -- This can be a filetype map (see :help aerial-filetype-map)
    icons = {},

    -- Control which windows and buffers aerial should ignore.
    -- If attach_mode is "global", focusing an ignored window/buffer will
    -- not cause the aerial window to update.
    -- If open_automatic is true, focusing an ignored window/buffer will not
    -- cause an aerial window to open.
    -- If open_automatic is a function, ignore rules have no effect on aerial
    -- window opening behavior; it's entirely handled by the open_automatic
    -- function.
    ignore = {
        -- Ignore unlisted buffers. See :help buflisted
        unlisted_buffers = true,

        -- List of filetypes to ignore.
        filetypes = {},

        -- Ignored buftypes.
        -- Can be one of the following:
        -- false or nil - No buftypes are ignored.
        -- "special"    - All buffers other than normal buffers are ignored.
        -- table        - A list of buftypes to ignore. See :help buftype for the
        --                possible values.
        -- function     - A function that returns true if the buffer should be
        --                ignored or false if it should not be ignored.
        --                Takes two arguments, `bufnr` and `buftype`.
        buftypes = "special",

        -- Ignored wintypes.
        -- Can be one of the following:
        -- false or nil - No wintypes are ignored.
        -- "special"    - All windows other than normal windows are ignored.
        -- table        - A list of wintypes to ignore. See :help win_gettype() for the
        --                possible values.
        -- function     - A function that returns true if the window should be
        --                ignored or false if it should not be ignored.
        --                Takes two arguments, `winid` and `wintype`.
        wintypes = "special",
    },

    -- Use symbol tree for folding. Set to true or false to enable/disable
    -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
    -- This can be a filetype map (see :help aerial-filetype-map)
    manage_folds = false,

    -- When you fold code with za, zo, or zc, update the aerial tree as well.
    -- Only works when manage_folds = true
    link_folds_to_tree = false,

    -- Fold code when you open/collapse symbols in the tree.
    -- Only works when manage_folds = true
    link_tree_to_folds = true,

    -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
    -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
    nerd_font = "auto",

    -- Call this function when aerial attaches to a buffer.
    on_attach = function(bufnr)
    end,

    -- Call this function when aerial first sets symbols on a buffer.
    on_first_symbols = function(bufnr) end,

    -- Automatically open aerial when entering supported buffers.
    -- This can be a function (see :help aerial-open-automatic)
    open_automatic = false,

    -- Run this command after jumping to a symbol (false will disable)
    post_jump_cmd = "normal! zz",

    -- When true, aerial will automatically close after jumping to a symbol
    close_on_select = true,

    -- The autocmds that trigger symbols update (not used for LSP backend)
    update_events = "TextChanged,InsertLeave",

    -- Show box drawing characters for the tree hierarchy
    show_guides = true,

    -- Customize the characters used when show_guides = true
    guides = {
        -- When the child item has a sibling below it
        mid_item = "├─",
        -- When the child item is the last in the list
        last_item = "└─",
        -- When there are nested child guides to the right
        nested_top = "│ ",
        -- Raw indentation
        whitespace = "  ",
    },

    -- Options for opening aerial in a floating win
    float = {
        -- Controls border appearance. Passed to nvim_open_win
        border = "rounded",

        -- Determines location of floating window
        --   cursor - Opens float on top of the cursor
        --   editor - Opens float centered in the editor
        --   win    - Opens float centered in the window
        relative = "cursor",

        -- These control the height of the floating window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_height and max_height can be a list of mixed types.
        -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
        max_height = 0.9,
        height = nil,
        min_height = { 8, 0.1 },

        override = function(conf, source_winid)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
        end,
    },

    lsp = {
        -- Fetch document symbols when LSP diagnostics update.
        -- If false, will update on buffer changes.
        diagnostics_trigger_update = true,

        -- Set to false to not update the symbols when there are LSP errors
        update_when_errors = true,

        -- How long to wait (in ms) after a buffer change before updating
        -- Only used when diagnostics_trigger_update = false
        update_delay = 300,
    },

    treesitter = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
    },

    markdown = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
    },

    man = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
    },
})

-- require("dapui").setup({
--     icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
--     mappings = {
--         -- Use a table to apply multiple mappings
--         expand = { "<CR>", "<2-LeftMouse>" },
--         open = "o",
--         remove = "d",
--         edit = "e",
--         repl = "r",
--         toggle = "t",
--     },
--     -- Expand lines larger than the window
--     -- Requires >= 0.7
--     expand_lines = true,
--     -- Layouts define sections of the screen to place windows.
--     -- The position can be "left", "right", "top" or "bottom".
--     -- The size specifies the height/width depending on position. It can be an Int
--     -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
--     -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
--     -- Elements are the elements shown in the layout (in order).
--     -- Layouts are opened in order so that earlier layouts take priority in window sizing.
--     layouts = {
--         {
--             elements = {
--                 -- Elements can be strings or table with id and size keys.
--                 { id = "scopes", size = 0.25 },
--                 "breakpoints",
--                 "stacks",
--                 "watches",
--             },
--             size = 40, -- 40 columns
--             position = "left",
--         },
--         {
--             elements = {
--                 "repl",
--                 "console",
--             },
--             size = 0.25, -- 25% of total lines
--             position = "bottom",
--         },
--     },
--     controls = {
--         -- Requires Neovim nightly (or 0.8 when released)
--         enabled = true,
--         -- Display controls in this element
--         element = "repl",
--         icons = {
--             pause = "",
--             play = "",
--             step_into = "",
--             step_over = "",
--             step_out = "",
--             step_back = "",
--             run_last = "↻",
--             terminate = "□",
--         },
--     },
--     floating = {
--         max_height = nil, -- These can be integers or a float between 0 and 1.
--         max_width = nil, -- Floats will be treated as percentage of your screen.
--         border = "single", -- Border style. Can be "single", "double" or "rounded"
--         mappings = {
--             close = { "q", "<Esc>" },
--         },
--     },
--     windows = { indent = 1 },
--     render = {
--         max_type_length = nil, -- Can be integer or nil.
--         max_value_lines = 100, -- Can be integer or nil.
--     }
-- })
--
require('go').setup({
    icons = { breakpoint = '🧘', currentpos = '🏃' }, -- setup to `false` to disable icons setup
    dap_debug = true, -- set to false to disable dap
    dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
    -- false: do not use keymap in go/dap.lua.  you must define your own.
    -- windows: use visual studio keymap
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommend
    dap_debug_vt = true, -- set to true to enable dap virtual text
    trouble = true, -- true: use trouble to open quickfix
    luasnip = true, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
})

require("lspsaga").init_lsp_saga({
    diagnostic_header = { " ", " ", " ", " " },
    preview_lines_above = 0,
    max_preview_lines = 25,
    code_action_icon = symbols.action,
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = false,
        sign = true,
        enable_in_insert = true,
        sign_priority = 20,
        virtual_text = false,
    },
    finder_icons = {
        def = '  ',
        ref = ' ',
        link = '  ',
    },
    show_outline = {
        win_position = 'right',
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = '',
        win_width = 40,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        auto_refresh = true,
    },
})

-- require("lsp_lines").setup()

require('nvim-lightbulb').setup({
    -- LSP client names to ignore
    -- Example: {"sumneko_lua", "null-ls"}
    ignore = {},
    sign = {
        enabled = true,
        -- Priority of the gutter sign
        priority = 10,
    },
    float = {
        enabled = false,
        -- Text to show in the popup float
        text = symbols.action,
        -- Available keys for window options:
        -- - height     of floating window
        -- - width      of floating window
        -- - wrap_at    character to wrap at for computing height
        -- - max_width  maximal width of floating window
        -- - max_height maximal height of floating window
        -- - pad_left   number of columns to pad contents at left
        -- - pad_right  number of columns to pad contents at right
        -- - pad_top    number of lines to pad contents at top
        -- - pad_bottom number of lines to pad contents at bottom
        -- - offset_x   x-axis offset of the floating window
        -- - offset_y   y-axis offset of the floating window
        -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
        -- - winblend   transparency of the window (0-100)
        win_opts = {},
    },
    virtual_text = {
        enabled = false,
        -- Text to show at virtual text
        text = symbols.action,
        -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
        hl_mode = "replace",
    },
    status_text = {
        enabled = false,
        -- Text to provide when code actions are available
        text = symbols.action,
        -- Text to provide when no actions are available
        text_unavailable = ""
    },
    autocmd = {
        enabled = true,
        -- see :help autocmd-pattern
        pattern = { "*" },
        -- see :help autocmd-events
        events = { "CursorHold", "CursorHoldI" }
    }
})
vim.fn.sign_define('LightBulbSign', { text = symbols.action, texthl = "LightBulbSign", linehl = "", numhl = "" })
vim.api.nvim_set_hl(0, 'LightBulbSign', { fg = colors.yellow })

-- CodeActionMenu
vim.g.code_action_menu_show_details = false
vim.g.code_action_menu_show_diff = true
vim.g.code_action_menu_window_border = 'single'

-- require('lint').linters_by_ft = { }

require("diffview").setup()

require('numb').setup {
    show_numbers = true, -- Enable 'number' for the window while peeking
    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
    number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
    centered_peeking = true, -- Peeked line will be centered relative to window
}

local codewindow = require('codewindow')
codewindow.setup(
    {
        active_in_terminals = false, -- Should the minimap activate for terminal buffers
        auto_enable = false, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
        exclude_filetypes = {
            "aerial",
            "neo-tree",
            "Trouble",
        }, -- Choose certain filetypes to not show minimap on
        max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
        max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
        minimap_width = 10, -- The width of the text part of the minimap
        use_lsp = true, -- Use the builtin LSP to show errors and warnings
        use_treesitter = true, -- Use nvim-treesitter to highlight the code
        use_git = true, -- Show small dots to indicate git additions and deletions
        width_multiplier = 5, -- How many characters one dot represents
        z_index = 1, -- The z-index the floating window will be on
        show_cursor = false, -- Show the cursor position in the minimap
        window_border = 'none' -- The border style of the floating window (accepts all usual options)
    }
)

require('nvim_context_vt').setup({
    enabled = true,
    prefix = '',
    highlight = 'ContextVt',
    disable_ft = { 'markdown' },
    disable_virtual_lines = false,
    disable_virtual_lines_ft = { 'yaml' },
    -- How many lines required after starting position to show virtual text
    -- Default: 1 (equals two lines total)
    min_rows = 3,
    min_rows_ft = {},

    custom_parser = function(node, ft, opts)
        local utils = require('nvim_context_vt.utils')
        local type = node:type()

        -- If you return `nil`, no virtual text will be displayed.
        if type == 'function' or type == "function_declaration" or type == "method_declaration" then
            return nil
        end

        -- This is the standard text
        return opts.prefix .. " " .. utils.get_node_text(node)[1]
    end,
})
vim.api.nvim_set_hl(0, 'ContextVt', { fg = colors.crust, bg = "" })
vim.api.nvim_set_hl(0, 'GitComment', { fg = colors.crust, bg = "" })

require('trim').setup({
    disable = { "markdown" },
})
require('vgit').setup({
    keymaps = {},
    settings = {
        hls = {
            GitBackground = 'Normal',
            GitHeader = 'NormalFloat',
            GitFooter = 'NormalFloat',
            GitBorder = 'LineNr',
            GitLineNr = 'LineNr',
            GitComment = 'GitComment',
            GitSignsAdd = {
                gui = nil,
                fg = '#d7ffaf',
                bg = nil,
                sp = nil,
                override = false,
            },
            GitSignsChange = {
                gui = nil,
                fg = '#7AA6DA',
                bg = nil,
                sp = nil,
                override = false,
            },
            GitSignsDelete = {
                gui = nil,
                fg = '#e95678',
                bg = nil,
                sp = nil,
                override = false,
            },
            GitSignsAddLn = 'DiffAdd',
            GitSignsDeleteLn = 'DiffDelete',
            GitWordAdd = {
                gui = nil,
                fg = nil,
                bg = '#5d7a22',
                sp = nil,
                override = false,
            },
            GitWordDelete = {
                gui = nil,
                fg = nil,
                bg = '#960f3d',
                sp = nil,
                override = false,
            },
        },
        live_gutter = {
            enabled = false, -- diable signs conflicting with gitsigns
            edge_navigation = true, -- This allows users to navigate within a hunk
        },
        authorship_code_lens = {
            enabled = false,
        },
        scene = {
            diff_preference = 'split', -- unified or split
            keymaps = {
                quit = 'q'
            }
        },
        diff_preview = {
            keymaps = {
                buffer_stage = 'S',
                buffer_unstage = 'U',
                buffer_hunk_stage = 's',
                buffer_hunk_unstage = 'u',
                toggle_view = 't',
            },
        },
        symbols = {
            void = '⣿',
        },
    }
})

require("neodev").setup({})
require("lsp")
