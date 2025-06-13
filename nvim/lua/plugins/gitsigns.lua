return {
    -- Git的深度缓冲集成，用于在实时显示文件的Git修改状态以及git blame信息
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = '▎' }, -- 或 '│'（更细的竖线）
                change = { text = '▎' }, -- 或 '│'
                delete = { text = '󰍴' }, -- 底部删除线
                topdelete = { text = '󰍷' }, -- 顶部删除线
                changedelete = { text = '▎󰍴' }, -- 修改+删除组合
                untracked = { text = '┆' }, -- 虚线表示未跟踪
            },
            signs_staged = {
                add = { text = '▌' }, -- 更粗的竖线表示已暂存
                change = { text = '▌' },
                delete = { text = '󰍵' }, -- 已暂存的删除
                topdelete = { text = '󰍸' },
                changedelete = { text = '▌󰍵' },
                untracked = { text = '┆' },
            },
            current_line_blame = true, -- 是否在当前行显示 Blame 信息
            current_line_blame_opts = {
                virt_text = true, -- 以虚拟文本形式显示（非覆盖文本）
                virt_text_pos = 'right_align', -- 显示位置：'eol' | 'overlay' | 'right_align'
                delay = 1000, -- 悬停多久后显示（毫秒）
                ignore_whitespace = false, -- 是否忽略空白字符变更
                virt_text_priority = 100, -- 虚拟文本的显示优先级（防止被其他插件覆盖）
                use_focus = true, -- 仅在窗口聚焦时显示
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>', -- 提交信息格式
            sign_priority = 8, -- 状态标记的优先级（防止与其他插件冲突）
            update_debounce = 100, -- 状态更新防抖时间（毫秒，值越大性能越好，但延迟越高）
            status_formatter = nil, -- 使用默认状态栏格式
            max_file_length = 40000, -- 超过 4 万行的文件禁用插件（避免卡顿）
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single', -- 预览窗口边框样式
                style = 'minimal', -- 窗口样式（无标題栏等）
                relative = 'cursor', -- 窗口相对于光标位置
                row = 0, -- 窗口行偏移
                col = 1, -- 窗口列偏移
            },
            on_attach = function(bufnr)
                local gitsigns = require 'gitsigns'

                -- 键位映射工具函数
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- 导航(Navigation)
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true } -- 差异模式下跳转下一个差异块
                    else
                        gitsigns.nav_hunk 'next' -- 普通模式下跳转下一个Git hunk
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true } -- 差异模式下跳转上一个差异块
                    else
                        gitsigns.nav_hunk 'prev' -- 普通模式下跳转上一个Git hunk
                    end
                end)

                -- 代码操作(Actions)
                -- 普通模式操作
                map('n', '<leader>cs', gitsigns.stage_hunk) -- 暂存当前hunk
                map('n', '<leader>cr', gitsigns.reset_hunk) -- 重置当前hunk

                -- 可视模式操作
                map('v', '<leader>cs', function()
                    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } -- 暂存选中行
                end)
                map('v', '<leader>cr', function()
                    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } -- 重置选中行
                end)

                -- 缓冲区级操作
                map('n', '<leader>cS', gitsigns.stage_buffer) -- 暂存整个缓冲区
                map('n', '<leader>cR', gitsigns.reset_buffer) -- 重置整个缓冲区

                -- 预览与比对
                map('n', '<leader>cp', gitsigns.preview_hunk) -- 浮动窗口预览hunk
                map('n', '<leader>ch', gitsigns.preview_hunk_inline) -- 行内预览差异
                map('n', '<leader>ci', gitsigns.diffthis) -- 对比当前文件与索引
                map('n', '<leader>cD', function()
                    gitsigns.diffthis '~' -- 对比当前文件与最后一次提交
                end)

                -- Blame与问题列表
                map('n', '<leader>cb', function()
                    gitsigns.blame_line { full = true } -- 显示完整Blame 信息
                end)
                map('n', '<leader>cQ', function()
                    gitsigns.setqflist 'all'
                end) -- 所有差异到quickfix
                map('n', '<leader>cq', gitsigns.setqflist) -- 当前hunk到quickfix

                -- 切换功能(Toggles)
                map('n', '<leader>ctb', gitsigns.toggle_current_line_blame) -- 切换行Blame
                map('n', '<leader>cd', gitsigns.toggle_deleted) -- 切换显示已删除内容
                map('n', '<leader>cw', gitsigns.toggle_word_diff) -- 切换单词级差异高亮

                -- 文本对象(Text Object)
                map({ 'o', 'x' }, 'ih', gitsigns.select_hunk) -- 用`ih`选择当前hunk
            end,
        }
    end,
}
