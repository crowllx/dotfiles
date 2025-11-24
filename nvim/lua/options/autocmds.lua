local autocmd = vim.api.nvim_create_autocmd


autocmd("BufWritePre", {
    pattern = { '*.go', '*.lua' },
    command = "lua vim.lsp.buf.format()"
})

autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { '*.tsj', '*.tmj' },
    command = "set filetype=json",
})
