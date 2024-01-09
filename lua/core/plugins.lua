local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'

    ---------------------- Dependencias ----------------------
    use 'nvim-lua/plenary.nvim'



    ---------------------- Auto-completar ---------------------
    use 'hrsh7th/cmp-buffer'   -- nvim-cmp source for buffer words
    use("hrsh7th/cmp-cmdline")
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'     -- Completion
    use { 'neoclide/coc.nvim', branch = 'release' }


    ------------------ Server Config --------------------------
    use 'neovim/nvim-lspconfig' -- LSP
    use 'onsails/lspkind-nvim'  -- vscode-like pictograms
    use 'L3MON4D3/LuaSnip'
    use 'nvimdev/lspsaga.nvim'  -- LSP UIs


    ---------------- Formmater -------------------------------
    use 'jose-elias-alvarez/null-ls.nvim'



    ---------------- Hightlight ------------------------------
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }


    --------------- Server Installer -------------------------
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'



    ------------- Terminal and Code runner -------------------
    use 'CRAG666/code_runner.nvim'
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end }



    ---------------- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'



    --------------- Utilitarios ------------------
    use 'windwp/nvim-autopairs'
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'norcalli/nvim-colorizer.lua'
    use 'windwp/nvim-ts-autotag'
    use { 'numToStr/Comment.nvim',
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring'
      },
      config = function()
        require('Comment').setup()
      end
    }



    ----------- UI --------------------------
    use 'rcarriga/nvim-notify'
    use "lukas-reineke/indent-blankline.nvim"
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use {
      'goolord/alpha-nvim',
      config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      end
    }



    ---------- Git --------------------------
    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim' -- For git blame & browse



    ---------- Themes ---------------------
    use "craftzdog/solarized-osaka.nvim"
  end,
  ----------------------------------------------------------------------------------
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
