return {
    -- 可扩展Neovim滚动条
    'petertriho/nvim-scrollbar',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'kevinhwang91/nvim-hlslens',
    },
    config = function()
        require('scrollbar').setup {
            handle = {
                blend = 10, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent.
            },

            handlers = {
                gitsigns = true,
                -- FIXME: hlslens标志在滚动条中不显示
                search = true,
            },
        }
    end,
}
