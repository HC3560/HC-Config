return {
    -- 轻松添加/更改/删除周围的分隔符对
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
        require('nvim-surround').setup {}
    end,
}
