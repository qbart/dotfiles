vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = { "Caddyfile" },
  callback = function()
    vim.bo.filetype = "caddyfile"
  end
})
