--
-- finders
--
vim.keymap.set('n', '<leader>j', require('fzf-lua').files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>F', require('fzf-lua').live_grep_native, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', require('fzf-lua').help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', require('fzf-lua').blines, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', require('fzf-lua').lsp_live_workspace_symbols, { noremap = true, silent = true })
-- line
-- vim.api.nvim_set_keymap('n', 'n', [[:set number!<CR>]], {})
-- packer
vim.keymap.set('n', '<C-p>i', [[<cmd>PackerInstall<CR>]], {})
vim.keymap.set('n', '<C-p>u', [[<cmd>PackerUpdate<CR>]], {})
vim.keymap.set('n', '<C-p>s', [[<cmd>PackerSync<CR>]], {})
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
vim.keymap.set({ 'n' }, '<C-f>', '<cmd>HopPattern<CR>', { noremap = true })
vim.keymap.set({ 'n' }, '<leader>a', [[<cmd>Telescope telescope-alternate alternate_file<CR>]], { noremap = true })
vim.g.VM_maps = {
    ["Skip Region"] = '<C-x>',
    -- ["Select Cursor Down"] = '∆', -- Option+J,
    -- ["Select Cursor Up"]   = 'Ż', --  Option+K
}

vim.g.VM_theme = 'purplegray'
vim.keymap.set('n', "<C-e>", "<cmd>Neotree source=filesystem reveal=true position=float<CR>", { noremap = true })
vim.keymap.set('n', "<C-g>", "<cmd>Neotree source=git_status reveal=true position=float<CR>", { noremap = true })
vim.keymap.set('n', "<S-TAB>", "<cmd>Neotree source=buffers reveal=true position=float<CR>", { noremap = true })
-- save file
vim.keymap.set('n', '<C-s>', [[<cmd>w<CR>]], { noremap = true })
-- quit
vim.keymap.set('n', '<C-q>', [[<cmd>q<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<M-w>", function()
    local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })
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
vim.keymap.set("n", "``", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "`t", "<cmd>TodoTrouble<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-CR>", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "<localleader>u", require('fzf-lua').lsp_references, { silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<localleader><localleader>", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "]j", vim.diagnostic.goto_prev, { silent = true, noremap = true })
vim.keymap.set("n", "];", vim.diagnostic.goto_next, { silent = true, noremap = true })
--vim.keymap.set("n", "n", require("aerial").toggle, { noremap = true, silent = true })
-- extras
vim.keymap.set('n', '<leader>ie', [[<cmd>Telescope emoji<CR>]], { noremap = true })
-- git
vim.keymap.set('n', '<leader>gl', require('fzf-lua').git_commits, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gbr', require('fzf-lua').git_branches, {
    noremap = true,
    silent = true,
})
vim.keymap.set('n', '<C-j>', [[<cmd>Lspsaga diagnostic_jump_prev<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<C-;>', [[<cmd>Lspsaga diagnostic_jump_next<CR>]], { noremap = true, silent = true })

