-- 1. 基础设置
-- 定义 leader 键为空格（所有自定义快捷键的前缀）
vim.g.mapleader = ' '
-- 创建 keymap 的局部引用，简化代码
local keymap = vim.keymap

-- 2. 核心键位映射

-- 全选操作
-- 普通模式下按 Ctrl+a 全选
-- gg 跳转到文件开头
-- V  进入行可视模式
-- G  跳转到文件末尾（组合效果：选中全部内容）
keymap.set('n', '<c-a>', 'ggVG')

-- 纯净粘贴
-- 在普通模式和可视模式下，使用 <leader>+p 粘贴寄存器 0 的内容
-- 寄存器 0 始终存储最后一次复制（yank）的内容
-- 避免粘贴被最后一次删除操作污染（默认 p 使用 "" 寄存器）
keymap.set({ 'n', 'x' }, '<leader>p', '"0p')

-- 基础操作
keymap.set('n', '<leader>q', '<cmd>q<cr>') -- 快速退出（等效于 :q<CR>）
keymap.set('n', '<leader>w', '<cmd>w<cr>') -- 快速保存（等效于 :w<CR>）
keymap.set('n', '<leader>x', '<cmd>x<cr>') -- 保存并退出（等效于 :x<CR>）

-- 3. 增强导航
-- 智能行移动
-- 作用是：当【一行】内容因为窗口太小而换行时，j/k 依然可以在【一行】内上下移动
-- 当带数字前缀时（如 5j）执行普通行跳转
-- 无数字前缀时执行 gj（按屏幕行移动，自动适应换行文本）
keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

-- 4. 实用功能
-- 清除搜索高亮
-- 执行 :nohlsearch 命令（缩写为 :nohl）
-- 清除搜索匹配的高亮显示
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
