return {
  'ggandor/leap.nvim',
  config = function()
    require 'leap'
    vim.keymap.set('n', 'gs', '<Plug>(leap-anywhere)')
  end,
}
