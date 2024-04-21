require('rose-pine').setup({
    variant = "auto",
    dark_variant = "main",
    extend_background_behind_borders = true,
    styles = {
        bold = true,
        italic = false,
        transparency = true,
    },
})
vim.cmd("colorscheme rose-pine-main")
