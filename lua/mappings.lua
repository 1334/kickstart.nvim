vim.keymap.set('n', '<M-[>', ':tabprevious<CR>', { silent = true })
vim.keymap.set('n', '<M-]>', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { silent = true, desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>`', ':e #<CR>', { silent = true, desc = 'Switch to last buffer' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', 'D', vim.diagnostic.open_float, { desc = 'Show diagnostics in float' })

-- copy relative path to clipboard
vim.keymap.set('n', '<leader>fY', function()
  local full_path = vim.fn.expand '%'
  local pwd = vim.fn.getcwd()

  -- Ensure paths have consistent formatting
  full_path = vim.fn.fnamemodify(full_path, ':p')
  pwd = vim.fn.fnamemodify(pwd, ':p')

  -- Remove pwd from the beginning of full_path to get relative path
  local rel_path = string.sub(full_path, string.len(pwd) + 1)

  -- Remove leading slash if present
  if string.sub(rel_path, 1, 1) == '/' then
    rel_path = string.sub(rel_path, 2)
  end

  -- Copy to clipboard
  vim.fn.setreg('+', rel_path)
  vim.notify('Copied to clipboard: ' .. rel_path)
end, { desc = 'Copy relative file path' })

local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
vim.api.nvim_create_augroup('JSLogMacro', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'JSLogMacro',
  pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
  callback = function()
    -- stylua: ignore
    vim.fn.setreg('l', "y}iconsole.log('" .. esc .. "pa:', " .. esc .. "pa)" .. esc .. "o")
  end,
})
