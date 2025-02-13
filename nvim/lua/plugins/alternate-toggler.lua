return {
    -- 快速切换备用“布尔”值
    'rmagatti/alternate-toggler',
    config = function()
        local keymap = vim.keymap
        require('alternate-toggler').setup {
            alternates = {
                ['==='] = '!==',
                ['=='] = '!=',
                ['error'] = 'warn',
            },
        }
        keymap.set('n', '<leader>i', '<cmd>ToggleAlternate<cr>')
    end,
}
