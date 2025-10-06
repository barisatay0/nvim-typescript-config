-- Configure autocompletion
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Check if a snippet is expandable or jumpable
local has_words_before = function()
    unpack = unpack or table.unpack
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- Completion window appearance
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    --  Completion sources with duplicates filtering
    sources = cmp.config.sources({
        {
            name = "nvim_lsp",
            priority = 1000,
        },
        { name = "luasnip", priority = 750 },
        { name = "path",    priority = 250 },
    }),

    --  Performance and duplicate settings
    performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
        confirm_resolve_timeout = 80,
        async_budget = 1,
        max_view_entries = 200,
    },


    --  Completion behavior settings
    completion = {
        completeopt = "menu,menuone,noinsert",
    },

    -- Enhanced key mappings
    mapping = cmp.mapping.preset.insert({
        -- Navigate completion items
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),

        -- Scroll documentation
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Show/hide completion
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        -- Confirm selection
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),

        -- Smart Tab behavior
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    -- Formatting for completion items
    formatting = {
        duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 1,
            luasnip = 1,
        },
        format = function(entry, vim_item)
            -- Kind icons
            local kind_icons = {
                Text = "",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰇽",
                Variable = "󰂡",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰅲",
            }

            -- Set the icon
            vim_item.kind = string.format('%s %s',
                kind_icons[vim_item.kind], vim_item.kind)

            --  Limit entry text length to avoid duplicates
            if string.len(vim_item.abbr) > 25 then
                vim_item.abbr = string.sub(vim_item.abbr, 1, 25) .. "..."
            end

            -- Set the source
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
                buffer = "[Buf]",
                path = "[Path]",
            })[entry.source.name]

            return vim_item
        end
    },

    -- Experimental features
    experimental = {
        ghost_text = true,
    },
})

-- Set configuration for specific filetype
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (search completion)
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (command-line completion)
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
