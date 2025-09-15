# HC-Config

这里我Linux系统中一些软件的配置文件的备份，方便后续系统迁移后的配置查找与直接使用。

如果对你也有一些帮助，我非常开心。

**使用配置需要先安装一些需要的扩展软件，请仔细阅读软件各自配置文件夹中的`README.md`文件。**

## Yazi

`yazi`文件夹中是对软件Yazi（[sxyazi/yazi: 💥 Blazing fast terminal file manager written in Rust, based on async I/O.](https://github.com/sxyazi/yazi)）的配置。

Yazi（意思是“鸭子”）是一个用 Rust 编写的终端文件管理器，基于非阻塞异步 I/O。它旨在提供高效、用户友好且可定制的文件管理体验。

对比joshuto速度更快，功能更丰富，且目前还在积极开发中，而joshuto由于其作者找到了新工作，目前已进入维护模式。

## Neovim

`nvim`文件夹中是对软件Neovim（[Home - Neovim](https://neovim.io/)）的配置。

Neovim是一个高度可扩展的基于Vim的文本编辑器。

## Zellij

用Rust编写的又一个好用的终端复用器（Terminal Multiplexers），类似于[tmux](https://github.com/tmux/tmux/wiki)

Zellij是一个面向开发者、运维人员和所有喜爱终端的用户的工作空间。功能丰富且开箱即用。

官网：[Zellij](https://zellij.dev/)，官网的网页设计和配色都很棒，且官方默认支持Everforest主题，好评！！！

> 最近对使用Rust编写的项目情有独钟:D

## 配置文件使用方法

进入`.config`文件夹中

```shell
cd .config
```

初始化仓库

```shell
git init
```

关联远程仓库

```shell
git remote add origin https://github.com/HC3560/HC-Config.git
```

拉取远程仓库的main分支

```shell
git pull origin main
```

设置本地分支追踪远程分支

```shell
git branch --set-upstream-to=origin/main main
```

下次仓库有新的更新时直接执行`git pull`，即可拉取最新的配置文件。
