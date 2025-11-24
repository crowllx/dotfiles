-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
require("lazy").setup({
    { import = "plugins" },
    'vimwiki/vimwiki',
    'tpope/vim-commentary',
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons", },
    },
    'nvim-treesitter/playground',
    'tpope/vim-fugitive',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    }
})
vim.cmd.colorscheme("vague")
