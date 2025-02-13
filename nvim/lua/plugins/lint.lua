return {
    -- 为代码提供linting（语义错误和语法检查）
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
        }
        vim.api.nvim_create_autocmd(
            { 'BufEnter', 'BufWritePost', 'InsertLeave' },
            {
                callback = function()
                    require('lint').try_lint()
                end,
            }
        )
    end,
}
