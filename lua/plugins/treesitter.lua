return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    {
      'dmitry-salin/tree-sitter-mojo',
      config = function(plugin)
        local query_file = assert(io.open(plugin.dir .. '/nvim-queries/mojo/highlights.scm', 'r'))
        local highlights = query_file:read '*a'
        query_file:close()
        vim.treesitter.query.set('mojo', 'highlights', highlights)
      end,
    },
  },
  config = function(_, opts)
    local parsers = require('nvim-treesitter.parsers').get_parser_configs()
    parsers.mojo = {
      install_info = {
        url = 'https://github.com/dmitry-salin/tree-sitter-mojo',
        files = { 'src/parser.c', 'src/scanner.c' },
        branch = 'main',
      },
      filetype = 'mojo',
    }

    require('nvim-treesitter.configs').setup(opts)
  end,
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'mojo', 'query', 'vim', 'vimdoc', 'javascript', 'typescript', 'tsx' },
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
