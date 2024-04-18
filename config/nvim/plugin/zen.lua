vim.keymap.set("n", "<leader>zz", function()
    require('zen-mode').toggle()
end)
require('zen-mode').setup {
    window = {
        width= 90,
        options = {
            number = true

        }
    },
    plugins = {
        options = {
            enabled = true,
            ruler = true,
            showcmd = true
        }
    }
}
