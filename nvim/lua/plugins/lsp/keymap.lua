local M = {}

function M.on_attach(client, bufnr)
  vim.wo.signcolumn = 'yes:1'


  require "lsp_signature".on_attach({
    bind = false,
    doc_lines = 0,
    padding= ' ',
    floating_window = false, -- only vt as hint
    hint_enable = true,
    handler_opts = {
      border = "none",
    }
  }, bufnr)
  --  require('lsp-status').on_attach(client)
  -- if vim.tbl_contains({ 'css', 'scss', 'sass' }, vim.bo.filetype) then
  --     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'csscomplete#CompleteCSS')
  -- else
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- end


  -- Mappings.
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<CR>', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>cf', function() require("conform").format({ bufnr = 0 }) end, opts)
  -- vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('v', '<leader>f', function() require("conform").format({ bufnr = 0 }) end, opts)
  -- vim.keymap.set('v', '<localleader>f', vim.lsp.buf.range_formatting, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
  -- vim.keymap.set('n', '<localleader>e', vim.lsp.buf.code_action, opts)
  -- vim.lsp.buf.declaration
  -- vim.lsp.buf.implementation
  -- vim.lsp.buf.type_definition
  -- vim.lsp.buf.references
  -- vim.lsp.buf.code_action
end

return M
