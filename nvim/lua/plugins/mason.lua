return {
    -- Mason是一个市场，很方便地安装各个语言的lsp、formatter、linter
    'williamboman/mason.nvim',
    dependencies = {
        -- 连接Mason和lspconfig，使两个插件更容易一起使用
        'williamboman/mason-lspconfig.nvim',
        -- 自动化安装和更新第三方工具
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        require('mason').setup {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        }

        require('mason-lspconfig').setup {}
        require('mason-tool-installer').setup {
            ensure_installed = {
                'ts_ls',
                'lua-language-server',
                'stylua',
                'eslint_d',
                'prettierd',
                'rust-analyzer',
                'graphql-language-service-cli',
                'prisma-language-server',
            },
        }
    end,
}
