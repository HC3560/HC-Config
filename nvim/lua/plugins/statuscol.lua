return {
    -- 提供可配置的 '状态栏' 和点击处理器的状态栏插件
    'luukvbaal/statuscol.nvim',
    config = function()
        local builtin = require 'statuscol.builtin'
        require('statuscol').setup {
            relculright = true,
            segments = {
                -- gitsigns
                {
                    sign = {
                        namespace = { 'gitsigns' }, -- 匹配gitsigns符号
                        maxwidth = 1, -- 每行最多显示1个标志
                        colwidth = 1, -- 每个标志宽度为1
                        auto = false, -- 没有标志时不显示任何内容
                    },
                    click = 'v:lua.ScSa', -- 使用内置点击处理器
                },

                -- 调试 & todo-comments & 诊断符号标志段
                {
                    sign = {
                        name = {
                            'Dap*', -- 匹配调试符号
                            'todo*', -- 匹配todo-comments符号
                        },
                        namespace = { 'diagnostic*' }, -- 匹配诊断符号
                        maxwidth = 2, -- 每行最多显示2个标志
                        colwidth = 1, -- 每个标志宽度为1
                        auto = false, -- 没有标志时不显示任何内容
                    },
                    click = 'v:lua.ScSa', -- 使用内置点击处理器
                },

                -- bookmarks符号
                {
                    sign = {
                        name = {
                            'Bookmarks*', -- 匹配bookmarks符号
                        },
                        maxwidth = 1, -- 每行最多显示1个标志
                        colwidth = 1, -- 每个标志宽度为1
                        auto = false, -- 没有标志时不显示任何内容
                    },
                    click = 'v:lua.ScSa', -- 使用内置点击处理器
                },

                -- 行号
                {
                    text = { builtin.lnumfunc, ' ' },
                    condition = { true, builtin.not_empty },
                    click = 'v:lua.ScLa',
                },

                -- 折叠标志
                {
                    text = { '%C', ' ' },
                    click = 'v:lua.ScFa',
                },
            },
        }
    end,
}
