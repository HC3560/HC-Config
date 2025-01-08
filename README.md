# HC-Config

这里我Linux系统中一些软件的配置文件的备份，方便后续系统迁移后的配置查找与直接使用。

如果对你也有一些帮助，我非常开心。

## Yazi

`yazi`文件夹中是对软件Yazi（[sxyazi/yazi: 💥 Blazing fast terminal file manager written in Rust, based on async I/O.](https://github.com/sxyazi/yazi)）的配置。

Yazi（意思是“鸭子”）是一个用 Rust 编写的终端文件管理器，基于非阻塞异步 I/O。它旨在提供高效、用户友好且可定制的文件管理体验。

对比joshuto速度更快，功能更丰富，且目前还在积极开发中，而joshuto由于其作者找到了新工作，目前已进入维护模式。

参考：

[【命令行必备】Yazi：最强文件管理器_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1yRkCYVEUT/)

[Bilibili-Yazi](https://instaboard.app/b/UYDDqLRsB)

插件：

[compress.yazi](https://github.com/KKV9/compress.yazi)：可将选定的文件或文件夹压缩到存档中

[git.yazi](https://github.com/yazi-rs/plugins/tree/main/git.yazi)：在文件列表中以linemode显示Git文件更改的状态

[starship.yazi](https://github.com/Rolv-Apneseth/starship.yazi)：在Yazi中显示starship命令行信息（[starship/starship: ☄🌌️ The minimal, blazing-fast, and infinitely customizable prompt for any shell!](https://github.com/starship/starship)）

[yaziline.yazi](https://github.com/llanosrocas/yaziline.yazi)：Yazi的简单类似lualine的状态行，在状态行中显示更多信息

[yazi.nvim](https://github.com/mikavilpas/yazi.nvim)：这个插件允许你在Neovim的浮动窗口中打开Yazi。（使用[lazy.nvim](https://lazy.folke.io/)安装，配合[Neovim](https://neovim.io/)使用）

[full-border.yazi](https://github.com/yazi-rs/plugins/tree/main/full-border.yazi)：给Yazi加上完整的边框，让它看起来更华丽

[max-preview.yazi](https://github.com/yazi-rs/plugins/tree/main/max-preview.yazi)：最大化或恢复预览窗格

[eza-preview.yazi](https://github.com/ahkohd/eza-preview.yazi)：[Yazi](https://github.com/sxyazi/yazi)插件使用[eza](https://github.com/eza-community/eza)预览目录，可以在列表和树模式之间切换。

[chmod.yazi](https://github.com/yazi-rs/plugins/tree/main/chmod.yazi)：对所选文件执行`chmod`以更改其模式。该插件仅在 Unix 平台上可用，因为它依赖于`chmod`

[jump-to-char.yazi](https://github.com/yazi-rs/plugins/tree/main/jump-to-char.yazi)：类似Vim的`f<char>` ，跳转到下一个名称以`<char>`开头的文件

[smart-filter.yazi](https://github.com/yazi-rs/plugins/tree/main/smart-filter.yazi)：一个让过滤器变得更智能的Yazi插件：连续过滤，自动进入唯一目录，提交时打开文件。


