-- Install packer if missing
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  ---------------------------------------------------------------------
  -- Base plugins
  ---------------------------------------------------------------------
  use {
    'ThePrimeagen/harpoon' ,
    requires = { {'nvim-lua/plenary.nvim'} },
  } -- Functions like fancy tabs
  use 'tpope/vim-commentary' -- Code comment support
  use 'tpope/vim-fugitive' -- Git integration
  use 'tpope/vim-repeat' -- Update repeat '.' functionality
  use 'tpope/vim-sensible' -- Defaults
  use 'tpope/vim-sleuth' -- Buffer defaults
  use 'tpope/vim-surround' -- Shortcuts for brackets/quotes/tags

  ---------------------------------------------------------------------
  -- Nice-to-have plugins
  ---------------------------------------------------------------------
  use 'Yggdroot/indentLine' -- Visually represent initial line space tabs
  use 'lewis6991/gitsigns.nvim' -- Git indications in the line gutter
  use 'christoomey/vim-tmux-navigator' -- vim/tmux navigation integration
  use 'gpanders/editorconfig.nvim' -- Editorconfig defaults
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  ---------------------------------------------------------------------
  -- LSP / IDE
  ---------------------------------------------------------------------
  -- List warning/error handling
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  -- Fuzzy find
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
      },
    }
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Testing
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'mfussenegger/nvim-dap',
      'haydenmeade/neotest-jest',
      'nvim-neotest/neotest-plenary'
    }
  }

  -- Language Server Client
  use {
    'neovim/nvim-lspconfig',
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Code completion
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',

      -- Snippets for code completion
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    }
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    }
  }

  -- use 'stephenway/postcss.vim' -- postcss syntax support

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
