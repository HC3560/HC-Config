return {
    -- 项目切换
    'coffebar/neovim-project',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'Shatur/neovim-session-manager',
    },
    lazy = false,
    priority = 100,
    opts = {
        projects = { -- define project roots
            '~/.config/*',
            '~/Practice/Rust/*',
            '~/Practice/Typescript/*',
        },
    },
    init = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
}
