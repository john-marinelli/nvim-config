local directory = vim.fn.stdpath 'config' .. '/lsp'
local servers = {}

for filename, kind in vim.fs.dir(directory) do
  local name = kind == 'file' and filename:match '^(.*)%.lua$'
  if name then
    servers[#servers + 1] = name
  end
end

table.sort(servers)
for _, name in ipairs(servers) do
  local load_config = assert(loadfile(directory .. '/' .. name .. '.lua'))
  local config = load_config()
  assert(type(config) == 'table', 'LSP config must return a table: ' .. name)
  vim.lsp.config(name, config)
end
vim.lsp.enable(servers)
