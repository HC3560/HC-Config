return {
    -- 括号引号等自动匹配
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
    -- config = function()
    --     require('nvim-autopairs').setup {}
    --     -- 添加全局尖括号自动匹配规则（为了使Auto Tag正常生效，不能设置尖括号自动匹配）
    --     local Rule = require 'nvim-autopairs.rule'
    --     require('nvim-autopairs').add_rules {
    --         Rule('<', '>'), -- 所有文件类型生效
    --     }
    -- end,
}
