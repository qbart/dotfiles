local keymap = require('plugins.lsp.keymap')

return {
  -- lspconfig
  {
    'stevearc/conform.nvim',
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    version = false,
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
    },
    config = function(_, opts)
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          --{ name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
            { name = 'buffer' },
          })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline([[/\V]], {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
      })

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsOpts = {
        capabilities = capabilites,
        on_attach = function(client, buffer)
          keymap.on_attach(client, buffer)
        end,
        root_dir = vim.loop.cwd,
        flags = {
          debounce_text_changes = 150
        },
      }

      lspconfig.bashls.setup(lsOpts)
      lspconfig.clangd.setup(lsOpts)
      lspconfig.cssls.setup(lsOpts)
      lspconfig.dockerls.setup(lsOpts)
      lspconfig.docker_compose_language_service.setup(lsOpts)
      lspconfig.eslint.setup(lsOpts)
      --lspconfig.glslls.setup(lsOpts)
      --lspconfig.golangci_lint_ls.setup(lsOpts)
      lspconfig.gopls.setup(lsOpts)
      lspconfig.html.setup(lsOpts)
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        root_dir = vim.loop.cwd,
        settings = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        }
      })
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      })
      lspconfig.marksman.setup(lsOpts)
      lspconfig.omnisharp.setup(lsOpts)
      lspconfig.pyright.setup(lsOpts)
      lspconfig.rust_analyzer.setup(lsOpts)
      lspconfig.sqlls.setup(lsOpts)
      lspconfig.tailwindcss.setup(lsOpts)
      lspconfig.templ.setup(lsOpts)
      lspconfig.terraformls.setup(lsOpts)
      lspconfig.tflint.setup({
        capabilities = capabilities,
        root_dir = vim.loop.cwd,
        filetypes = { "terraform", "tf", "hcl" },
      })
      lspconfig.ts_ls.setup(lsOpts)
      lspconfig.wgsl_analyzer.setup(lsOpts)
      lspconfig.yamlls.setup(lsOpts)

      vim.cmd([[ do User LspAttach Buffers ]])
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {},
    build = ":MasonUpdate",
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        'bashls',
        'clangd',
        'cssls',
        'dockerls',
        'docker_compose_language_service',
        'eslint',
        --   'glslls',
        --'golangci_lint_ls',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'marksman',
        'omnisharp',
        'pyright',
        'rust_analyzer',
        'sqlls',
        'stylelint_lsp',
        'tailwindcss',
        'templ',
        'terraformls',
        'tflint',
        'ts_ls',
        'wgsl_analyzer',
        'yamlls',
      },
    },

    config = function(_, opts)
      require("mason-lspconfig").setup {
        ensure_installed = opts.ensure_installed
      }
    end
  },
}
