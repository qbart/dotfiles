return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
        config = function()
            require("catppuccin").setup({
                compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
                transparent_background = false,
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.3,
                },
                color_overrides = {
                    mocha = {
                    },
                },
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
                    blink_cmp = false,
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
                    hop = false,
                    illuminate = true,
                    leap = false,
                    lightspeed = false,
                    lsp_saga = true,
                    lsp_trouble = true,
                    mason = true,
                    markdown = true,
                    mini = true,
                    neogit = false,
                    neotest = false,
                    neotree = true,
                    notify = false,
                    overseer = false,
                    pounce = false,
                    symbols_outline = false,
                    telekasten = false,
                    treesitter_context = true,
                    ts_rainbow = true,
                    vim_sneak = false,
                    vimwiki = false,
                    which_key = false,
                    dap = {
                        enabled = false,
                        enable_ui = false,
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
                vim.api.nvim_command "colorscheme catppuccin-macchiato"
            })
        end
    },
    --catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    { 'nvim-lualine/lualine.nvim', opts = {
        options = {
            icons_enabled = true,
            theme = 'catppuccin-macchiato',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
                "neo-tree",
                "aerial",
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            }
        },
        sections = {
            lualine_a = {},
            lualine_b = {'branch'},
            lualine_c = {'diagnostics', 'filename', 'location'},
            lualine_x = {'filetype'},
            lualine_y = {},
            lualine_z = {'mode'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename', 'location'},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }},
    { 'nvim-tree/nvim-web-devicons' },
}
