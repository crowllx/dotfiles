vim.g.mapleader = "\\"
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+yy]])
vim.api.nvim_set_keymap('n', '<F10>', ":put=strftime('## %F')<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F5>', ":NvimTreeToggle<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>f', ":NvimTreeFocus<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F10>', ":put=strftime('## %F')<CR>", { noremap = true, silent = false })


-- toggle zen
vim.keymap.set("n", "<leader>zz", function()
    require('zen-mode').toggle()
end)


