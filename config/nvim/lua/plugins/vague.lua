return {
    "vague-theme/vague.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
        -- NOTE: you do not need to call setup if you don't want to.
        require("vague").setup({
            transparent = true,
            italic = false,
            bold = false,

            -- override highlights
            on_highlights = function(highlights, colors)
                highlights.WinSeparator = { fg = colors.line }
                highlights.Normal = { fg = colors.property }
                -- highlights.NvimTreeRootFolder = { fg = colors.propery }
                highlights.TelescopeBorder = { fg = colors.line }
                highlights.FloatBorder = { fg = colors.line }
                highlights.Delimiter = { fg = "#a7a8ab" }
                highlights.Type = { fg = colors.plus }
            end,

            colors = {
                string = "#A3BE8C",
                builtin = "#7e98e8"
            }
        })
        vim.cmd.colorscheme("vague")
    end
}
