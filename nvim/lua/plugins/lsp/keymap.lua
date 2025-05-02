local M = {}

function M.on_attach(client, bufnr)
  vim.wo.signcolumn = 'yes:1'

--  require('lsp-status').on_attach(client)
  -- if vim.tbl_contains({ 'css', 'scss', 'sass' }, vim.bo.filetype) then
  --     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'csscomplete#CompleteCSS')
  -- else
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- end


  -- Mappings.
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<cr>', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<localleader>f', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('v', '<localleader>f', vim.lsp.buf.range_formatting, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<localleader>r', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<C-Space>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<localleader>e', vim.lsp.buf.code_action, opts)
  -- vim.lsp.buf.declaration
  -- vim.lsp.buf.implementation
  -- vim.lsp.buf.type_definition
  -- vim.lsp.buf.references
  -- vim.lsp.buf.code_action
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  -- vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)gg
end

return M
