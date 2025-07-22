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
