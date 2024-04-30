local lsp_config = require("lspconfig")

lsp_config["nil_ls"].setup({})
lsp_config["lua_ls"].setup({})
lsp_config["pylsp"].setup({
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                },
                jedi_completion = {
                    enabled = true,
                    include_params = true,
                },
            },
        },
    },
})
lsp_config["bashls"].setup({})
lsp_config["clangd"].setup({})
lsp_config["tsserver"].setup({})
lsp_config["rust_analyzer"].setup({})
lsp_config["tsserver"].setup({})
