# Configuração do Neovim

Este é o meu repositório contendo minha configuração pessoal do Neovim. Aqui está uma visão geral dos plugins e configurações que estou usando para melhorar minha experiência de edição de texto.

## Requisitos

- [Neovim](https://neovim.io/) >= 0.5.0
- [lazy.nvim](https://github.com/folke/lazy.nvim) (gerenciador de plugins)

## Plugins Instalados

- [Comment.nvim](https://github.com/numToStr/Comment.nvim): Facilita a manipulação de comentários no código.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip): Um mecanismo de expansão de código escrito em Lua.
- [alpha-nvim](https://github.com/goolord/alpha-nvim): Oferece uma interface mais bonita e personalizável.
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer): Plugin para completar texto a partir do conteúdo de buffers abertos.
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): Integração do nvim-cmp com o LSP.
- [cmp-path](https://github.com/hrsh7th/cmp-path): Oferece completamento de caminhos de arquivo para o nvim-cmp.
- [code_runner.nvim](https://github.com/CRAG666/coderunner.nvim): Executa código do Neovim.
- [conform.nvim](https://github.com/stevearc/conform.nvim): Formata código automaticamente de acordo com um conjunto de regras definidas.
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets): Conjunto amigável de snippets para diversos idiomas.
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Adiciona indicadores de git na barra lateral.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Exibe linhas em branco com indentação.
- [lspkind.nvim](https://github.com/onsails/lspkind-nvim): Adiciona ícones a completions e símbolos LSP.
- [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim): Aumenta as capacidades do LSP do Neovim.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): Statusline configurável escrita em Lua.
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Configurações do LSP para o Mason.
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim): Instalador de ferramentas para o Mason.
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim): Plugin para reduzir o brilho do fundo em janelas flutuantes.
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim): Oferece componentes de IU para Neovim.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): Adiciona pares de delimitadores automáticos.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Framework para autocompletar, escrito em Lua.
- [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua): Colorização de código em tempo real.
- [nvim-lint](https://github.com/mfussenegger/nvim-lint): Linter para o Neovim.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Configurações do LSP para o Neovim.
- [nvim-notify](https://github.com/rcarriga/nvim-notify): Notificações do sistema para o Neovim.
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua): Gerenciador de arquivos para o Neovim.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Análise de sintaxe para o Neovim.
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects): Text objects para árvores sintáticas do Neovim.
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): Adiciona tags HTML automaticamente.
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring): Define automaticamente o formato de comentário de acordo com o contexto.
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons): Adiciona ícones a arquivos e diretórios no Neovim.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): Conjunto de utilitários Lua para o Neovim.
- [solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim): Tema para o Neovim baseado no Solarized.
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim): Navegador de arquivos para o Telescope.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Extensível fuzzy finder para o Neovim.
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim): Terminal flutuante para o Neovim.
- [web-devicons](https://github.com/kyazdani42/web-devicons): Ícones para a barra de status do Neovim.

## Instalação

1. Certifique-se de ter o Neovim instalado em sua máquina.
2. Instale o gerenciador de plugins [lazy.nvim](https://github.com/folke/lazy.nvim).
3. Clone este repositório para o diretório de configuração do Neovim (normalmente `~/.config/nvim/`
