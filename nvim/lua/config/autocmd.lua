local function augroup(name)
  return vim.api.nvim_create_augroup("___" .. name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup("YankHighlight"),
    callback = function()
        vim.highlight.on_yank()
    end,
    pattern = '*',
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.wo.signcolumn = 'yes:1'
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufnr = ev.buf

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
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
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
    vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.code_action, opts)
    -- vim.lsp.buf.declaration
    -- vim.lsp.buf.implementation
    -- vim.lsp.buf.type_definition
    -- vim.lsp.buf.references
    -- vim.lsp.buf.code_action
    --
    --
    -- Open snippet file for current filetype
    vim.keymap.set("n", "<leader>es", function()
      local filetype = vim.bo.filetype
      local snippet_path = vim.fn.stdpath("config") .. "/snippets/" .. filetype .. ".snippets"

      -- Open the file
      vim.cmd("edit " .. snippet_path)
    end, { desc = "Edit snippets for current filetype" })
  end,
})


-- vim.api.nvim_create_autocmd('ColorScheme', {
--   -- pattern = 'sequoia',
--   pattern = '*',
--   -- group = ...,
--   callback = function()
--     vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
--       fg = '#ff00ff',
--       ctermfg = 8,
--       force = true
--     })
--   end
-- })
