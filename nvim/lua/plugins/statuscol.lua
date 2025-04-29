return {
    -- 提供可配置的 '状态栏' 和点击处理器的状态栏插件
    'luukvbaal/statuscol.nvim',
    config = function()
        local builtin = require 'statuscol.builtin'
        require('statuscol').setup {
            relculright = true,
            segments = {
                -- gitsigns & todo-comments标志段
                {
                    sign = {
                        name = { '.*' }, -- 匹配所有标志
                        namespace = { 'gitsigns' }, -- 只匹配 gitsigns 命名空间的标志
                        maxwidth = 2, -- 每行最多显示1个标志
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
                { text = { '%C', ' ' }, click = 'v:lua.ScFa' },
            },
            clickhandlers = {
                gitsigns = builtin.gitsigns_click,
            },
        }
    end,
}
