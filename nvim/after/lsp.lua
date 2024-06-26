local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- auto completion for omni func
        vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

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

        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    end
})

-- server setup
local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = lsp_capabilities,
    })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'bashls', 'lua_ls', 'tsserver', 'pylsp', 'rust_analyzer', 'ruff_lsp' },
    handlers = {
        default_setup,
        ['lua_ls'] = function()
            lspconfig['lua_ls'].setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end,
        ["yamlls"] = function()
            lspconfig["yamlls"].setup({
                settings = {
                    yaml = {
                        customTags = { "!Node mapping" },
                    },
                },
            })
        end,
        ["pylsp"] = function()
            lspconfig['pylsp'].setup({
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
})
