" vundle环境设置
filetype off
" 设置初始化相关的 runtime path 包括vundle
set rtp+=~/.vim/bundle/Vundle.vim
" vundle管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz' " 自动生成tags标签并引入
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim' " 分支undo，需要vim编译时支持python
Plugin 'Lokaltog/vim-easymotion'
" Plugin 'suan/vim-instant-markdown' " 需要安装ruby解释器，安装(gem install) 
" pygments.rb redcarpet，安装node.js 以及npm -g install instant-markdown-d
call vundle#end()
" 加载vim自带的和插件相应的语法和文件类型相关脚本
filetype plugin indent on

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
" 高亮STL类型，插件vim-cpp-enhanced-highlight功能
syntax keyword cppSTLtype initializer_list
" vim自身命令行模式智能补全
set wildmenu
" 列不超过80，除非单句话就超过80
set textwidth=80
" 高亮显示搜索结果
set hlsearch
" <EOL>: unix: <NL>
set fileformat=unix
" 标志当前行/列
" set cursorline
" set cursorcolumn
" 显示光标当前位置
" set ruler
" 将制表符扩展为空格，已有文件没有扩展，手动retab
" set expandtab
" 在屏幕的最后一行显示命令
" set showcmd
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为制表符
set softtabstop=4
" 显示状态栏
set laststatus=2
" 可解析的文件编码
" set fileencodings=gb2312,gbk,gb18030,ucs-bom,utf-8,default,latin1
" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'
" 禁止折行
" set nowrap
" 代码折叠，手动manual，缩进indent，语法syntax，未更改文本diff
" set foldmethod=indent
set foldmethod=syntax
" set foldmethod=marker
" 启动vim时关闭折叠代码
set nofoldenable
" ===========gvim=============
" 禁止光标闪烁
" set gcr=a:block-blinkon0
" 禁止显示滚动条
" set guioptions-=l
" set guioptions-=L
" set guioptions-=r
" set guioptions-=R
" 禁止显示菜单和工具条
" set guioptions-=m
" set guioptions-=T
" ===========gvim=============

" 配色方案
set background=dark
" colorscheme solarized
" colorscheme molokai
colorscheme phd
" 可视化缩进随vim启动，需要配色方案提供风格
let g:indent_guides_enable_on_vim_startup = 0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键i开关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 实现文件和头文件切换
nmap <silent> <Leader>sw :FSHere<cr>
" 空格键选中结对符包含的内容，shift空格取消选中
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 设置tagbar子窗口位置
let tagbar_left=1
" 设置子窗口宽度
let tagbar_width=32
" 设置子窗口不显示冗余帮助信息
" let g:tagbar_compact=1
" 设置显示隐藏子窗口的快捷键
nnoremap <Leader>tl :TagbarToggle<CR>
" 通过tagbar设置ctags对哪些标志符生成标签，生成tags时增加参数--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
" ctrl ]之后正像方向遍历同名标签
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>
" 设置indexer调用ctags的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" 设定补全模板所在目录
let g:UltiSnippetDirectories="home/champaign/.vim/bundle/ultisnips/cham/cpp.snippets"
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
" let g:UltiSnipsJumpForwardTrigger="<leader><c-tab>"
" let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
" 跳转到声明或定义
nnoremap <Leader>tc :YouCompleter GoToDeclaration<CR>
nnoremap <Leader>td :YouCompleter GoToDefinition<CR>
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 设置python解释器
let g:ycm_server_python_interpreter='/usr/bin/python'
" protodef插件功能：根据类声明自动生成类实现的代码框架
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
" let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键，不管用？
" map <C-Tab> :MBEbn<cr>
" map <C-S-Tab> :MBEbp<cr>
map <F2> a<C-R>=strftime("%c")<CR><Esc>
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif
