local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lualine/lualine.nvim'       -- Statusline
    use 'nvim-lua/plenary.nvim'           -- Common utilities
    use 'onsails/lspkind-nvim'            -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
    use("hrsh7th/cmp-cmdline")
    use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'                -- Completion
    use 'neovim/nvim-lspconfig'           -- LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    -- If you are using Packer
    use 'shaunsingh/nord.nvim'
    use 'CRAG666/code_runner.nvim'
    -- use { 'CRAG666/betterTerm.nvim' }
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end }
    use({
      'rebelot/terminal.nvim',
      config = function()
        require("terminal").setup()
      end
    })
    use 'nvimdev/lspsaga.nvim' -- LSP UIs

    use "craftzdog/solarized-osaka.nvim"
    use 'L3MON4D3/LuaSnip'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use { 'numToStr/Comment.nvim',
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring'
      },
      config = function()
        require('Comment').setup()
      end
    }
    use 'rcarriga/nvim-notify'
    use {
      'goolord/alpha-nvim',
      config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      end
    }

    use 'norcalli/nvim-colorizer.lua'
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })
    use "lukas-reineke/indent-blankline.nvim"
    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim' -- For git blame & browse
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
