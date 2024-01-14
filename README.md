# Neovim Setup

### Setup Requires

- [Neovim](https://neovim.io/) (Version 0.9 or Later)
- [Nerd Font](https://www.nerdfonts.com/) - Eu uso a FireCode
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [MinGW](https://www.mingw-w64.org/)

## Observações

Há uma configuração já pronta do coc, para que caso por alguma eventualidade eu mude, não precisar reconfigurar.

## Plugins

#### Plugin Manager

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - Amazing plugin manager

#### Dependency For Other Plugins

- [nvim-lua/plenary](https://github.com/nvim-lua/plenary.nvim) - Useful lua functions other plugins use

#### File Explorer

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

#### VS Code Like Icons

- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

#### Neovim Greeter

- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

#### Status Line

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

#### Fuzzy Finder

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy Finder
- [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)

#### Autocompletion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Completion source for text in current buffer
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - Completion source for file system paths
- [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim) - Vs Code Like Icons for autocompletion

#### Snippets

- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine

#### Managing & Installing Language Servers, Linters & Formatters

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

#### LSP Configuration

- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridges gap b/w mason & lspconfig
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easy way to configure lsp servers
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Smart code autocompletion with lsp
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim)
- [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)

#### Themes

- [shaunsingh/nord.nvim](https://github.com/shaunsingh/nord.nvim)
- [craftzdog/solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim)

#### Formatting & Linting

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Easy way to configure formatters
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint) - Easy way to configure linters
- [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - Auto install linters & formatters on startup

#### Comments

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - toggle comments with "gc"
- [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - Requires treesitter

#### Treesitter Syntax Highlighting, Autoclosing, Text Objects, ...

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configuration
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autoclose brackets, parens, quotes, etc...
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Autoclose tags
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

#### Notify

- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)

#### Code Runner and terminal

- [CRAG666/code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

#### Git

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [dinhhuy258/git.nvim](https://github.com/dinhhuy258/git.nvim)
