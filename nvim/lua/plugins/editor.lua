
-- INFO: 
return {
    -- editorconfig
    { "gpanders/editorconfig.nvim" },

    -- whitespace trim
    { "cappyzawa/trim.nvim", config = function()
        require('trim').setup({
            disable = { "markdown" },
        })
    end,
    },

    -- switch cwd based on patterns
    { "ahmedkhalf/project.nvim", config = function()
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
    end },

    -- comments
    { "folke/todo-comments.nvim", opts = {}, config = function() 

        local colors = require("catppuccin.palettes").get_palette "mocha"
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
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "hint", alt = { "INFO" } },
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
    end},

    -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
    {
        "folke/trouble.nvim",
        config = function() 
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
        end,
    },

    -- json schemas for various configs
    { 'b0o/schemastore.nvim' },

    -- highlight current word
    { 'RRethy/vim-illuminate', config = function()
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

    end},

    -- convert between oneliner/multiline statement split/join
    { 'AndrewRadev/splitjoin.vim' },

    -- show closing context as virtualtext
    { "haringsrob/nvim_context_vt", 
        dependencies = { 'nvim-treesitter/nvim-treesitter',
        config = function()

                local colors = require("catppuccin.palettes").get_palette "mocha"
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
            end },
    },

    -- highlight arguments definitaions and usages
    { 'm-demare/hlargs.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('hlargs').setup()
        end
    },

    -- color picker and colorizer
    { "uga-rosa/ccc.nvim", config = function()
        local ccc = require("ccc")
ccc.setup({
    disable_default_mappings = true,
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

    end },

    -- scrollbar
    { "petertriho/nvim-scrollbar", config = function()
        require("scrollbar").setup() 
    end},

    -- highlight todo/hack/note/perf/warn/fix comments
    { "folke/todo-comments.nvim", 
        dependencies = {"nvim-lua/plenary.nvim"} },

    -- is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
    -- ys{motion}{char}, ds{char}, and cs{target}{replacement}
    {
        "kylechui/nvim-surround",
        config = function() 
            require("nvim-surround").setup({})
        end
    },

    -- case converison, cru, ...
    { 'tpope/vim-abolish' },

    -- Detect tabstop and shiftwidth automatically
    { 'tpope/vim-sleuth' },

    -- commentary
    { 'numToStr/Comment.nvim', config = function()
        require('Comment').setup {
            mappings = {
                basic = false,
                extra = false,
            },
            toggler = {
                line = '<C-/>',
            },
            opleader = {
                line = '<C-/>',
            },
        }
        local comment_ft = require('Comment.ft')
        comment_ft.set('hcl', '#%s')
        comment_ft.set('terraform', '#%s')
        comment_ft.set('tf', '#%s')
    end
    },

    -- git signs
    { 'lewis6991/gitsigns.nvim', config = function()
       require("gitsigns").setup()
    end
    },

    -- multi cursor
    { 'mg979/vim-visual-multi' },

    -- show idents
    { "lukas-reineke/indent-blankline.nvim",
        config = function()
            
local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
        end
    },
}

