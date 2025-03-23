return {
    -- 可视化缩进
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.indentscope').setup {}
    end,
}
