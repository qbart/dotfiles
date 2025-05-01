return {
    -- better f
    { 'rhysd/clever-f.vim' },

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

    -- symbols tree
    { 'stevearc/aerial.nvim', config = function()
        require("aerial").setup({
            -- Priority list of preferred backends for aerial.
            -- This can be a filetype map (see :help aerial-filetype-map)
            backends = { "treesitter", "lsp", "markdown", "man" },
            layout = {
                -- These control the width of the aerial window.
                -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                -- min_width and max_width can be a list of mixed types.
                -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
                max_width = { 60, 0.3 },
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
                ["<CR>"] = "actions.jump",
                ["q"] = "actions.close",
                ["k"] = "actions.down_and_scroll",
                ["l"] = "actions.up_and_scroll",
                -- ["?"] = "actions.show_help",
                -- ["g?"] = "actions.show_help",
                -- ["<2-LeftMouse>"] = "actions.jump",
                -- ["<C-v>"] = "actions.jump_vsplit",
                -- ["<C-s>"] = "actions.jump_split",
                -- ["p"] = "actions.scroll",
                -- ["{"] = "actions.prev",
                -- ["}"] = "actions.next",
                -- ["[["] = "actions.prev_up",
                -- ["]]"] = "actions.next_up",
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
            highlight_on_hover = true,
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
            on_first_symbols = function(bufnr)
            end,
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

    end
    },

}
