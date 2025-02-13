return {
    -- 配置快捷键：将键盘映射、命令和自动命令定义为简单的Lua表
    'mrjones2014/legendary.nvim',
    dependencies = {
        -- 快速复制行或块
        'hinell/duplicate.nvim',
    },
    priority = 10000,
    lazy = false,
    config = function()
        local legendary = require 'legendary'
        legendary.keymaps {
            -- duplicate
            {
                description = 'Line: duplicate up',
                mode = { 'n' },
                '<A-S-Up>',
                '<CMD>LineDuplicate -1<CR>',
            },
            {
                description = 'Line: duplicate down',
                mode = { 'n' },
                '<A-S-Down>',
                '<CMD>LineDuplicate +1<CR>',
            },
            {
                description = 'Selection: duplicate up',
                mode = { 'v' },
                '<A-S-Up>',
                '<CMD>VisualDuplicate -1<CR>',
            },
            {
                description = 'Selection: duplicate down',
                mode = { 'v' },
                '<A-S-Down>',
                '<CMD>VisualDuplicate +1<CR>',
            },

            -- project
            {
                description = 'find a project based on patterns',
                mode = { 'n' },
                '<leader>d',
                '<CMD>Telescope neovim-project discover<CR>',
            },
            {
                description = 'select a project from your recent history',
                mode = { 'n' },
                '<leader>h',
                '<CMD>Telescope neovim-project history<CR>',
            },
        }
    end,
}
