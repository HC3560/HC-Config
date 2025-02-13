return {
    -- 一个“仅数据”存储库，为各种LSP服务器提供基本的默认Nvim LSP客户端配置，包含了对多种流行语言服务器的预配置支持。
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require 'lspconfig'
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- for fold
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        -- lua
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
            capabilities = capabilities,
        }

        -- graphql
        lspconfig.graphql.setup {
            filetypes = {
                'graphql',
                'gql',
            },
            capabilities = capabilities,
        }

        -- prisma
        lspconfig.prismals.setup {
            capabilities = capabilities,
        }
    end,
}
