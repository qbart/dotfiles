local keymap = require('plugins.lsp.keymap')

return {
  -- formatter
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        go = { "gofmt"},
        lua = { "stylua" },
        terraform = { "terraform_fmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      }
    },
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
      { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
    },
    requires = {
      { 'saadparwaiz1/cmp_luasnip' },
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local cmp_mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- local copilot_suggestion = require("copilot.suggestion")
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
            -- elseif copilot_suggestion.is_visible() then
            --   copilot_suggestion.accept()
          -- elseif has_words_before() then
          --   cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- ['<CR>'] = cmp.mapping.confirm({
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = false,
        -- }), -- accept only if select so you can create new line normally
      }

      cmp.setup({
        preselect = cmp.PreselectMode.Item,
        window = {
          -- completion = cmp.config.window.bordered(),
          completion = {
            border = "none",
            -- winhighlight = "Normal:CmpItemMenu,CursorLine:PmenuSel,Search:None",
          },
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp_mapping,
        snippet = {
          expand = function (args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
          })
      })

      -- local palette = require("sequoia.palette")
      -- vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg=palette.text })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { bg='NONE', fg=palette.baja })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindText', { bg='NONE', fg=palette.subtle })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg=palette.sky })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link='CmpItemKindFunction' })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link='CmpItemKindFunction' })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindFunction' })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg=palette.baja })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
      -- vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
      -- vim.api.nvim_set_hl(0, 'CmpItemMenu', { bg="NONE", fg=palette.lavendar })
      -- vim.api.nvim_set_hl(0, 'CmpItemKind', { bg="NONE", fg=palette.denim })
      -- vim.api.nvim_set_hl(0, 'CmpItemAbbr', { bg="NONE", fg=palette.lavendar })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })


      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'nvim_lsp_document_symbol' }
        }, {
            { name = 'buffer' }
          })
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

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          'documentation',
          'detail',
          'additionalTextEdits',
        }
      }

      local lsOpts = {
        capabilities = capabilities,
        on_attach = function(client, buffer)
          keymap.on_attach(client, buffer)
        end,
        root_dir = vim.loop.cwd,
        flags = {
          debounce_text_changes = 150
        },
      }

      vim.lsp.config('bashls', lsOpts)
      vim.lsp.config('clangd', lsOpts)
      vim.lsp.config('cssls', lsOpts)
      vim.lsp.config('dockerls', lsOpts)
      vim.lsp.config('docker_compose_language_service', lsOpts)
      vim.lsp.config('eslint', lsOpts)
      --vim.lsp.config('glslls', lsOpts)
      --vim.lsp.config('golangci_lint_ls', lsOpts)
      vim.lsp.config('gopls', lsOpts)
      vim.lsp.config('html', lsOpts)
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
        root_dir = vim.loop.cwd,
        settings = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        }
      })
      vim.lsp.config('lua_ls', {
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
      vim.lsp.config('marksman', lsOpts)
      vim.lsp.config('omnisharp', lsOpts)
      vim.lsp.config('pyright', lsOpts)
      vim.lsp.config('rust_analyzer', lsOpts)
      vim.lsp.config('sqlls', lsOpts)
      vim.lsp.config('tailwindcss', lsOpts)
      vim.lsp.config('templ', lsOpts)
      vim.lsp.config('terraformls', lsOpts)
      vim.lsp.config('tflint', {
        capabilities = capabilities,
        filetypes = { "terraform", "tf", "hcl" },
      })
      vim.lsp.config('ts_ls', lsOpts)
      vim.lsp.config('wgsl_analyzer', lsOpts)
      vim.lsp.config('yamlls', lsOpts)

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
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
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
        automatic_enable = false,
        ensure_installed = opts.ensure_installed
      }
    end
  },

  {
    "L3MON4D3/LuaSnip",
    requires = {
      { 'saadparwaiz1/cmp_luasnip' },
    },
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
      require("luasnip.loaders.from_snipmate").lazy_load()
    end
  }
}
