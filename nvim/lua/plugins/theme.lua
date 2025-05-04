return {
    {
        "forest-nvim/sequoia.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local palette = require("sequoia.palette")
            require('sequoia').setup({
                highlight_groups = {
                    NeoTreeDirectoryIcon = { fg = palette.baja },
                    NeoTreeDirectoryName = { fg = palette.baja },
                },
            })
            vim.cmd("colorscheme sequoia") -- or 'sequoia-night' / 'sequoia-rise'
        end
    },

    { 'nvim-lualine/lualine.nvim', opts = {
        options = {
            icons_enabled = true,
            theme = 'sequoia',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
                "neo-tree",
                "aerial",
                "sagaoutline",
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
            lualine_b = {'location'},
            lualine_c = {'filename', 'diagnostics'},
            lualine_x = {'filetype'},
            lualine_y = {},
            lualine_z = {'branch', 'mode'}
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

    {
        'nvim-tree/nvim-web-devicons',
        config = function ()
            require('nvim-web-devicons').setup({
                color_icons = true,
            })
        end
    },
}
