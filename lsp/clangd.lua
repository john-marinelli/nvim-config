if vim.fn.has 'macunix' == 1 then
  -- Use the Xcode toolchain's clangd so its builtin headers and the active
  -- macOS SDK stay in sync. A standalone clangd can fail to resolve stdarg.h.
  return { cmd = { 'xcrun', 'clangd' } }
end

return {}
