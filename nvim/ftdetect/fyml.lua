vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = { "*.fyml", "*.fyml.tpl" },
  callback = function()
    vim.bo.filetype = "yaml"
  end
})
