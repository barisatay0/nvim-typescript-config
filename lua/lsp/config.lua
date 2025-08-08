-- Set up Mason (LSP installer)
require("mason").setup()

-- Ensure these LSP servers are installed
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls" },
})



-- Set up null-ls for external formatters (e.g., Prettier)
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "json", "yaml", "lua", "markdown", "html", "css", "scss" },
        }),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
