-- Basic editor settings
vim.opt.number = true             -- Show line numbers
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.shiftwidth = 4            -- Indent width
vim.opt.tabstop = 4               -- Tab width
vim.opt.termguicolors = true      -- Enable true color support
vim.opt.mouse = 'a'               -- Enable mouse in all modes
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.wrap = false              -- Disable line wrapping


-- Key map settings

-- Show diagnostic (LSP) error messages under the cursor using <leader>e
-- By default, <leader> is '\' unless you override it with `vim.g.mapleader'
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Manually trigger completion menu (e.g. when returning to a word)
vim.keymap.set("i", "<C-Space>", function()
    require("cmp").complete()
end)
