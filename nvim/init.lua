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
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- shortcuts
    use { "folke/which-key.nvim" }

    -- switch cwd based on patterns
    use { 'notjedi/nvim-rooter.lua' }

    -- profiler
    use 'lewis6991/impatient.nvim'

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

    -- Additional textobjects for treesitter
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    use { 'nvim-lua/lsp-status.nvim' }
    -- display arguments names while typing
    use { 'ray-x/lsp_signature.nvim' }
    -- lsp icons
    use { 'onsails/lspkind-nvim'}
    -- Manage external editor tooling i.e LSP servers
    use 'williamboman/mason.nvim'
    -- Automatically install language servers to stdpath
    use 'williamboman/mason-lspconfig.nvim'
    -- symbols tree
    use 'simrat39/symbols-outline.nvim'

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

    -- visualize what lsp does
    use { 'j-hui/fidget.nvim' }

    -- completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-omni",
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

-- use {'akinsho/git-conflict.nvim', tag = "*", config = function()
--   require('git-conflict').setup()
-- end}

    -- syntax
    use { 'nvim-treesitter/nvim-treesitter',
        requires = {
            { 'nvim-treesitter/playground' },
            { 'p00f/nvim-ts-rainbow' },
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            -- { 'romgrk/nvim-treesitter-context' },
        },
        run = ':TSUpdate',
    }

    -- highlight arguments definitaions and usages 
    use { 'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' },
    }

    -- convert between oneliner/multiline statement
    use { 'AndrewRadev/splitjoin.vim' }

    -- auto tag closing and changing matching tag
    use { 'windwp/nvim-ts-autotag' }

    -- snippets
    use({"L3MON4D3/LuaSnip", tag = "v*", requires = {
        {'saadparwaiz1/cmp_luasnip'},
        {"rafamadriz/friendly-snippets"},
    }})

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
    use { 'rcarriga/nvim-notify' }

    -- Ranger like file manager but written in Go, no python 🙏
    use { "lmburns/lf.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "akinsho/toggleterm.nvim"
        }
    }

    -- scrollbar
    use("petertriho/nvim-scrollbar")

    -- Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
    use { 'tpope/vim-surround' }

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

    -- show colors
    use { 'norcalli/nvim-colorizer.lua' }

    -- commentary
    use { 'numToStr/Comment.nvim' }

    -- git signs
    use { 'lewis6991/gitsigns.nvim' }

    -- multi cursor 
    use { 'terryma/vim-multiple-cursors' }

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- show idents
    use "lukas-reineke/indent-blankline.nvim"

    -- visual debugger
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text"} }

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
vim.g.maplocalleader = '<Space>'

