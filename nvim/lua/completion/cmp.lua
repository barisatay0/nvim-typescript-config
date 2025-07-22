-- Configure autocompletion
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Expand snippet
        end,
    },
    sources = {
        { name = "nvim_lsp" }, -- LSP source
        { name = "luasnip" },  -- Snippet source
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),        -- Next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),      -- Previous suggestion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    }),
})
