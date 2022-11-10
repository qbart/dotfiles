local set_default_formatter_for_filetypes = require('lsp.functions').set_default_formatter_for_filetypes
-- local navic_loaded, navic = pcall(require, "nvim-navic")

local on_attach = function(client, bufnr)
  -- if not navic_loaded then
  --   print "Error while loading nvim-navic"
  -- else
  --   navic.attach(client, bufnr)
  -- end

  vim.wo.signcolumn = 'yes:1'
  require('lsp-status').on_attach(client)

  if vim.tbl_contains({ 'css', 'scss', 'sass' }, vim.bo.filetype) then
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'csscomplete#CompleteCSS')
  else
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end
  -- Mappings.
  local opts = { noremap = true, silent = true }
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  -- some are defined in vim/lua/plugins/lspsaga.lua
  -- buf_set_keymap('n', '<leader>K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', '<leader><C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap("n", "gh", "<cmd>lua require('lsp.functions').PeekDefinition()<CR>", opts)
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
  -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap("v", "<C-m><C-f>", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  -- buf_set_keymap("v", "<CR><C-f>", "", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", {noremap = true, silent = true})
  -- vim.api.nvim_buf_set_keymap(bufnr, "v", "f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", {noremap = true, silent = true})

  set_default_formatter_for_filetypes('solargraph', { 'ruby' })
  set_default_formatter_for_filetypes('null-ls', { 'javascript', 'vue' })
  set_default_formatter_for_filetypes('sumneko_lua', { 'lua' })

  function format_range_operator()
    local old_func = vim.go.operatorfunc
    _G.op_func_formatting = function()
      local start = vim.api.nvim_buf_get_mark(0, '[')
      local finish = vim.api.nvim_buf_get_mark(0, ']')
      vim.lsp.buf.range_formatting({}, start, finish)
      vim.go.operatorfunc = old_func
      _G.op_func_formatting = nil
    end
    vim.go.operatorfunc = 'v:lua.op_func_formatting'
    vim.api.nvim_feedkeys('g@', 'n', false)
  end

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gm", "<cmd>lua format_range_operator()<CR>", {noremap = true, silent = true})
end

return on_attach
