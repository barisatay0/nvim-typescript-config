-- Key map settings
--
--
-- ! <leader> default is mostly '\' !
--
--
-- <leader-e>: Show diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- <ctrl-space>: Manually trigger completion menu
vim.keymap.set("i", "<C-Space>", function() require("cmp").complete() end)

-- <ctrl-p>: Find files
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')

-- <leader-fg>: Live grep (search in file contents)

vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')

-- <leader-fb>: Find buffers (search open buffers)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')

-- <leader-fh>: Help tags (search help documentation)
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- <leader-fr>: Recent files (find recently opened files)
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>')

-- <leader-fc>: Commands (search available commands)
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope commands<cr>')

-- <leader-gf>: Fing git files
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>')

-- <leader-gc>: Browse git commit history
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')

-- <leader-gb>: Switch between git branches
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')

-- <leader-lr>:Find all references to symbol under cursor
vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>')

-- <leader-ls>: Find symbols in current document
vim.keymap.set('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')
