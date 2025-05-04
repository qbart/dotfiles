return {
    -- better f
    --{ 'rhysd/clever-f.vim' },

    -- Flash enhances the built-in search functionality by showing labels
    -- at the end of each match, letting you quickly jump to a specific
    -- location.
    {
        "folke/flash.nvim",
        vscode = false,
        -- enabled = false,
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            --{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            --{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            --{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- pick window by letter
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require'window-picker'.setup()
        end,
    },

    -- find in files
    {
        "nvim-pack/nvim-spectre",
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
        },
    },

    -- tree files
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
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
                        -- nt.close_all() -- auto close window
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
                    folder_empty = "",
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
                        ".github",
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
                follow_current_file = {
                    enabled = true,
                }, -- This will find and focus the file in the active buffer every
                -- time the current file is changed while the tree is open.
                group_empty_dirs = false, -- when true, empty folders will be grouped together
                hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                -- hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
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
                follow_current_file = { enabled = true }, -- This will find and focus the file in the active buffer every
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
        },
    },

    -- file/buffer/... fuzzy finder
    { "ibhagwan/fzf-lua", opts = {}, config = function()
        require('fzf-lua').setup {
            winopts = {
                height     = 0.85, -- window height
                width      = 0.80, -- window width
                row        = 0.35, -- window row position (0=top, 1=bottom)
                col        = 0.50, -- window col position (0=left, 1=right)
                border     = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                fullscreen = false, -- start fullscreen?
                treesitter = false,
                preview    = {
                    border       = 'border', -- border|noborder, applies only to
                    -- native fzf previewers (bat/cat/git/etc)
                    wrap         = 'nowrap', -- wrap|nowrap
                    hidden       = 'nohidden', -- hidden|nohidden
                    vertical     = 'down:70%', -- up|down:size
                    horizontal   = 'right:70%', -- right|left:size
                    layout       = 'flex', -- horizontal|vertical|flex
                    flip_columns = 120, -- #cols to switch to horizontal on flex
                    -- Only used with the builtin previewer:
                    title        = true, -- preview border title (file/buf)?
                    title_pos  = "left", -- left|center|right, title alignment
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

    end,
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { "otavioschwanck/telescope-alternate" },
            { "xiyaowong/telescope-emoji.nvim" },
        },
        config = function()
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
        end,
    },
}
