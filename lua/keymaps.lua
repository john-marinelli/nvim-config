vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-e>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('t', '<C-w><C-w>', '<C-\\><C-n><C-w><C-w>', { desc = 'Cycle to next window' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>e', ':Terminal<CR>', { desc = '[E]xecute terminal' })
vim.keymap.set('n', '<leader>cw', ':bd<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>cc', ':qa<CR>', { desc = 'Close nvim' })

vim.keymap.set('n', '<leader>oo', ':Obsidian<CR>')
vim.keymap.set('n', '<leader>os', ':Obsidian search<CR>')
vim.keymap.set('n', '<leader>od', ':Obsidian today<CR>', { desc = 'Obsidian [D]aily note' })
vim.keymap.set('n', '<leader>oi', function()
  local title = vim.fn.input('Idea title: ')
  if title ~= '' then
    vim.cmd('Obsidian new_from_template ' .. title .. ' idea')
  end
end, { desc = 'Obsidian new [I]dea' })
vim.keymap.set('n', '<leader>on', function()
  local title = vim.fn.input('Note title: ')
  if title ~= '' then
    vim.cmd('Obsidian new_from_template ' .. title .. ' note')
  end
end, { desc = 'Obsidian [N]ew note' })

vim.keymap.set('i', 'jk', '<Esc>')
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
