local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "miloud.lsp.mason"
require("miloud.lsp.handlers").setup()
require "miloud.lsp.null-ls"
