return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        -- Here is where you configure the autocompletion settings.
        -- local lsp_zero = require('lsp-zero')
        -- lsp_zero.extend_cmp()

        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')
        local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
        local ls = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()
        vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })
        vim.keymap.set("i", "<C-x><C-o>", cmp.complete)
        cmp.setup({
            -- formatting = lsp_zero.cmp_format({ details = true }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer ' },
                { name = 'path' },
                { name = 'nvim_lua' },
                { name = 'luasnip' }
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
                ['<C-p>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item(cmp_select_opts)
                    else
                        cmp.complete()
                    end
                end),
                ['<C-n>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_next_item(cmp_select_opts)
                    else
                        cmp.complete()
                    end
                end),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                    vim.snippet.expand(args.body)
                end,
            },
        })
    end
}
