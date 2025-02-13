return {
    -- 提供代码高亮、增量选择等功能
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
        -- 使用Treesitter自动关闭和自动重命名HTML标签
        'windwp/nvim-ts-autotag',
        'axelvc/template-string.nvim',
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'tsx',
                'lua',
                'vim',
                'typescript',
                'javascript',
                'html',
                'css',
                'json',
                'graphql',
                'regex',
                'rust',
                'prisma',
                'markdown',
                'markdown_inline',
            },

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,

                additional_vim_regex_highlighting = false,
            },

            -- 快速选中（使用Treesitter实现）
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<enter>',
                    node_incremental = '<enter>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
        }

        require('nvim-ts-autotag').setup {
            opts = {
                -- Defaults
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = false, -- Auto close on trailing </
            },
        }

        require('template-string').setup {}
    end,
}
