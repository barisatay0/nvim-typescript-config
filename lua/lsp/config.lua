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

-- Set up ESLint LSP using the new vim.lsp.config API
vim.lsp.config.eslint = {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
    root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js", "package.json" },
}

-- Enable ESLint with auto-fix on save
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "eslint" then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                command = "EslintFixAll",
            })
        end
    end,
})

-- Enable ESLint for current buffer types
vim.lsp.enable('eslint')
