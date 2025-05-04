--
-- finders
--
vim.keymap.set('n', '<leader>g', [[<cmd>FzfLua files<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>F', [[<cmd>FzfLua live_grep_native<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', [[<cmd>FzfLua blines<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', 'gr', [[<cmd>FzfLua lsp_references<CR>]], { silent = true, noremap = true })
-- vim.keymap.set('n', '<leader>s', [[<cmd>FzfLua lsp_document_symbols<CR>]], { noremap = true, silent = true })
-- silence
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'Q', [[<Nop>]], { silent = true })
vim.keymap.set('n', '<CR>', [[<cmd>noh<CR>]], { silent = true })
-- natural order consistent with i3
vim.keymap.set({ 'n', 'v' }, ';', 'l', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'l', 'k', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'k', 'j', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'j', 'h', { noremap = true })
-- faster nav
vim.keymap.set({ 'n', 'v' }, '<C-k>', '5j', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '5k', { noremap = true })
vim.keymap.set({ 'n' }, '<leader>aa', [[<cmd>Telescope telescope-alternate alternate_file<CR>]], { noremap = true })
vim.g.VM_maps = {
    ["Skip Region"] = '<C-x>',
    -- ["Select Cursor Down"] = '∆', -- Option+J,
    -- ["Select Cursor Up"]   = 'Ż', --  Option+K
}
-- window
vim.keymap.set('n', '<leader>ww',  function()
    local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { noremap = true, silent = true })
-- text edit
vim.keymap.set('n', '<leader>cs', [[<cmd>SplitjoinSplit<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cS', [[<cmd>SplitjoinJoin<CR>]], { noremap = true, silent = false })

vim.g.VM_theme = 'purplegray'
vim.keymap.set('n', "<C-e>", "<cmd>Neotree source=filesystem reveal=true<CR>", { noremap = true, silent = true })
vim.keymap.set('n', "<C-b>", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set('n', "<S-TAB>", "<cmd>Neotree source=buffers reveal=true position=float<CR>", { noremap = true , silent = true})
-- save file
vim.keymap.set('n', '<C-s>', [[<cmd>w<CR>]], { noremap = true })
-- quit
vim.keymap.set('n', '<C-q>', [[<cmd>q<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-q>', [[<cmd>qa!<CR>]], { noremap = true, silent = true })
-- splits
vim.keymap.set('n', '<leader>wk', [[<cmd>sp<CR>]], {})
vim.keymap.set('n', '<leader>wl', [[<cmd>vs<CR>]], {})
-- resize panes
vim.keymap.set('n', '<C-M-k>', [[<cmd>resize -3<CR>]], { noremap = true })
vim.keymap.set('n', '<C-M-l>', [[<cmd>resize +3<CR>]], { noremap = true })
vim.keymap.set('n', '<C-M-j>', [[<cmd>vertical resize -3<CR>]], { noremap = true })
vim.keymap.set('n', 'VIMKBRESR', [[<cmd>vertical resize +3<CR>]], { noremap = true }) -- <C-M-;> cant map to semicolon, so custom binding is done via alacritty/kitty
-- buffers
-- vim.keymap.set('n', '<TAB>', ':bn<CR>', { noremap = true })
-- vim.keymap.set('n', '<S-TAB>', ':bp<CR>', { noremap = true })
vim.keymap.set('n', '<leader>d', '<cmd>bd!<CR>', {})
-- line swapping
vim.keymap.set('n', '<S-k>', [[<cmd>m+<CR>==]], { noremap = true })
vim.keymap.set('n', '<S-l>', [[<cmd>m-2<CR>==]], { noremap = true })
vim.keymap.set('v', '<S-k>', [[<cmd>m'>+<CR>gv=gv]], { noremap = true })
vim.keymap.set('v', '<S-l>', [[<cmd>m-2<CR>gv=gv]], { noremap = true })
vim.keymap.set('i', '<C-S-k>', [[<Esc><cmd>m+<CR>==gi]], { noremap = true })
vim.keymap.set('i', '<C-S-l>', [[<Esc><cmd>m-2<CR>==gi]], { noremap = true })
-- diagnostic, refs, navigation outline
vim.keymap.set('n', '<leader><CR>', [[<cmd>Lspsaga peek_definition<CR>]], { silent = true, noremap = true })
vim.keymap.set('n', '`', [[<cmd>Lspsaga outline<CR>]], { silent = true, noremap = true })
-- vim.keymap.set('n', '`', [[/@]], { silent = false, noremap = true })
vim.keymap.set('n', '}}', vim.diagnostic.goto_prev, { silent = true, noremap = true })
vim.keymap.set('n', ']]', vim.diagnostic.goto_next, { silent = true, noremap = true })
-- vim.keymap.set("n", "<localleader>n", "[[<cmd>AerialToggle<CR>]]", { noremap = true, silent = true })
--
-- ai
vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
