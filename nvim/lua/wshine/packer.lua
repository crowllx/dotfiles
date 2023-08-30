-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'MunifTanjim/nui.nvim'

    -- Themes
    use 'rmehri01/onenord.nvim'
    require('onenord').setup({
        disable = {
            theme = 'dark',
            background = true,
            cursorline = true,
            eob_lines = true
        }
    })
    use 'folke/tokyonight.nvim'
    require("tokyonight").setup({
        transparent = true
    })
    use 'rebelot/kanagawa.nvim'
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
        transparent = true,

        colors = {
            palette = {
                fujiWhite = "#ADBAC7",
                oldWhite = "#ADBAC7",
                carpYellow = "#ADBAC7",
                boatYellow2 = "#ADBAC7"
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
    use 'marko-cerovac/material.nvim'
    require('material').setup({
        contrast = {
            cusor_line = false
        },
        styles = {
            comments = {}
        },
        high_visibility = {
            lighter = true,
            darker = true,
            deep_ocean = true,
            palenight = true
        },
        disable = {
            colored_cursor = true,
            background = true
        },
        plugins = {
            "telescope",
            "trouble",
            "nvim-cmp"
        },
        --test comments
        custom_colors = function(colors)
            colors.syntax.comments = '#545454'
        end
    })
    vim.g.material_style = "oceanic"
    use 'shaunsingh/nord.nvim'
    --nord theme
    vim.g.nord_disable_background = true

    use { "catppuccin/nvim", as = "catppuccin"}
    vim.cmd 'colorscheme kanagawa-wave'
    -- Plugins
    -- telescope and requirements
    use('nvim-lua/plenary.nvim')
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    --git plugin
    use('tpope/vim-fugitive')
    use {
        "folke/trouble.nvim",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('trouble').setup()
        end
    }

    use('nvim-treesitter/playground')
    use { 'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }
    use('nvim-treesitter/nvim-treesitter-context')
    use('mbbill/undotree')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    }
    use('folke/zen-mode.nvim')
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
end)
