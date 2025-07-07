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
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
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

        require('lspconfig').gopls.setup({
            settings = {
                gopls = {
                    semanticTokens = true,
                    usePlaceholders = true,
                    analyses = {
                        composites = false,
                        ST1021 = false,
                    },
                    staticcheck = true,
                    hints = {
                        assignVariableTypes = true,
                        rangeVariableTypes = true,
                    },
                }
            }
        })
        require('lspconfig').lua_ls.setup({})

        require('lspconfig').pylsp.setup({
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
