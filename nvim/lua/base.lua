-- 1. 基础设置
-- 将 vim.opt 简写为 opt，方便后续配置
local opt = vim.opt

-- 2. 界面显示设置
-- 始终显示标记列（用于显示 Git 更改、断点等图标）
opt.signcolumn = 'yes'
-- 显示绝对行号
opt.number = true
-- 显示相对行号（便于使用数字跳转命令）
opt.relativenumber = true
-- 垂直滚动时，光标距离顶部/底部保留 5 行
opt.scrolloff = 5
-- 水平滚动时，光标距离两侧保留 5 列
opt.sidescrolloff = 5
-- 高亮当前行
opt.cursorline = true
-- 启用终端真彩色支持（需终端支持）
opt.termguicolors = true

-- 3. 搜索相关
-- 高亮所有匹配的搜索内容
opt.hlsearch = true
-- 实时增量搜索（输入时逐步高亮匹配）
opt.incsearch = true
-- 搜索时忽略大小写
opt.ignorecase = true
-- 如果搜索包含大写字母，则区分大小写
opt.smartcase = true

-- 4. 鼠标与剪贴板
-- 允许所有模式使用鼠标（normal/visual/insert 等）
opt.mouse:append 'a'
-- 与系统剪贴板共享（使用 + 寄存器）
opt.clipboard:append 'unnamedplus'

-- 5. 缩进与代码格式
-- Tab 显示为 2 个空格
opt.tabstop = 4
-- 自动缩进时使用 2 个空格
opt.shiftwidth = 4
-- 将 Tab 转换为空格
opt.expandtab = true
-- 自动继承上一行的缩进
opt.autoindent = true

-- 6. 文件与缓存
-- 禁用交换文件（避免生成 .swp 文件）
opt.swapfile = false
-- 自动重新加载外部修改过的文件
opt.autoread = true
-- 确保缓冲区级别也启用 autoread
vim.bo.autoread = true

-- 7. 复制高亮功能
-- 复制文本时高亮被复制区域
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank() -- 高亮复制内容（默认持续400ms）
    end,
})
