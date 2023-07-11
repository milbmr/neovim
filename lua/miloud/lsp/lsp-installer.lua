local on_attach = require("miloud.lsp.handlers").on_attach
local capabilities = require("miloud.lsp.handlers").capabilities

require("miloud.lsp.handlers").setup()
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
    return
end

local lspconfig = require("lspconfig")
local servers = {
    "cssls",
    -- "emmet_ls",
    -- "tailwindcss",
    "lua_ls",
    "eslint",
    "html",
    "bashls",
    "cssmodules_ls",
    "jsonls",
    "yamlls",
    "tailwindcss",
    -- "intelephense",
    -- "dockerls",
}
local lspInlays = { "tsserver" }
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Disable virtual_text
                virtual_text = false,
            }),
        },
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
            },
        },
    })
end

for _, lsp in ipairs(lspInlays) do
    lspconfig[lsp].setup({
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            require("lsp-inlayhints").on_attach(client, bufnr)
        end,

        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Disable virtual_text
                virtual_text = false,
            }),
        },
        capabilities = capabilities,
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    })
end


typescript.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
})
