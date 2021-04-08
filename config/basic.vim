set nocompatible               " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set hidden
" set showtabline=0              " 关闭tabline
set nobackup
set nowrap                     " 禁止自动换行
set go=                        " 不要图形按钮
set whichwrap+=<,>,h,l         " 允许backspace和光标键跨越行边界(不建议)
set scrolloff=4                " 光标移动到buffer的顶部和底部时保持4行距离
set nu                         " 显示行号  set number
set relativenumber             " 显示相对行号
set cul                        " 突出显示当前行  set cursorline
" set cuc                      " 高亮光标所在列
" autocmd InsertEnter * se cul    " 用浅色高亮当前行
" autocmd InsertLeave * se nocul  " 用浅色高亮非当前行 

" filetype on                    " 侦测文件类型
" filetype indent on             " 为特定文件类型载入相关缩进文件
" filetype plugin on             " 载入文件类型插件
filetype plugin indent on

" 配色方案
syntax enable                  " 开启代码高亮
syntax on                      " 语法高亮 
highlight Normal ctermbg=NONE guibg=NONE
" set t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" set t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors              " 使用24bit颜色

" n 普通模式
" v 可视模式
" i 插入模式
" c 命令行模式
" h 在帮助文件里，以上所有的模式
" a 以上所有的模式    可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
" r 跳过 |hit-enter| 提示
" A 在可视模式下自动选择
set mouse=n
set selection=exclusive
set selectmode=mouse,key
set clipboard=unnamed            " 共享剪贴板

set updatetime=500
set updatecount =100
set laststatus=2               " 始终展示状态栏"
set shortmess=atIc             " 启动的时候不显示那个援助乌干达儿童的提示
" set shortmess-=S               " 搜索时展示索引
set signcolumn=no
set backupcopy=yes             " 保存文件不要修改文件名

set viminfo='1000,f1           " 关闭时记录尽可能多的信息
set viminfo^=%                 " 关闭时记录buffer内容
set viminfo+=!                 " 保存全局变量

set showcmd                    " 输入的命令显示出来，看的清楚些
set noshowmode                 " 开启模式显示
set cmdheight=1                " 命令行（在状态行下）的高度，默认为1，这里是1
set ruler                      " 打开状态栏标尺
set magic                      " 正则表达式匹配形式
set guioptions-=T              " 隐藏工具栏
set guioptions-=m              " 隐藏菜单栏

set foldenable                 " 允许折叠 
set foldmethod=indent          " 允许代码折叠
set foldlevel=9
set foldcolumn=0

set conceallevel=2             " 语法隐藏配置

set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
set noeb                       " 去掉输入错误的提示声音
set confirm                    " 在处理未保存或只读文件的时候，弹出确认
set backspace=indent,eol,start " 使回格键（backspace）正常处理indent, eol, start等
set gdefault                   " 行内全局替换
set iskeyword+=_,@,%,#,-       " 带有如下符号的单词不要被换行分割
set formatoptions+=mM
" set breakat+=

set background=dark
set timeoutlen=300             " 按键超时时长
set ttimeoutlen=0

set tabstop=4                  " Tab键的宽度
set softtabstop=4              " 统一缩进为4
set shiftwidth=4
set expandtab                  " 用空格代替制表符
set smarttab                   " 在行和段开始处使用制表符
set smartindent
" set autoindent                 " 自动缩进

set pastetoggle=<F2>           " F2 进入粘贴模式
set completeopt=longest,menu,noselect   " 代码补全

set showmatch                  " 高亮显示匹配的括号
set matchtime=1                " 匹配括号高亮的时间（单位是十分之一秒）

set ignorecase                 " 搜索忽略大小写
set hlsearch                   " 搜索逐字符高亮
set incsearch
set smartcase                  " 搜索字符中出现大写字符时大小写敏感，否则不敏感

set encoding=utf-8             " 编码设置
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8       " menu语言设置
set helplang=zh                " help语言设置
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936

set wildmenu                   " 增强模式中的命令行自动完成操作
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.jpg,*.gif,*/__pycache__/*     " MacOSX/Linux
set wildignore+=*\\tmp\\*                                                      " Windows
set splitbelow
set splitright

set autowrite                  " 自动保存
" set history=1000               " 历史记录数
set noswapfile                 " 禁止生成临时文件

" gvim 配置
if has("gui_running")
    set guifont=Consolas:h14:cANSI
else
    set t_Co=256
endif

if g:cursystem == 0
    set shell=powershell.exe
    set shellcmdflag=\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
    set shellpipe=|
    set shellredir=>
    set shellquote=\"
    set shellxquote=
endif
