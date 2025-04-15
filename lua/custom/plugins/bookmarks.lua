return {
  'LintaoAmons/bookmarks.nvim',
  dependencies = {
    { 'kkharji/sqlite.lua' },
    { 'nvim-telescope/telescope.nvim' },
    { 'stevearc/dressing.nvim' }, -- optional: better UI
  },
  config = function()
    local opts = {} -- check the "./lua/bookmarks/default-config.lua" file for all the options
    require('bookmarks').setup(opts) -- you must call setup to init sqlite db
  end,
  keys = {
    { '<leader>B', '', desc = '+[B]ookmarks' },
    { '<leader>Bm', '<cmd>BookmarksMark<cr>', mode = { 'n', 'v' }, desc = 'Mark current line into active BookmarkList.' },
    { '<leader>Bg', '<cmd>BookmarksGoto<cr>', mode = { 'n', 'v' }, desc = 'Go to bookmark at current active BookmarkList' },
    { '<leader>Bc', '<cmd>BookmarksCommands<cr>', mode = { 'n', 'v' }, desc = 'Find and trigger a bookmark command.' },
    {
      '<leader>Bd',
      function()
        require('bookmarks.commands').delete_mark_of_current_file()
      end,
      mode = { 'n', 'v' },
      desc = 'Clear current bookmark',
    },
  },
}
