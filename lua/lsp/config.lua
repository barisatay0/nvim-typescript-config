require("mason").setup()

require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "ts_ls" }, })

local null_ls = require("null-ls")

-- Set up null-ls for external formatters (e.g., Prettier)
null_ls.setup({
    sources =
    { null_ls.builtins.formatting.prettier, },
    on_attach = function(client, bufnr) end,
})

-- Set up ESLint LSP using the new vim.lsp.config API
vim.lsp.config.eslint = {
    cmd =
    { "vscode-eslint-language-server",
        "--stdio" },
    filetypes = { "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue"
        , "svelte" },
    root_markers = { ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.json",
        "eslint.config.js",
        "package.json" },
}

-- Combined format and fix on save
vim.api.nvim_create_autocmd("BufWritePre",
    {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue", "*.svelte" },
        callback = function(args)
            vim.lsp.buf.format({
                async = false,
                filter = function(client)
                    return client.name ==
                        "null-ls"
                end
            })
            local clients = vim.lsp.get_clients({ bufnr = args.buf })
            for _, client in ipairs(clients) do
                if client.name == "eslint" then
                    vim.lsp.buf.code_action({
                        context =
                        {
                            only =
                            { "source.fixAll.eslint" },
                            diagnostics =
                            {},
                        },
                        apply = true,
                    })
                    break
                end
            end
        end,
    })

vim.lsp.enable('eslint')
