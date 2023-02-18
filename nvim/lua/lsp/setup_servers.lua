local on_attach = require('lsp/on_attach')
local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}

local servers = {
    "gopls",
    "cssls",
    'clangd',
    'dockerls',
    'graphql',
    'html',
    'jsonls',
    'marksman',
    'pyright',
    'rust_analyzer',
    'sqlls',
    'sqls',
    'stylelint_lsp',
    'lua_ls',
    'tailwindcss',
    'terraformls',
    'tsserver',
    'vimls',
    'yamlls',
    'wgsl_analyzer',
    'bashls',
    -- linters
    'golangci_lint_ls',
    'tflint',
    -- 'solargraph', -- install manually
}

require('mason').setup()
require('mason-lspconfig').setup(
    { ensure_installed = servers }
)


local M = {}

-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--   pattern = {"*.tf", "*.tfvars"},
--   callback = vim.lsp.buf.formatting_sync,
-- })
M.setup_servers = function()
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        flags = {
            debounce_text_changes = 150,
        }
    }

    lspconfig.terraformls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        filetypes = { "terraform", "tf", "hcl" },
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
        }
    })

    lspconfig.solargraph.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            solargraph = {
                diagnostics = true
            }
        }
    })

    require("typescript").setup({
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false, -- enable debug logging for commands
        go_to_source_definition = {
            fallback = true, -- fall back to standard LSP definition on failure
        },
        server = opts,
    })
    -- lspconfig.tsserver.setup(opts)

    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                    }
                },
                telemetry = {
                    enable = false
                }
            }
        }
    })
    lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        settings = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        }
    })

    lspconfig.gopls.setup(opts)
    lspconfig.pyright.setup(opts)
    lspconfig.clangd.setup(opts)
    lspconfig.dockerls.setup(opts)
    lspconfig.graphql.setup(opts)
    lspconfig.html.setup(opts)
    lspconfig.marksman.setup(opts)
    lspconfig.rust_analyzer.setup(opts)
    lspconfig.sqlls.setup(opts)
    lspconfig.sqls.setup(opts)
    lspconfig.tailwindcss.setup(opts)
    lspconfig.vimls.setup(opts)
    lspconfig.yamlls.setup(opts)
    lspconfig.wgsl_analyzer.setup(opts)
    lspconfig.bashls.setup(opts)
    lspconfig.cssls.setup(opts)
    -- linters
    lspconfig.golangci_lint_ls.setup(opts)
    lspconfig.tflint.setup({
        capabilities = capabilities,
        root_dir = vim.loop.cwd,
        filetypes = { "terraform", "tf", "hcl" },
    })


    vim.cmd([[ do User LspAttach Buffers ]])
end

return M
