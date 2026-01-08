# Yazi

使用配置文件需先参考官方文档（[Yazi](https://yazi-rs.github.io/)）安装Yazi需要的一些扩展软件：

```shell
sudo apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick eza mediainfo
```

Yazi本体可以通过Cargo安装：

```shell
cargo install --force yazi-build
```

参考：

[【命令行必备】Yazi：最强文件管理器\_哔哩哔哩\_bilibili](https://www.bilibili.com/video/BV1yRkCYVEUT/)

[Bilibili-Yazi](https://instaboard.app/b/UYDDqLRsB)

插件：

[compress.yazi](https://github.com/KKV9/compress.yazi)：可将选定的文件或文件夹压缩到存档中

[git.yazi](https://github.com/yazi-rs/plugins/tree/main/git.yazi)：在文件列表中以linemode显示Git文件更改的状态

[starship.yazi](https://github.com/Rolv-Apneseth/starship.yazi)：在Yazi中显示starship命令行信息（[starship/starship: ☄🌌️ The minimal, blazing-fast, and infinitely customizable prompt for any shell!](https://github.com/starship/starship)）

> starship也可以使用Cargo安装：
>
> ```shell
> cargo install starship --locked
> ```

[yaziline.yazi](https://github.com/llanosrocas/yaziline.yazi)：Yazi的简单类似lualine的状态行，在状态行中显示更多信息

[full-border.yazi](https://github.com/yazi-rs/plugins/tree/main/full-border.yazi)：给Yazi加上完整的边框，让它看起来更华丽

[eza-preview.yazi](https://github.com/ahkohd/eza-preview.yazi)：[Yazi](https://github.com/sxyazi/yazi)插件使用[eza](https://github.com/eza-community/eza)预览目录，可以在列表和树模式之间切换

[chmod.yazi](https://github.com/yazi-rs/plugins/tree/main/chmod.yazi)：对所选文件执行`chmod`以更改其模式。该插件仅在 Unix 平台上可用，因为它依赖于`chmod`

[jump-to-char.yazi](https://github.com/yazi-rs/plugins/tree/main/jump-to-char.yazi)：类似Vim的`f<char>` ，跳转到下一个名称以`<char>`开头的文件

[smart-filter.yazi](https://github.com/yazi-rs/plugins/tree/main/smart-filter.yazi)：一个让过滤器变得更智能的Yazi插件：连续过滤，自动进入唯一目录，提交时打开文件

[yazi.nvim](https://github.com/mikavilpas/yazi.nvim)：此插件允许您在Neovim的浮动窗口中打开yazi，配合[Neovim](https://neovim.io/)使用，使用[lazy.nvim](https://lazy.folke.io/)安装，具体参照我的nvim配置[HC3560/HC-Config](https://github.com/HC3560/HC-Config)

[confirm-quit.yazi](https://yazi-rs.github.io/docs/tips#confirm-quit)：如果有多个标签页打开，在退出前进行一次确认。注意：使用此插件时，您可能会在 Yazi 退出前注意到一个短暂的弹出窗口闪烁。这是一个“运行任务”确认弹出窗口。有关此行为的更多详细信息，请参阅： [#1059](https://github.com/sxyazi/yazi/issues/1059)

[close-and-restore-tab.yazi](https://github.com/MasouShizuka/close-and-restore-tab.yazi)：一个添加关闭和恢复标签功能的Yazi插件

[sudo.yazi](https://github.com/TD-Sky/sudo.yazi)：在yazi中调用sudo命令

[toggle-pane.yazi](https://github.com/yazi-rs/plugins/tree/main/toggle-pane.yazi)：切换不同面板的显示、隐藏和最大化状态：父级、当前和预览

[yamb.yazi](https://github.com/h-hg/yamb.yazi)：一款用于书签管理的Yazi插件。持久书签，关闭yazi后，书签不会丢失；快速通过快捷键跳转、删除和重命名书签；支持通过[fzf](https://github.com/junegunn/fzf)进行模糊搜索；可使用Lua语言配置书签

[mediainfo.yazi](https://github.com/boydaihungst/mediainfo.yazi)：这是一个用于预览媒体文件的Yazi插件。预览中用`ffmpeg`显示缩略图（如果有的话），媒体元数据用`mediainfo`显示。
