# Typenvim

This repository provides a Neovim configuration optimized for TypeScript and JavaScript development.  
It includes language server support, autocompletion, formatting, themes, and productivity plugins.

---

## Features

### Language Server Protocol (LSP)

- Managed with [mason.nvim](https://github.com/williamboman/mason.nvim).
- Ensures installation of `lua_ls` and `ts_ls`.
- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) integrated with Prettier for automatic formatting on save.

### Autocompletion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for intelligent completion.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) for snippet expansion.
- Sources include LSP, snippets, and filesystem paths.
- Tab and Shift+Tab mapped for navigating suggestions.

### Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) – plugin manager
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) – fuzzy finder and search
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) – status line
- [tabline.nvim](https://github.com/kdheepak/tabline.nvim) – buffer and tab management
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) – Git integration
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) – indentation guides
- [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) – color schemes (configured with `carbonfox`)

### Editor Settings

- Line numbers enabled
- Tabs converted to spaces, indent size = 4
- System clipboard integration
- True color support
- Column indicator at 80 characters
- Line wrapping disabled

### Key Mappings

Key mappings are defined in `lua/settings/keymap.lua`.  
Below is a simplified reference:

- **Leader + e**: Show diagnostics
- **Ctrl + Space**: Trigger completion menu
- **Ctrl + P**: Find files
- **Leader + fg**: Search in files (live grep)
- **Leader + fb**: List open buffers
- **Leader + fh**: Search help tags
- **Leader + fr**: Show recent files
- **Leader + fc**: List available commands
- **Leader + gf**: Find Git files
- **Leader + gc**: Show Git commit history
- **Leader + gb**: Switch Git branches
- **Leader + lr**: Find references to the current symbol
- **Leader + ls**: List symbols in the current document

Note: The `<Leader>` key is `\` by default, unless you set it differently.

---

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/barisatay0/typenvim
   ```
2. Copy it into your Neovim configuration directory:
   ```bash
   cp -r typenvim/* ../your-config-file/nvim/
   ```
3. Start Neovim:
   ```bash
   nvim
   ```

### Optional Packages

1. Install prettier as a global
   ```bash
    npm install -g prettier
   ```

Notes :

- Prettier is set as the default formatter for JavaScript, TypeScript, JSON, YAML, Markdown, HTML, CSS, and SCSS.
- LSP servers are installed automatically via Mason if not already present.
- Node.js must be installed on your system. Mason will fail to install or run certain language servers (such as ts_ls) if Node.js is missing.
