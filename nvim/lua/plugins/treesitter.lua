return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context'
    },
    opts = {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        autopairs = true,
        autotag = true,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        highlight = {
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
            use_languagetree = true,
        },
        indent = {
            enable = true
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
