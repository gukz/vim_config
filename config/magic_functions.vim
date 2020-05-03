" 500ms 定时任务
let timer = timer_start(500, 'Fresh', {'repeat': -1})
set autoread                    " 当文件被改动时自动载入buffer
function Fresh(arg)
    " 检查文件是否被改动，如果没改动就加载到buffer
    execute 'checktime'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim 记录上次退出时光标位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" 一旦一行的字符超出79个的话就把那些字符的背景设为红色
" autocmd BufReadPost *.py :call CheckLineLength()
" autocmd BufNewFile *.py :call CheckLineLength()
" func! CheckLineLength()
"     hi OverLength ctermbg=red ctermfg=white guibg=#ff4000
"     match OverLength /\%80v.\+/
" endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""
" 备份修改前的文件，同时把最终的文件也拷贝备份一下
" 只要所有操作都是使用vim进行的，每次写入都不会丢失
set backup
function Bkdir()
    let $BKODIR=expand("$HOME/.vim/backup")
    let $RUNTIMEPATH=expand("%:p:h")
    let $BKDIR=$BKODIR.$RUNTIMEPATH
    if !isdirectory(expand("$BKDIR"))
        call mkdir(expand("$BKDIR"),"p",0777)
    endif
    let &backupdir=expand("$BKDIR")
endfunction
function BKLatest()
    let $BKODIR=expand("$HOME/.vim/backup")
    let $RUNTIMEPATH=expand("%:p:h")
    let $BKDIR=$BKODIR.$RUNTIMEPATH
    " 拷贝当前文件过去
    let curfile=expand("%:p")
    execute(":silent !\cp -f ".curfile." ".$BKDIR)
endfunction
au BufWrite * call Bkdir()
au BufWritePost * call BKLatest()
autocmd BufWritePre * let &bex = '_'.strftime("%Y%m%d_%H:%M:%S")
