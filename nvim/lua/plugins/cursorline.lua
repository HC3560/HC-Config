return {
    -- 在光标上突出显示单词和行
    'yamatsum/nvim-cursorline',
    opts = {
        cursorline = {
            enable = true,
            timeout = 1000,
            number = false,
        },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
        },
    },
}
