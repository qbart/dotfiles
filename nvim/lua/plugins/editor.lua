return {
    -- editorconfig
    { "gpanders/editorconfig.nvim" },

    -- whitespace trim
    { "cappyzawa/trim.nvim", config = function()
        require('trim').setup({
            disable = { "markdown" },
            trim_on_write = true,
            trim_trailing = true,
            trim_last_line = true,
            trim_first_line = true,
            highlight = true,
        })
    end,
    },

    -- auto pairs
    {
        "echasnovski/mini.pairs",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
    },

    -- Automatically add closing tags for HTML and JSX
    {
        "windwp/nvim-ts-autotag",
        opts = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = true,
        },
        config = function ()
            require('nvim-ts-autotag').setup            {
                opts = {
                    -- Defaults
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = true -- Auto close on trailing </
                },
                per_filetype = {
                    -- ["html"] = {
                    --   enable_close = false
                    -- }
                }
            }
        end
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


    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
           -- cfg options
        },
    },

    {
        'nvimdev/lspsaga.nvim',
        config = function()
            local symbols = require("utils.symbols")
            require('lspsaga').setup({
                diagnostic_header = { " ", " ", " ", " " },
                preview = {
                    lines_above = 0,
                    line_below = 0,
                },
                -- diagnostic = {
                --
                -- },
                symbol_in_winbar = {
                    enable = false,
                },
                code_action = {
                    num_shortcut = false,
                    show_server_name = false,
                    extend_gitsigns = false,
                },
                lightbulb = {
                    enable = true,
                    sign = true,
                    enable_in_insert = true,
                    sign_priority = 20,
                    virtual_text = false,
                },
                ui = {
                    code_action = symbols.action,
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
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },

    -- comments
    { "folke/todo-comments.nvim", opts = {}, config = function()

        local colors = require("catppuccin.palettes.init").get_palette()
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
                'neo-tree',
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
                local palette = require("catppuccin.palettes.init").get_palette()
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
                vim.api.nvim_set_hl(0, 'ContextVt', { fg = palette.crust, bg = "" })
                vim.api.nvim_set_hl(0, 'GitComment', { fg = palette.crust, bg = "" })
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
    { "uga-rosa/ccc.nvim",
        config = function()
            local ccc = require("ccc")
            ccc.setup({
                lsp = false,
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

        end
    },

    -- scrollbar
    { "petertriho/nvim-scrollbar", config = function()
        require("scrollbar").setup()
    end},

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
                basic = true,
                extra = true,
            },
            toggler = {
                line = '<C-_>',
            },
            opleader = {
                line = '<C-_>',
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
