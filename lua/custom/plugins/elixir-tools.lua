return {
  'elixir-tools/elixir-tools.nvim',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local elixir = require 'elixir'
    local lspconfig = require 'lspconfig'

    -- Setup Expert LSP (custom configuration since it's not in lspconfig yet)
    local configs = require 'lspconfig.configs'
    local util = require 'lspconfig.util'

    -- Register Expert LSP if not already registered
    if not configs.expert then
      configs.expert = {
        default_config = {
          cmd = { 'expert' },
          filetypes = { 'elixir', 'eelixir', 'heex' },
          root_dir = util.root_pattern('mix.exs', '.git'),
          settings = {},
        },
        docs = {
          description = 'Expert Elixir Language Server',
        },
      }
    end

    -- Setup Expert LSP
    lspconfig.expert.setup {
      on_attach = function(client, bufnr)
        -- Elixir-specific keymaps
        vim.keymap.set('n', '<leader>ep', ':ElixirFromPipe<cr>', { buffer = bufnr, desc = 'Extract from pipe' })
        vim.keymap.set('n', '<leader>et', ':ElixirToPipe<cr>', { buffer = bufnr, desc = 'Convert to pipe' })
        vim.keymap.set('v', '<leader>em', ':ElixirExpandMacro<cr>', { buffer = bufnr, desc = 'Expand macro' })

        -- Set Elixir-specific buffer options
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
      end,
    }

    elixir.setup {
      -- Disable built-in LSPs to use Expert instead
      nextls = {
        enable = false,
      },
      -- Disable ElixirLS to avoid conflicts
      elixirls = {
        enable = false,
      },
      -- Enable credo for better linting
      credo = { enable = true },
      projectionist = {
        enable = true,
        heuristics = {
          phoenix = true,
          elixir = true,
        },
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
