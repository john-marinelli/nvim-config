return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.maplocalleader = ' '

    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_method = 'latexmk'

    vim.g.vimtex_quickfix_mode = 0

    vim.opt.conceallevel = 2
    vim.g.tex_conceal = 'abdmg'
  end,
}
