local autocmd = vim.api.nvim_create_autocmd


autocmd("BufWritePre", {
    pattern = { '*.go', '*.lua' },
    command = "lua vim.lsp.buf.format()"
})
