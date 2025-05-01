local loaded, lsp_signature = pcall(require, 'lsp_signature')

local M = {}

M.setup_lsp_signature = function()
  if not loaded then
    print('lsp_signature not installed. Run PackerInstall / PackerSync')
    return
  end

  lsp_signature.setup({
    bind = false,
    floating_window_off_y = -1,
    floating_window_off_x = -1,
    padding = " ",
    doc_lines = 0,
    hint_prefix = "",
    hint_scheme = "",
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 5,
    max_width = 1000,
    handler_opts = {
      border = "rounded"   -- double, rounded, single, shadow, none
    },
    toggle_key = nil,
  })
end

return M
