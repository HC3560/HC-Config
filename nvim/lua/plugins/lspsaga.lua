return {
    -- 改进了Neovim内置的LSP体验
    'nvimdev/lspsaga.nvim',
    config = function()
        local keymap = vim.keymap

        require('lspsaga').setup {
            ui = {
                border = 'rounded',
            },
            lightbulb = {
                enable = false,
            },
        }

        keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
        keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
        keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

        local builtin = require 'telescope.builtin'

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local opts = { buffer = ev.buf }
                vim.keymap.set(
                    'n',
                    'gd',
                    '<cmd>Lspsaga goto_definition<cr>',
                    opts
                )
                vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                vim.keymap.set(
                    { 'n', 'v' },
                    '<leader>ca',
                    '<cmd>Lspsaga code_action<cr>',
                    opts
                )
                vim.keymap.set('n', 'gh', builtin.lsp_references, opts)
            end,
        })

        vim.keymap.set(
            'n',
            '<leader>k',
            '<cmd>Lspsaga hover_doc<cr>',
            { silent = true }
        )

        -- error lens
        vim.diagnostic.config {
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.INFO] = '',
                    [vim.diagnostic.severity.HINT] = '',
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = 'ErrorLine',
                    [vim.diagnostic.severity.WARN] = 'WarningLine',
                    [vim.diagnostic.severity.INFO] = 'InfoLine',
                    [vim.diagnostic.severity.HINT] = 'HintLine',
                },
            },
        }
    end,
}
