-- Lualine setup
require("lualine").setup()

-- Tabline setup
require("tabline").setup({
    enable = true,
    options = {
        show_filename_only = true,
        show_tabs_always = false,
        show_devicons = true,
        show_bufnr = false,
        show_close_icon = true,
        modified_icon = "[+]",
        separator = "▏",
    },
})
vim.cmd("set showtabline=2")

-- Gitsigns setup
require("gitsigns").setup({
    signs = {
        add          = { hl = "GitGutterAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change       = { hl = "GitGutterChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete       = { hl = "GitGutterDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete    = { hl = "GitGutterDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitGutterChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    update_debounce = 100,
    sign_priority = 6,
})

-- Indent Blankline setup
require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
    },
    exclude = {
        filetypes = {
            "help",
            "terminal",
            "dashboard",
            "lazy",
            "lspinfo",
            "TelescopePrompt",
        },
    },
})
