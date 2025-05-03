vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = { "*.tf", "*.tftpl" },
  callback = function()
    vim.bo.filetype = "terraform"
  end
})
