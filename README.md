# vim-probe
> vim编辑器配置记录

## 使用Vundle插件管理vim插件
* 下载Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
* 在.vimrc中添加
```
" Vundle环境设置
filetype off
" 设置初始化相关的 runtime path 包括Vundle
set rtp+=~/.vim/bundle/Vundle.vim
" vundle管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
" 加载vim自带的和插件相应的语法和文件类型相关脚本
filetype plugin indent on
```
* 添加插件举例
```
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
```
> vim 官网 http://www.vim.org/ 上的所有插件均在 https://github.com/vim-scripts/ 有镜像，添加github上的插件需写明`'用户名/仓库名'`，vim-scripts的插件可以只写仓库名，不在github的需要写出git全路径
* 在vim的底行模式安装插件
```
:PluginInstall
```


配色方案网站
http://vimcolorschemetest.googlecode.com/svn/html/index-c.html

新版 UltiSnips 并未自带预定义的代码模板，你可以从 https://github.com/honza/vim-snippets 获取各类语言丰富的代码模板，也可以重新写一套符合自己编码风格的模板

在 http://llvm.org/releases/download.html 找到最新版 LLVM，Pre-built Binaries 下选择适合你发行套件的最新版预编译二进制文件，下载并解压


cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DPATH_TO_LLVM_ROOT=/opt/clang+llvm/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

cmake --build . --target ycm_core
