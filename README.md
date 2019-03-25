# vim-probe
> vim编辑器配置记录

## 学习vim的使用，快捷键的使用，vimscript的编写
> 最好的方式就是即用既查既学，暂时不用的就不要放到脑子里占地方了

* http://www.runoob.com/linux/linux-vim.html
* https://www.w3cschool.cn/vim/cjtr1pu3.html
* http://vimdoc.sourceforge.net/htmldoc/help.html
* http://learnvimscriptthehardway.stevelosh.com/
* https://vim-adventures.com/
### 常用功能的脚本设置
```
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
" filetype plugin on 
" 自适应不同语言的智能缩进
" filetype indent on
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 设置前缀键
let mapleader=";"
" 开启行号显示
set number
" 设置鼠标模式
set mouse=n
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容vi模式
set nocompatible
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
```

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

## 配色方案插件
```
colorscheme phd
```
* 配色方案网站 http://vimcolorschemetest.googlecode.com/svn/html/index-c.html

## Indent Guides缩进可视化插件
* https://github.com/nathanaelkane/vim-indent-guides
```
Plugin 'nathanaelkane/vim-indent-guides'
```
```
" 可视化缩进随vim启动，需要配色方案提供风格
let g:indent_guides_enable_on_vim_startup = 0 
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键i开关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
```

## 使用ctags生成标签文件
* 举例
```
ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++
ctags -I __THROW -I __THROWNL -I __nonnull -R --c-kinds=+p --fields=+iaS --extra=+q
ctags -I __THROW --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --fields=+S -R -f ~/.vim/systags /usr/include/ /usr/local/include/
```

## 插件tagbar归类ctags标签
* 设置快捷键
```
nnoremap <Leader>tl :TagbarToggle<CR>
```

## 插件indexer自动生成ctags标签并引入
```
" 设置indexer调用ctags的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
```
* 在.indexer_files中设置tags文件名和工程目录
```
[example]
/home/your/path/
```

## 模板补全插件UltiSnips
* 新版 UltiSnips 并未自带预定义的代码模板，可以从 https://github.com/honza/vim-snippets 获取各类语言丰富的代码模板，也可以重新写一套符合自己编码风格的模板。
```
" 设定补全模板所在目录
let g:UltiSnippetDirectories="home/your/path/cpp.snippets"
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
```

## YouCompleteMe
* 在 http://llvm.org/releases/download.html 找到最新版 LLVM，Pre-built Binaries 下选择适合你发行套件的最新版预编译二进制文件，下载并解压。
* 编译YCM的动态库
```
cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DPATH_TO_LLVM_ROOT=/opt/clang+llvm/path/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core
```
* 每个工程目录都可以配置一个.ycm_extra_conf.py文件，配置各类参数。参考该插件目录里的样例。

## 参考来源
* https://github.com/yangyangwithgnu/use_vim_as_ide
* https://github.com/VundleVim/Vundle.vim
* https://github.com/Valloric/YouCompleteMe
* https://github.com/OmniSharp/omnisharp-vim
* https://github.com/chromium/vim-codesearch
* https://github.com/wklken/k-vim
* https://github.com/meetbill/Vim
* https://github.com/ma6174/vim-deprecated

## 可能用到的源码
* https://github.com/vim/vim
* https://github.com/universal-ctags/ctags
* http://ctags.sourceforge.net/
* https://github.com/git/git