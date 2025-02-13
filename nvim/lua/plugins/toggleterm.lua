return {
    -- 内置终端
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup {
            open_mapping = [[<c-\>]],
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = 130,
                height = 30,
            },
        }
    end,
}
