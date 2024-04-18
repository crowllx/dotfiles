-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
vim.g.mapleader = "\\"
require("lazy").setup({
    { import = "wshine.nvim-tree" },
    'vimwiki/vimwiki',
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons", },
    },
    'MunifTanjim/nui.nvim',
    'rebelot/kanagawa.nvim',
    { "rose-pine/neovim",         name = "rose-pine" },
    'tpope/vim-fugitive',
    { 'folke/trouble.nvim', dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
    'nvim-treesitter/playground',
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    },
    {
        'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-treesitter/nvim-treesitter-context',
    'mbbill/undotree',
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'folke/zen-mode.nvim',
    {
        'kylechui/nvim-surround',
        Event = "VeryLazy",
        config = function()
            require('nvim-surround').setup({})
        end
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    }

})
require('rose-pine').setup({
    variant = "auto",
    dark_variant = "main",
    extend_background_behind_borders = true,
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
    highlight_groups = {
        String = { fg = "#98BB6C" },
    },
    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        if highlight.fg == palette.text then
            --highlight.fg = "#ADBAC7"
        end
    end,
})
require('kanagawa').setup({
    overrides = function(colors)
        local theme = colors.theme
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
    end,
    commentStyle = { italic = false },
    keywordStyle = { italic = false },
    transparent = false,

    colors = {
        palette = {
            fujiWhite = "#ADBAC7",
            oldWhite = "#ADBAC7",
            --carpYellow = "#ADBAC7",
            --boatYellow1 = "#ADBAC7",
            --boatYellow2 = "#ADBAC7"
        },
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    }
})
vim.cmd("colorscheme rose-pine-main")
