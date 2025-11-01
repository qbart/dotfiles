return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        options = {
        },
        config = function()
            -- local palette = require('nightfox.palette').load("carbonfox")
            vim.cmd("colorscheme carbonfox")
            -- black background
            vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "#070707" })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = '#151515', bg = 'NONE' })
        end
    },

    { 'nvim-lualine/lualine.nvim', opts = {
        options = {
            icons_enabled = true,
            theme = 'carbonfox',
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
