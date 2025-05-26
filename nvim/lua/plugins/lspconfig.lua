return {
    -- 一个“仅数据”存储库，为各种LSP服务器提供基本的默认Nvim LSP客户端配置，包含了对多种流行语言服务器的预配置支持。
    'neovim/nvim-lspconfig',
    config = function()
        -- for fold
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        -- lua
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
            capabilities = capabilities,
        })

        -- graphql
        vim.lsp.config('graphql', {
            filetypes = {
                'graphql',
                'gql',
            },
            capabilities = capabilities,
        })

        -- prisma
        vim.lsp.config('prismals', {
            capabilities = capabilities,
        })
    end,
}
