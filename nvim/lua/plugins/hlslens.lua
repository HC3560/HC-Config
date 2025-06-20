return {
    -- 搜索功能增强
    'kevinhwang91/nvim-hlslens',
    config = function()
        require('scrollbar.handlers.search').setup {}

        local kopts = { noremap = true, silent = true }

        vim.api.nvim_set_keymap(
            'n',
            'n',
            [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
            kopts
        )
        vim.api.nvim_set_keymap(
            'n',
            'N',
            [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
            kopts
        )
        vim.api.nvim_set_keymap(
            'n',
            '*',
            [[*<Cmd>lua require('hlslens').start()<CR>]],
            kopts
        )
        vim.api.nvim_set_keymap(
            'n',
            '#',
            [[#<Cmd>lua require('hlslens').start()<CR>]],
            kopts
        )
        vim.api.nvim_set_keymap(
            'n',
            'g*',
            [[g*<Cmd>lua require('hlslens').start()<CR>]],
            kopts
        )
        vim.api.nvim_set_keymap(
            'n',
            'g#',
            [[g#<Cmd>lua require('hlslens').start()<CR>]],
            kopts
        )

        -- 清除搜索高亮
        vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end,
}
