return {
  'catppuccin/nvim',
  name = 'catppuccin',
  opts = {},
  config = function()
    require('catppuccin').setup {
      flavour = 'frappe',
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
  priority = 1000,
}
