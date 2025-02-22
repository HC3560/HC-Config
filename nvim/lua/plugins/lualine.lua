return {
    -- 状态栏
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup {
            options = {
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '', right = '' } },
                },
                lualine_b = { { 'filename', path = 3 } },
                lualine_c = { 'diagnostics' },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { left = '', right = '' } },
                },
            },
        }
    end,
}
