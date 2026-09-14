return {
  cmd = { 'pixi', 'run', 'mojo-lsp-server' },
  filetypes = { 'mojo' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, 'pixi.toml')
    if root then
      on_dir(root)
    end
  end,
}
