return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        version = false,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
            { "nvim-treesitter/nvim-treesitter-context" },
        },
        config = function()
            require'treesitter-context'.setup {
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

            require('nvim-treesitter.configs').setup {
                -- Add languages to be installed here that you want installed for treesitter
                ensure_installed = 'all',
--               ensure_installed = {
--                   'go',
--                   'astro',
--                   'awk',
--                   'bash',
--                   'c',
--                   'c_sharp',
--                   'caddy',
--                   'clojure',
--                   'cmake',
--                   'comment',
--                   'commonlisp',
--                   'cpp',
--                   'css',
--                   'csv',
--                   'cuda',
--                   'd',
--                   'dart',
--                   'desktop',
--                   'dockerfile',
--                   'dot',
--                   'doxygen',
--                   'editorconfig',
--                   'elixir',
--                   'elm',
--                   'embedded_template',
--                   'erlang',
--                   'gdshader',
--                   'git_config',
--                   'git_rebase',
--                   'gitattributes',
--                   'gitcommit',
--                   'gitignore',
--                   'glsl',
--                   'gnuplot',
--                   'go',
--                   'godot_resource',
--                   'gomod',
--                   'gosum',
--                   'gotmpl',
--                   'gowork',
--                   'gpg',
--                   'graphql',
--                   'hcl',
--                   'helm',
--                   'hlsl',
--                   'html',
--                   'htmldjango',
--                   'http',
--                   'hurl',
--                   'ini',
--                   'java',
--                   'javadoc',
--                   'javascript',
--                   'jinja',
--                   'jinja_inline',
--                   'jq',
--                   'jsdoc',
--                   'json',
--                   'json5',
--                   'jsonc',
--                   'julia',
--                   'kotlin',
--                   'liquid',
--                   'llvm',
--                   'lua',
--                   'make',
--                   'markdown',
--                   'markdown_inline',
--                   'matlab',
--                   'mermaid',
--                   'meson',
--                   'nginx',
--                   'nim',
--                   'nim_format_string',
--                   'ninja',
--                   'nix',
--                   'objc',
--                   'objdump',
--                   'ocaml',
--                   'odin',
--                   'pascal',
--                   'pem',
--                   'perl',
--                   'php',
--                   'php_only',
--                   'phpdoc',
--                   'printf',
--                   'prolog',
--                   'promql',
--                   'properties',
--                   'proto',
--                   'pymanifest',
--                   'python',
--                   'r',
--                   'rbs',
--                   'regex',
--                   'requirements',
--                   'ruby',
--                   'rust',
--                   'scala',
--                   'scheme',
--                   'scss',
--                   'slang',
--                   'slim',
--                   'slint',
--                   'solidity',
--                   'sparql',
--                   'sql',
--                   'squirrel',
--                   'ssh_config',
--                   'svelte',
--                   'sway',
--                   'swift',
--                   'tcl',
--                   'templ',
--                   'terraform',
--                   'textproto',
--                   'tmux',
--                   'todotxt',
--                   'toml',
--                   'tsv',
--                   'tsx',
--                   'typescript',
--                   'udev',
--                   'vim',
--                   'vimdoc',
--                   'vue',
--                   'wgsl',
--                   'wgsl_bevy',
--                   'xml',
--                   'xresources',
--                   'yaml',
--                   'zig',
--                   'ziggy',
--                   'ziggy_schema',
--               },
                ignore_install = {
                    'ipkg',
                    'latex',
                    'scfg',
                    'swift',
                    'ocamllex',
                    'mlir',
                    'unison',
                    'teal',
                },
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
                incremental_selection = {
                    enable = false,
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


        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function ()
            require'treesitter-context'.setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = false, -- Enable multiwindow support.
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    },
}
