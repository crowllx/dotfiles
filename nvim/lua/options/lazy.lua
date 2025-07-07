-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
require("lazy").setup({
    { import = "plugins" },
    {
        'mellow-theme/mellow.nvim'
    },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local p = require("oldworld.palette")
            require("oldworld").setup({
                terminal_colors = true,
                variant = "cooler",
                highlight_overrides = {
                    Normal = { bg = 'NONE' },
                    NormalNC = { bg = 'NONE' },
                    NormalFloat = { bg = 'NONE' },
                    TelescopeNormal = { bg = 'NONE' },
                    TelescopeBorder = { fg = p.gray4, bg = 'NONE' },
                    TelescopePromptNormal = { bg = 'NONE' },
                    TelescopePromptBorder = { fg = p.gray4, bg = 'NONE' },
                    TelescopePreviewTitle = { bg = 'NONE' },
                    TelescopeResultsTitle = { bg = 'NONE' },
                    SignColumn = { bg = 'NONE' },
                },
                integrations = {
                    telescope = true,
                    cmp = true,
                }
            })
        end
    },
    {
        'rmehri01/onenord.nvim',
        config = function()
            local colors = require("onenord.colors").load()
            require("onenord").setup({
                fade_nc = true,
                disable = {
                    background = true,
                    float_background = true,
                    cursor_line = false
                },
                custom_highlights = {
                    ["@type"] = { fg = colors.light_green },
                    ["@module"] = { fg = colors.light_green },
                }
            })
        end
    },
    'vimwiki/vimwiki',
    'tpope/vim-commentary',
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons", },
    },
    'MunifTanjim/nui.nvim',
    {
        'catppuccin/nvim',
        name = "catppuccin",
        opts = {
            transparent_background = true,
            no_italic = true,
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
            }
        }
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "auto",
            dark_variant = "main",
            extend_background_behind_borders = true,
            enable = {
                terminal = true,
                migrations = true,
            },
            styles = {
                bold = true,
                italic = false,
                transparency = true,
            },
            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },
            before_hightlight = function(group, highlight, palette)
                if highlight.undercurl then
                    highlight.undercurl = false
                end
            end
        }
    },
    'nvim-treesitter/playground',
    'tpope/vim-fugitive',
    {
        'folke/trouble.nvim',
        opts = {
            modes = {
                symbols = {
                    mode = "lsp_document_symbols",
                    win = {
                        focusable = true,
                        relative = "editor",
                        border = "rounded",
                        focus = true,
                        size = { width = .3, height = 1 },
                        zindex = 200
                    },
                }
            }
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    'williamboman/mason-lspconfig.nvim',
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets'
        },
    },
    'saadparwaiz1/cmp_luasnip',
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
vim.cmd.colorscheme("onenord")
