return {
  'LukasPietzschmann/telescope-tabs',
  config = function()
    require('telescope').load_extension 'telescope-tabs'
    require('telescope-tabs').setup {}
  end,
  keys = {
    { '<leader>st', '<cmd>Telescope telescope-tabs list_tabs<cr>', desc = 'Telescope tabs' },
  },
  dependencies = { 'nvim-telescope/telescope.nvim' },
}
