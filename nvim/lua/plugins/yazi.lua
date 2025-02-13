return {
    -- 在Neovim中打开Yazi悬浮窗，便于进行文件的切换与管理
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>a',
            mode = { 'n', 'v' },
            '<cmd>Yazi<cr>',
            desc = 'Open yazi at the current file',
        },
        {
            '<leader>yd',
            '<cmd>Yazi cwd<cr>',
            desc = "Open the file manager in nvim's working directory",
        },
        {
            '<leader>yr',
            '<cmd>Yazi toggle<cr>',
            desc = 'Resume the last yazi session',
        },
    },
    opts = {
        -- the floating window scaling factor. 1 means 100%, 0.9 means 90%, etc.
        floating_window_scaling_factor = 0.9,

        -- the transparency of the yazi floating window (0-100). See :h winblend
        yazi_floating_window_winblend = 10,

        keymaps = {
            show_help = '?',
            open_file_in_vertical_split = '<c-v>',
            open_file_in_horizontal_split = '<c-x>',
            open_file_in_tab = '<c-t>',
            grep_in_directory = '<c-s>',
            replace_in_directory = '<c-g>',
            cycle_open_buffers = '<tab>',
            copy_relative_path_to_selected_files = '<c-y>',
            send_to_quickfix_list = '<c-q>',
            change_working_directory = '<c-\\>',
        },
    },
}
