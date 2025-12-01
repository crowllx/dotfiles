return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    enabled = true,
    opts = {
        signature = {
            enabled = true,
            window = {
                show_documentation = true,
                treesitter_highlighting = true,
            },
        },

        keymap = {
            preset = 'default',
            ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
            ['<C-j>'] = { 'select_next' },
            ['<C-k>'] = { 'select_prev' },
            ['<C-l>'] = { 'snippet_forward' },
            ['<C-h>'] = { 'snippet_backward' },
            ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
            ['<C-f>'] = { 'show_documentation', 'hide_signature', 'fallback' },
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', },
        },
    }
}
