return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = true,
  keys = {
    { '<leader>gg', ':Neogit<CR>', desc = 'Neogit' },
    { '<leader>gL', ':NeogitLogCurrent<CR>', desc = 'Current file Git log' },
  },
}
