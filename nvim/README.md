# Neovim

使用配置文件需先安装某些插件需要使用的扩展软件：

ripgrep（rg）:[BurntSushi/ripgrep: ripgrep recursively searches directories for a regex pattern while respecting your gitignore](https://github.com/BurntSushi/ripgrep)

字体：[Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/)

## 基本配置

`base.lua`：一些基础配置，优化了Neovim的显示、搜索、缩进、剪贴板及文件管理设置，提升编辑效率。

`kaymap.lua`：配置自定义快捷键，以空格键为核心，通过自定义快捷键集成全选/纯净粘贴/快速保存退出功能，优化换行导航并提供清除高亮等实用工具。

## lazy.nvim

**lazy.nvim**是 Neovim 的现代插件管理器（[🚀 Getting Started | lazy.nvim](https://lazy.folke.io/)）。使用官网的配置即可。

相关配置的详细解释：[lazy-nvim插件管理器基础入门 - w4ngzhen - 博客园](https://www.cnblogs.com/w4ngzhen/p/17493128.html)

使用`require("lazy").setup("plugins")`引入插件文件夹后，在文件夹中使用`table`块配置插件即可。

## colorscheme

使用Everforest主题：[sainnhe/everforest: 🌲 Comfortable & Pleasant Color Scheme for Vim](https://github.com/sainnhe/everforest/)

## Mason

Mason是一个市场，很方便地安装各个语言的lsp、formatter、linter

mason：[williamboman/mason.nvim: Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.](https://github.com/williamboman/mason.nvim)

mason-lspconfig：[williamboman/mason-lspconfig.nvim: Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.](https://github.com/williamboman/mason-lspconfig.nvim)

mason-tool-installer：[WhoIsSethDaniel/mason-tool-installer.nvim: Install and upgrade third party tools automatically](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

## LSP

[neovim/nvim-lspconfig: Quickstart configs for Nvim LSP](https://github.com/neovim/nvim-lspconfig)

[Neovim Language Server Protocol 配置解释](https://blog.otakusaikou.com/2023/07/05/neovim-language-server-config-explanation/)

配置Lua语言服务器，声明`vim`为已知全局变量，避免LSP将`vim`全局变量误报为未定义：

```lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }, -- 声明 vim 为已知全局变量
    },
  },
  capabilities = capabilities,
}
```

## 格式化

[stevearc/conform.nvim: Lightweight yet powerful formatter plugin for Neovim](https://github.com/stevearc/conform.nvim)

对于conform的最新版本，要求Neovim 0.10+，像Ubuntu这种系统，官方库中的Neovim的版本很可能不满足要求，安装插件后提示版本不支持，需要看Neovim官方的安装说明：

[neovim/INSTALL.md at master · neovim/neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#ubuntu)

找到非官方的PPA库，添加PPA库之后即可安装最新构建版本的Neovim：

[Ubuntu22.04 安装、简单配置 neovim1. 安装 NeoVim 2. 安装插件管理器 为了轻松地管理 Ne - 掘金](https://juejin.cn/post/7325817302336159744)

对于安装的新版本Neovim，安装conform之后可能会出现一些报错，报错原因可能是因为缺少`treesitter`（[nvim-treesitter/nvim-treesitter: Nvim Treesitter configurations and abstraction layer](https://github.com/nvim-treesitter/nvim-treesitter)）插件，安装后报错即可消失。

## Treesitter

提供代码高亮、增量选择等功能

[nvim-treesitter/nvim-treesitter: Nvim Treesitter configurations and abstraction layer](https://github.com/nvim-treesitter/nvim-treesitter)

`:TSInstallInfo`：查看语言解释器安装信息

`:TSUpdate`：更新已安装的语言解释器

## Yazi

Yazi（意思是“鸭子”）是一个用 Rust 编写的终端文件管理器，基于非阻塞异步 I/O。它旨在提供高效、用户友好且可定制的文件管理体验。

在Neovim中打开Yazi悬浮窗，便于进行文件的切换与管理：

[mikavilpas/yazi.nvim: A Neovim Plugin for the yazi terminal file manager](https://github.com/mikavilpas/yazi.nvim)

参考TheCW的nvim配置中yazi插件的配置：[nvim/lua/config/plugins/yazi.lua at lua-migration · theniceboy/nvim](https://github.com/theniceboy/nvim/blob/lua-migration/lua/config/plugins/yazi.lua)

Yazi配置参考我的配置[HC3560/HC-Config](https://github.com/HC3560/HC-Config)。

## 括号引号等自动匹配

[windwp/nvim-autopairs: autopairs for neovim written in lua](https://github.com/windwp/nvim-autopairs)

## Telescope

一个高度可扩展的列表模糊查找器

安装Telescope之前需要先安装ripgrep（rg）：[BurntSushi/ripgrep: ripgrep recursively searches directories for a regex pattern while respecting your gitignore](https://github.com/BurntSushi/ripgrep)

telescope：[nvim-telescope/telescope.nvim: Find, Filter, Preview, Pick. All lua, all the time.](https://github.com/nvim-telescope/telescope.nvim)

## 多光标

[mg979/vim-visual-multi: Multiple cursors plugin for vim/neovim](https://github.com/mg979/vim-visual-multi)

用于一次性创建多个光标，方便对多行或多个关键字进行统一操作。

## Telescope与LSP的集成（Lspsaga）

改进了Neovim内置的LSP体验

Lspsaga：[Lspsaga | nvimdev](https://nvimdev.github.io/lspsaga/)

[nvimdev/lspsaga.nvim: improve neovim lsp experience](https://github.com/nvimdev/lspsaga.nvim)

## 书签

[MattesGroeger/vim-bookmarks: Vim bookmark plugin](https://github.com/MattesGroeger/vim-bookmarks)

[tom-anders/telescope-vim-bookmarks.nvim: Integrates vim-bookmarks into telescope.nvim](https://github.com/tom-anders/telescope-vim-bookmarks.nvim)

## Typescript LSP

[pmizio/typescript-tools.nvim: ⚡ TypeScript integration NeoVim deserves ⚡](https://github.com/pmizio/typescript-tools.nvim)

这个插件性能比tsserver（以更名为ts_ls）性能好一些。

## Lint

为代码提供linting（语义错误和语法检查）

[mfussenegger/nvim-lint: An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.](https://github.com/mfussenegger/nvim-lint)

## 自动补全

[hrsh7th/nvim-cmp: A completion plugin for neovim coded in Lua.](https://github.com/hrsh7th/nvim-cmp)

## Auto Tag

使用Treesitter自动关闭和自动重命名HTML标签

[windwp/nvim-ts-autotag: Use treesitter to auto close and auto rename html tag](https://github.com/windwp/nvim-ts-autotag)

注意，根据官方的README文件，通过`nvim-treesitter.configs`进行设置的方式已被弃用，需要迁移到新方法，使用官方提供的`nvim-ts-autotag`进行设置。

## 字符串拼接

[axelvc/template-string.nvim: Neovim plugin to automatic change normal string to template string in JS like languages](https://github.com/axelvc/template-string.nvim)

## 内置终端

[akinsho/toggleterm.nvim: A neovim lua plugin to help easily manage multiple terminal windows](https://github.com/akinsho/toggleterm.nvim)

## 缩进

[echasnovski/mini.indentscope: Neovim Lua plugin to visualize and operate on indent scope. Part of 'mini.nvim' library.](https://github.com/echasnovski/mini.indentscope)

## 快速切换

[rmagatti/alternate-toggler: A very small plugin for toggling alternate "boolean" values.](https://github.com/rmagatti/alternate-toggler)

## Surround

轻松添加/更改/删除周围的分隔符对

[kylechui/nvim-surround: Add/change/delete surrounding delimiter pairs with ease. Written with in Lua.](https://github.com/kylechui/nvim-surround)

## 快速选中

使用Treesitter实现：

[nvim-treesitter/nvim-treesitter: Nvim Treesitter configurations and abstraction layer #incremental-selection](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#incremental-selection)

## TreeSJ

用于拆分/连接代码块

[Wansmer/treesj: Neovim plugin for splitting/joining blocks of code](https://github.com/Wansmer/treesj)

## 注释

[numToStr/Comment.nvim: :brain: // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more](https://github.com/numToStr/Comment.nvim)

## TODO注释

[folke/todo-comments.nvim: ✅ Highlight, list and search todo comments in your projects](https://github.com/folke/todo-comments.nvim)

## 多行复制

[hinell/duplicate.nvim: Duplicate visual selection, lines, and textobjects](https://github.com/hinell/duplicate.nvim)

在官方文档[duplicate.nvim/doc/index.md at main · hinell/duplicate.nvim #legendary](https://github.com/hinell/duplicate.nvim/blob/main/doc/index.md#legendary)中，建议使用[Legendary.nvim](https://github.com/mrjones2014/legendary.nvim)来配置键盘映射。

## 项目切换

[coffebar/neovim-project: Neovim project plugin simplifies project management by maintaining project history and providing quick access to projects via Telescope or fzf-lua..](https://github.com/coffebar/neovim-project)

## 快速跳转

[folke/flash.nvim: Navigate your code with search labels, enhanced character motions and Treesitter integration](https://github.com/folke/flash.nvim)

## 状态栏

[nvim-lualine/lualine.nvim: A blazing fast and easy to configure neovim statusline plugin written in pure lua.](https://github.com/nvim-lualine/lualine.nvim)

## Rust

[mrcjkb/rustaceanvim: 🦀 Supercharge your Rust experience in Neovim! A heavily modified fork of rust-tools.nvim](https://github.com/mrcjkb/rustaceanvim)

## Cursorline

在光标上突出显示单词和行

[ya2s/nvim-cursorline: A plugin for neovim that highlights cursor words and lines](https://github.com/ya2s/nvim-cursorline)

## Move

快速移动行或块

[fedepujol/move.nvim: Gain the power to move lines and blocks and auto-indent them!](https://github.com/fedepujol/move.nvim)

## Noice

高度实验性的插件，完全替换了`messages`、`cmdline`和`popupmenu`的 UI。

[folke/noice.nvim: 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.](https://github.com/folke/noice.nvim)

## Neovide

[Neovide - Neovide](https://neovide.dev/)

## 参考链接：

[从零开始配置 Neovim(Nvim) - MartinLwx's Blog](https://martinlwx.github.io/zh-cn/config-neovim-from-scratch/)

[Neovim配置——从入门到放弃 - lavateinn - 博客园](https://www.cnblogs.com/lavateinn/p/17904263.html)

[neovim入门指南(一)：基础配置 - ISLAND](https://youngxhui.top/2023/07/nvim-guideline-1basic-config/)

[neovim入门指南(二)：常用插件 - ISLAND](https://youngxhui.top/2023/08/nvim-guideline-2plugins/)

[neovim入门指南(三)：LSP配置(上) - ISLAND](https://youngxhui.top/2023/09/neovim-beginners-guide-part-three-lsp-configuration-part-one/)

[neovim入门指南(四)：LSP配置(下) - ISLAND](https://youngxhui.top/2024/03/beginner--guide-to-neovim-part-four-lsp-configuration-ii/)

[沉浸式写代码 ｜ 和我一起配置Neovim 0.8【重制】\_哔哩哔哩\_bilibili](https://www.bilibili.com/video/BV1zt4y1c71e/)

[Neovim 配置（上） | TypeScript | Rust | Lua | 无人声 （感觉写的稀碎，留着看看风景吧hh）\_哔哩哔哩\_bilibili](https://www.bilibili.com/video/BV1wc411X7Su/)

[Neovim 配置（下） | TypeScript | Rust | Lua | 无人声\_哔哩哔哩\_bilibili](https://www.bilibili.com/video/BV1ic411B7yz/)

[Neovim 里最完美的 TypeScript ( JavaScript / React ) 配置！\_哔哩哔哩\_bilibili](https://www.bilibili.com/video/BV1o94y1g7Q1/)

[bitterteasweetorange/nvim: Neovim 0.9 configuration for coding React, TypeScript and Rust](https://github.com/bitterteasweetorange/nvim)

[从0开始配置基于lua的neovim (lazy.nvim重制版)\_哔哩哔哩\_bilibili](https://www.bilibili.com/video/BV1HP411m7mQ/)
