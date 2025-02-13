return {
    -- 自动补全
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-buffer', -- source for text in buffer
        'hrsh7th/cmp-path', -- source for file system paths
        'l3mon4d3/luasnip', -- snippet engine
        'saadparwaiz1/cmp_luasnip', -- for autocompletion
        'onsails/lspkind.nvim', -- vs-code like pictograms
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
    },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        local lspkind = require 'lspkind'

        cmp.setup {
            completion = {
                completeopt = 'menu,menuone,preview,noselect',
            },
            formatting = {
                format = lspkind.cmp_format {
                    maxwidth = 50,
                    ellipsis_char = '...',
                },
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            }),
        }

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline' },
            }),
        })

        -- snippets
        require('luasnip.loaders.from_vscode').load {
            paths = { '~/.config/nvim/snippets' },
        }
    end,
}
