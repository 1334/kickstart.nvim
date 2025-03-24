vim.keymap.set('n', '<M-[>', ':tabprevious<CR>', { silent = true })
vim.keymap.set('n', '<M-]>', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { silent = true, desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>`', ':e #<CR>', { silent = true, desc = 'Switch to last buffer' })
