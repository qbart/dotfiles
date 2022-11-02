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
  "pyright",
  'clangd',
  'dockerls',
  'graphql',
  'html',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'sqlls',
  'sqls',
  'stylelint_lsp',
  'sumneko_lua',
  'tailwindcss',
  'terraformls',
  'tflint',
  'tsserver',
  'vimls',
  'vuels',
  'yamlls',

  -- 'bashls',
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

  lspconfig['tflint'].setup({
    root_dir = vim.loop.cwd,
    filetypes = { "terraform", "tf", "hcl" },
  })
  lspconfig['terraformls'].setup({
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

  lspconfig['solargraph'].setup({
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
    server = {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = vim.loop.cwd,
      flags = {
        debounce_text_changes = 150,
      }
    },
  })

  for _, server_name in ipairs(servers) do
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = vim.loop.cwd,
      flags = {
        debounce_text_changes = 150,
      }
    }

    if server_name == "sumneko_lua" then
      opts.root_dir = function()
        return vim.loop.cwd()
      end
      opts.settings = {
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
    elseif server_name == "jsonls" then
      opts.settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      }
    end

    if server_name ~= 'tsserver' then
      lspconfig[server_name].setup(opts)
    end
  end
  vim.cmd([[ do User LspAttach Buffers ]])
end

return M
