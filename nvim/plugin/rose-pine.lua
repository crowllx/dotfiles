require('rose-pine').setup({
    variant = "auto",
    dark_variant = "main",
    extend_background_behind_borders = true,
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
    highlight_groups = {
        String = { fg = "#98BB6C" },
    },
    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        if highlight.fg == palette.text then
            --highlight.fg = "#ADBAC7"
        end
    end,
})
vim.cmd("colorscheme rose-pine-main")
