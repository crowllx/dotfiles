local autocmd = vim.api.nvim_create_autocmd


autocmd("BufWritePre", {
    pattern = { '*.go', '*.lua', '*.ml' },
    command = "lua vim.lsp.buf.format()"
})

autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { '*.tsj', '*.tmj' },
    command = "set filetype=json",
})

autocmd("Filetype", {
    pattern = "ocaml",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end
})
