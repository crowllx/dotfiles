-- LSP
return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
        vim.lsp.buf.hover({ buffer = 'rounded' })
        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )


        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })

        vim.lsp.config('ols', {
            init_options = {
                checker_args = "-strict-style",
                character_width = 80,
                tabs = false,
                newline_limit = 1,
                tabs_width = 4,
                enable_semantic_tokens = true,
                enable_document_symbols = true,
                enable_hover = true,
                enable_snippets = true,
                enable_inlay_hints = true,
                enable_procedure_snippets = true
            }
        })
        vim.lsp.enable('ols')

        vim.lsp.config('jsonls', {})

        -- ocaml
        vim.lsp.config('ocamllsp', {
            settings = {
                ocamlformat = {
                    enable = true
                }
            }
        })
        vim.lsp.enable('ocamllsp')

        vim.lsp.config('gopls', {
            settings = {
                gopls = {
                    semanticTokens = true,
                    usePlaceholders = true,
                    analyses = {
                        composites = false,
                        ST1021 = false,
                        ST1003 = false,
                        ST1012 = false,
                        ST1020 = false,
                        ST1000 = false,
                    },
                    staticcheck = true,
                    hints = {
                        assignVariableTypes = true,
                        rangeVariableTypes = true,
                    },
                }
            }
        })
        vim.lsp.enable('gopls')

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })
        vim.lsp.enable('lua_ls')

        vim.lsp.config('pylsp', {
            settings = {
                pylsp = {
                    plugins = {
                        ruff = {
                            enabled = true,
                        },
                        jedi_completions = {
                            enabled = true,
                            include_params = true,
                        },
                        pycodestyle = {
                            enabled = false
                        },
                        pyflakes = {
                            enabled = false,
                        },
                        autopep8 = {
                            enabled = false,
                        },
                        yapf = {
                            enabled = false,
                        },
                    }
                }
            }
        })
    end
}
