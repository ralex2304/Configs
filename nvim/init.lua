local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'RaafatTurki/hex.nvim'
Plug 'bluz71/vim-nightfly-colors'
Plug 'johnfrankmorgan/whitespace.nvim'
Plug 'bluz71/nvim-linefly'
Plug 'kdheepak/lazygit.nvim'
Plug 'mbbill/undotree'

vim.call('plug#end')

require("config")
require("config_lsp")
require("config_telescope")
require("config_cmp")
require("config_theme")
require("config_whitespace")
require("config_undotree")
require("config_linefly")
require("config_hex")
