vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { remap = false })
vim.keymap.set("v", "<leader>f", vim.lsp.buf.format, { remap = false })

vim.keymap.set({"n", "v"},"<leader>y", [["+y]])
vim.keymap.set("v","<leader>Y", [["+Y]])

