-- Set up lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Path to lazy.nvim
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Install and configure plugins
require("lazy").setup({
    { "mhinz/vim-startify" },      -- Start screen
    { "EdenEast/nightfox.nvim" },  -- Color schemes (includes 'carbonfox')
    "nvim-lualine/lualine.nvim",   -- Status line
    "nvim-tree/nvim-tree.lua",     -- File explorer
    "nvim-tree/nvim-web-devicons", -- File icons

    -- LSP and completion
    "neovim/nvim-lspconfig",    -- LSP config
    "hrsh7th/nvim-cmp",         -- Autocompletion
    "hrsh7th/cmp-nvim-lsp",     -- LSP source for cmp
    "L3MON4D3/LuaSnip",         -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet source for cmp

    -- Fuzzy finder
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Mason (LSP installer)
    { "williamboman/mason.nvim",       build = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",

    -- Formatter / Linter (null-ls)
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    }
})
