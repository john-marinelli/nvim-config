local ensure_installed = {
  'bash',
  'c',
  'diff',
  'html',
  'javascript',
  'latex',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'mojo',
  'query',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    'dmitry-salin/tree-sitter-mojo',
  },
  config = function()
    local function register_mojo_parser()
      require('nvim-treesitter.parsers').mojo = {
        install_info = {
          url = 'https://github.com/dmitry-salin/tree-sitter-mojo',
          branch = 'main',
        },
      }
    end

    register_mojo_parser()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TSUpdate',
      callback = register_mojo_parser,
    })

    local query_file = assert(io.open(vim.fn.stdpath 'data' .. '/lazy/tree-sitter-mojo/nvim-queries/mojo/highlights.scm', 'r'))
    local highlights = query_file:read '*a'
    query_file:close()
    vim.treesitter.query.set('mojo', 'highlights', highlights)

    local treesitter = require 'nvim-treesitter'
    treesitter.setup()
    treesitter.install(ensure_installed):wait(300000)

    local configured = {}
    for _, language in ipairs(ensure_installed) do
      configured[language] = true
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
      callback = function(event)
        local filetype = vim.bo[event.buf].filetype
        local language = vim.treesitter.language.get_lang(filetype) or filetype
        if not configured[language] then
          return
        end

        vim.treesitter.start(event.buf, language)
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