vim.o.compatible=false -- forget about vi compatibility
-- vim.o.number = false -- no line nums on init
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.langmenu = 'en_US.utf-8'
vim.o.sidescroll=1
vim.o.sidescrolloff=1
vim.o.scrolloff=9
vim.o.ttyfast = true
vim.o.cursorline = true -- highliht current line
vim.o.tabstop=4
vim.o.softtabstop=0
vim.o.expandtab=true
vim.o.shiftwidth=4
vim.o.smarttab=true
vim.o.history=10000
vim.o.undolevels=2000
vim.o.wildignore='+*.o,*.obj,*.bak,*.exe,*.pyc,*.class,**/node_modules/**'
vim.o.wrap = false
vim.o.textwidth=0 -- no wordwrap
vim.o.wrapmargin=0
vim.o.splitright=true
vim.o.splitbelow=true
vim.o.swapfile=false
vim.o.visualbell=false
vim.o.smartindent=true
vim.o.smartcase=true
vim.o.hidden = true -- https://medium.com/usevim/vim-101-set-hidden-f78800142855
vim.o.backup = false
vim.o.writebackup = false
vim.o.cmdheight=0
-- vim.o.autoindent = true
vim.o.shortmess="Ot" -- http://vimdoc.sourceforge.net/htmldoc/options.html#'shortmess'

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
vim.api.nvim_set_keymap('n', '<leader>j', [[:Telescope find_files<CR>]], {})
vim.api.nvim_set_keymap('n', '<leader>g', [[:Telescope live_grep<CR>]], {})
vim.api.nvim_set_keymap('n', '<leader>b', [[:Telescope buffers<CR>]], {})
vim.api.nvim_set_keymap('n', '<leader>h', [[:Telescope help_tags<CR>]], {})
vim.api.nvim_set_keymap('n', '<leader>f', [[:Telescope current_buffer_fuzzy_find<CR>]], {})
vim.api.nvim_set_keymap('n', '<leader>s', [[:Telescope lsp_workspace_symbols<CR>]], {})
-- line
-- vim.api.nvim_set_keymap('n', 'n', [[:set number!<CR>]], {})
-- packer
vim.api.nvim_set_keymap('n', '<C-p>i', [[:PackerInstall<CR>]], {})
vim.api.nvim_set_keymap('n', '<C-p>u', [[:PackerUpdate<CR>]], {})
-- silence
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.api.nvim_set_keymap('n', 'Q', [[<Nop>]], {})
vim.api.nvim_set_keymap('n', '<CR>', [[:noh<CR>]], {})
-- natural order consistent with i3
vim.keymap.set({'n','v'}, ';', 'l', {noremap=true})
vim.keymap.set({'n','v'}, 'l', 'k', {noremap=true})
vim.keymap.set({'n','v'}, 'k', 'j', {noremap=true})
vim.keymap.set({'n','v'}, 'j', 'h', {noremap=true})
-- faster nav
vim.keymap.set({'n', 'v'}, '<C-k>', '5j', {noremap=true})
vim.keymap.set({'n', 'v'}, '<C-l>', '5k', {noremap=true})
vim.keymap.set({'n'}, '<C-j>', ':HopPattern<CR>', {noremap=true})
-- open LF file manager (external dep)
vim.api.nvim_set_keymap('n', "<C-e>", "<cmd>lua require('lf').start()<CR>", { noremap = true })
-- save file
vim.api.nvim_set_keymap('n', '<C-s>', [[:w<CR>]], {})
-- quit
vim.api.nvim_set_keymap('n', '<C-q>', [[:q<CR>]], {})
-- splits 
vim.api.nvim_set_keymap('n', '<C-w><C-k>', [[:sp<CR>]], {})
vim.api.nvim_set_keymap('n', '<C-w><C-l>', [[:vs<CR>]], {})
-- resize panes
vim.api.nvim_set_keymap('n', '<C-M-k>', [[:resize -3<CR>]], {noremap=true})
vim.api.nvim_set_keymap('n', '<C-M-l>', [[:resize +3<CR>]], {noremap=true})
vim.api.nvim_set_keymap('n', '<C-M-j>', [[:vertical resize -3<CR>]], {noremap=true})
vim.api.nvim_set_keymap('n', 'VIMKBRESR', [[:vertical resize +3<CR>]], {noremap=true}) -- <C-M-;> cant map to semicolon, so custom binding is done via alacritty/kitty
-- reload config
vim.api.nvim_set_keymap('n', '<C-w>r', [[:so $MYVIMRC<CR>:e!<CR>]], {})
-- buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':bn<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bp<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>d', ':bd!<CR>', {})
-- line swapping
vim.api.nvim_set_keymap('n', '<S-k>', [[:m+<CR>==]], {noremap=true})
vim.api.nvim_set_keymap('n', '<S-l>', [[:m-2<CR>==]], {noremap=true})
vim.api.nvim_set_keymap('v', '<S-k>', [[:m'>+<CR>gv=gv]], {noremap=true})
vim.api.nvim_set_keymap('v', '<S-l>', [[:m-2<CR>gv=gv]], {noremap=true})
vim.api.nvim_set_keymap('i', '<C-S-k>', [[<Esc>:m+<CR>==gi]], {noremap=true})
vim.api.nvim_set_keymap('i', '<C-S-l>', [[<Esc>:m-2<CR>==gi]], {noremap=true})
-- diagnostic, refs, navigation outline
vim.keymap.set("n", "<C-m>", "<cmd>:messages<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "``", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "`w", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "`d", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "`l", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "`q", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gu", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "`u", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set({"n","v"}, "<leader><cr>", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.api.nvim_set_keymap('n', 'n', [[:SymbolsOutline<CR>]], { noremap = true, silent = true })
-- help
vim.api.nvim_set_keymap('n', '<F1>', [[:WhichKey<CR>]], {noremap=true})

----
-- plugins setup
----
require('impatient')

require("luasnip.loaders.from_vscode").lazy_load()

local alpha = require'alpha'
local startify = require'alpha.themes.startify'
startify.section.header.val = {
[[  ▒▒▒▒▒     ▄████▄     ]],
[[ ▒ ▄▒ ▄▒   ███▄█▀      ]],
[[ ▒▒▒▒▒▒▒  ▐████  █  █  ]],
[[ ▒▒▒▒▒▒▒   █████▄      ]],
[[ ▒ ▒ ▒ ▒    ▀████▀     ]],
}
startify.section.top_buttons.val = {
    startify.button( "c", "Configuration" , ":e ~/d/dotfiles/nvim/init.lua<CR>"),
    startify.button( "ok", "Oh, Krab!" , ":e ~/oh/krab/main.go<CR>"),
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
    startify.button( "t", "Create todo.txt" , ":e todo.txt<CR>"),
    startify.button( "e", "New empty file" , ":ene <BAR> startinsert <CR>"),
    startify.button( "q", "Quit" , ":qa<CR>"),
}
startify.section.footer = {
    { type = "text", val = "footer" },
}
alpha.setup(startify.config)

local symbols = require('utils.symbols')
--
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
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
        nvimtree = true,
        telescope = true,
        treesitter = true,
        fidget = true,
        aerial = false,
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
        neotree = false,
        notify = true,
        overseer = false,
        pounce = false,
        symbols_outline = true,
        telekasten = false,
        treesitter_context = true,
        ts_rainbow = true,
        vim_sneak = false,
        vimwiki = false,
        which_key = false,
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

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},

    },
    sections = {
        lualine_a = {'location'},
        lualine_b = {},
        lualine_c = {'diff', 'filename'},
        -- lualine_x = {'encoding', 'filetype', 'branch', 'diagnostics'},
        lualine_x = {'diagnostics'},
        lualine_y = {},
        lualine_z = {'mode'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
}
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
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "l", -- previous item
        next = "k" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
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
            enable = true,
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

vim.g.lf_netrw = 1
require("lf").setup({
    default_actions = { -- default action keybindings
        ["<C-k>"] = "split",
        ["<C-l>"] = "vsplit",
    },

    winblend = 10, -- psuedotransparency level
    dir = "", -- directory where `lf` starts ('gwd' is git-working-directory, "" is CWD)
    direction = "float", -- window type: float horizontal vertical
    border = "curved", -- border kind: single double shadow curved
    height = 0.80, -- height of the *floating* window
    width = 0.80, -- width of the *floating* window
    escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
    focus_on_open = true, -- focus the current file when opening Lf (experimental)
    mappings = true, -- whether terminal buffer mapping is enabled
    tmux = false, -- tmux statusline can be disabled on opening of Lf

    -- Layout configurations
    layout_mapping = "<A-u>" -- resize window with this key
})

require('go').setup()

require('colorizer').setup({
    '*'
},{
        RGB      = true,         -- #RGB hex codes
        RRGGBB   = true,         -- #RRGGBB hex codes
        names    = false,       -- "Name" codes like Blue
        RRGGBBAA = true,        -- #RRGGBBAA hex codes
        rgb_fn   = true,        -- CSS rgb() and rgba() functions
        hsl_fn   = true,        -- CSS hsl() and hsla() functions
        css      = true,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode     = 'background', -- Set the display mode.
    })

require("scrollbar").setup()

require("hop").setup()

require("notify").setup({
    symbols = {
        ERROR = symbols.error,
        WARN = symbols.warning,
        INFO = symbols.information,
        DEBUG = symbols.debug,
        TRACE = symbols.trace,
    },
})
vim.notify = require('notify')

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

require('nvim-ts-autotag').setup()
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
        literal = {
            gitconfig = 'gitconfig',
        },
        complex = {
            ['%.env%.*'] = 'sh',
            ['.pryrc'] = 'ruby',
        },
    },
})

require("fidget").setup{
    window = {
        blend = 0,
    },
}

require("which-key").setup {
    layout = {
        height = { min = 4, max = 50 }, -- min and max height of the columns
        width = { min = 20, max = 80 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
}

require('nvim-rooter').setup {
  rooter_patterns = { '.git', '.hg', '.svn' },
  trigger_patterns = { '*' },
  manual = false,
}
require("symbols-outline").setup({
    auto_close = true,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
    },
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = symbols.Struct, hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
})

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = true,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

require('go').setup({
    icons = {breakpoint = '🧘', currentpos = '🏃'},  -- setup to `false` to disable icons setup
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
    max_preview_lines = 15,
    code_action_icon = symbols.action,
    code_action_num_shortcut = true,
    code_action_lightbulb = {
        enable = true,
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
    rename_action_quit = "<C-q>",
    show_outline = {
        win_position = 'right',
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
        auto_refresh = true,
    },
})


require("lsp")

