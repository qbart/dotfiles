local setup_servers = require('lsp.setup_servers').setup_servers
local setup_lsp_signature = require('lsp.setup_lsp_signature').setup_lsp_signature
local setup_diagnostics = require('lsp.setup_diagnostics').setup_diagnostics
local setup_lsp_status = require('lsp.plugins.lsp-status').setup_lsp_status

-- lsp handlers
-- callHierarchy/incomingCalls
-- callHierarchy/outgoingCalls
-- textDocument/codeAction
-- textDocument/completion
-- textDocument/declaration*
-- textDocument/definition
-- textDocument/documentHighlight
-- textDocument/documentSymbol
-- textDocument/formatting
-- textDocument/hover
-- textDocument/implementation*
-- textDocument/publishDiagnostics
-- textDocument/rangeFormatting
-- textDocument/references
-- textDocument/rename
-- textDocument/signatureHelp
-- textDocument/typeDefinition*
-- window/logMessage
-- window/showMessage
-- window/showDocument
-- window/showMessageRequest
-- workspace/applyEdit
-- workspace/symbol
-- local lsp_handlers_hover = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = 'single'
-- })
--
-- vim.lsp.handlers['textDocument/hover'] = function(err, result, ctx, config)
--   local bufnr, winnr = lsp_handlers_hover(err, result, ctx, config)
--   if winnr ~= nil then
--     vim.api.nvim_win_set_option(winnr, 'winblend', 20)  -- opacity for hover
--   end
--   return bufnr, winnr
-- end

setup_servers()
setup_diagnostics()
setup_lsp_signature()
setup_lsp_status()

local cmp = require('cmp')
local compare = require('cmp.config.compare')
local lspkind = require('lspkind')
local cmp_buffer = require('cmp_buffer')
local luasnip = require("luasnip")

vim.cmd [[
  set pumheight=10
]]

local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Custom sorting/ranking for completion items.
local cmp_helper = {}
cmp_helper.compare = {
    -- Deprioritize items starting with underscores (private or protected)
    deprioritize_underscore = function(lhs, rhs)
      local l = (lhs.completion_item.label:find "^_+") and 1 or 0
      local r = (rhs.completion_item.label:find "^_+") and 1 or 0
      if l ~= r then return l < r end
    end,
    -- Prioritize items that ends with "= ..." (usually for argument completion).
    prioritize_argument = function(lhs, rhs)
      local l = (lhs.completion_item.label:find "=$") and 1 or 0
      local r = (rhs.completion_item.label:find "=$") and 1 or 0
      if l ~= r then return l > r end
    end,
}

-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
-- 	max_lines = 1000;
-- 	max_num_results = 20;
-- 	sort = true;
-- 	run_on_every_keystroke = true;
-- 	snippet_placeholder = '..';
-- 	ignored_file_types = { -- default is not to ignore
-- 		-- uncomment to ignore in lua:
-- 		-- lua = true
-- 	};
-- 	show_prediction_strength = false;
-- })

cmp.setup({
    preselect = cmp.PreselectMode.None,
    completion = {},
    sources = {
        -- { name = 'nvim_lsp_signature_help' },
        -- { name = 'cmp_tabnine', priority = 95 },
        -- { name = 'copilot', priority = 100 },
        { name = 'luasnip',  priority = 70 },
        { name = 'nvim_lsp', priority = 80 },
        { name = 'path',     priority = 60 },
        { name = 'buffer', priority = 50, option = {
            keyword_pattern = [[\k\+]],
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
        } },
        { name = 'spell' },
        { name = 'calc' },
        { name = 'nvim_lua' },
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            -- compare.locality,
            -- function(...) return cmp_buffer:compare_locality(...) end,
            -- compare.exact,
            -- compare.recently_used,
            compare.score,
            -- function(...) return cmp_helper.compare.prioritize_argument(...) end,
            -- function(...) return cmp_helper.compare.deprioritize_underscore(...) end,
            compare.kind,
            compare.offset,
            compare.order,
        }
    },
    snippet = {
        expand = function(args)
          require 'luasnip'.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable( -1) then
            luasnip.jump( -1)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- ['<Esc>'] = cmp.mapping.abort(),
        -- ['<CR>'] = cmp.mapping.confirm {
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- },
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- accept only if select so you can create new line normally
    },
    experimental = {
        ghost_text = true,
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          if vim_item.abbr == "flex" then
            print(vim.inspect(vim_item))
          end
          if entry.source.name == 'nvim_lsp_signature_help' then
            vim_item.kind = string.format(" %s", "Args")
          else
            vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol_text" })
          end
          local menu = ({
                  buffer = "[Buf]",
                  nvim_lsp = "[LSP]",
                  nvim_lua = "[Lua]",
                  omni = "[Omni]",
                  ultisnips = "[Snip]",
                  spell = "[Spell]",
                  cmp_tabnine = "[TN]",
                  copilot = "[AI]",
                  cmdline = "[CMD]",
                  nvim_lsp_signature_help = "[Sign]",
              })[entry.source.name] or entry.source.name
          vim_item.menu = menu

          local strings = vim.split(vim_item.kind, "%s", { trimempty = true })
          vim_item.kind = " " .. strings[1] .. " "
          vim_item.menu = " " .. strings[2]

          return vim_item
        end
    },
    window = {
        completion = {
            winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
            col_offset = -4,
            side_padding = 0,
            border = 'rounded',
        },
        documentation = cmp.config.window.bordered(),
        -- border = opts.border or 'rounded',
        --    winhighlight = opts.winhighlight or 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
        --    zindex = opts.zindex or 1001,
        --    scrolloff = opts.scrolloff or 0,
        --    col_offset = opts.col_offset or 0,
        --    side_padding = opts.side_padding or 1,
        --    scrollbar = opts.scrollbar == nil and true or opts.scrollbar,
    },
})

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )

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

vim.cmd [[
augroup cmp_config
autocmd!
autocmd FileType css,scss,sass lua require'cmp'.setup.buffer {
\  sources = {
\    { name = "luasnip" },
\    { name = 'nvim_lsp' },
\    { name = 'omni' },
\    { name = 'path' },
\    { name = 'buffer', get_bufnrs = function() return vim.api.nvim_list_bufs() end },
\    { name = 'spell' },
\  },
\ }
augroup END
]]
