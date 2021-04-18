let s:save_cpo = &cpo
set cpo&vim


" 500ms 定时任务
" 1. 文件在其他地方修改时，自动更新
let timer = timer_start(500, 'Fresh', {'repeat': -1})
set autoread                    " 当文件被改动时自动载入buffer
function! Fresh(arg)
    " 检查文件是否被改动，如果没改动就加载到buffer
    execute 'checktime'
endfunction


" vim 记录上次退出时光标位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


" 一旦一行的字符超出79个的话就把那些字符的背景设为红色
autocmd BufReadPost *.py :call CheckLineLength()
autocmd BufNewFile *.py :call CheckLineLength()
func! CheckLineLength()
    hi OverLength ctermbg=red ctermfg=white guibg=#ff4000
    match OverLength /\%80v.\+/
endfunc


" 备份修改前的文件，同时把最终的文件也拷贝备份一下
" 只要所有操作都是使用vim进行的，每次写入都不会丢失
if g:cursystem == 1
    set backup
    function Bkdir()
        let $BKODIR=expand(g:BackUpDir)
        let $RUNTIMEPATH=expand("%:p:h")
        let $BKDIR=$BKODIR.$RUNTIMEPATH
        if !isdirectory(expand("$BKDIR"))
            call mkdir(expand("$BKDIR"),"p",0777)
        endif
        let &backupdir=expand("$BKDIR")
    endfunction
    function BKLatest()
        let $BKODIR=expand()
        let $RUNTIMEPATH=expand("%:p:h")
        let $BKDIR=$BKODIR.$RUNTIMEPATH
        " 拷贝当前文件过去
        let curfile=expand("%:p")
        execute(":silent !\cp -f ".curfile." ".$BKDIR)
    endfunction
    au BufWrite * call Bkdir()
    au BufWritePost * call BKLatest()
    autocmd BufWritePre * let &bex = '_'.strftime("%Y%m%d_%H:%M:%S")
endif


function! CleanBuffer()
    let s:curWinNr = winnr()
    if winbufnr(s:curWinNr) == 1
        ret
    endif
    let s:curBufNr = bufnr("%")
    while s:nextBufNr != s:curBufNr
        exe "bn"
        exe "bdel".s:nextBufNr
        let s:nextBufNr = bufnr("%")
    endwhile
endfunction


function! OpenInNewTab()
    " 在新tab内打开当前文件（用于配合跳转到定义，快速浏览源码文件目录）
    let filepath = expand("%:p")
    let folderpath = expand("%:h")
    let curline = line(".")
    execute "tabnew " . filepath
    execute "tcd " . folderpath
    execute "normal " . curline . "gg"
endfunction


func! GitBlame()
    " % 当前完整的文件名
    " %:h 文件名的头部，即文件目录.例如../path/test.c就会为../path
    " %:t 文件名的尾部.例如../path/test.c就会为test.c
    " %:r 无扩展名的文件名.例如../path/test就会成为test
    " %:e 扩展名
    let file = expand('%:t')
    let file_folder = expand('%:h')
    let line = line('.')
    let cmd = 'git -C '.file_folder.' --no-pager blame '.file.' -L '.line.',+1 --porcelain'
    let git_blame = split(s:system(cmd), "\n")
    let l:shell_error = s:has_vimproc() ? vimproc#get_last_status() : v:shell_error
    if l:shell_error
        echo file. "file_folder:". file_folder
        echo git_blame
        return
    endif

    let commit_hash = matchstr(git_blame[0], '^\^*\zs\S\+')
    if commit_hash =~# '^0\+$'
        echo 'Not Committed Yet'
        return
    endif

    let summary = ''
    for line in git_blame
        if line =~# '^summary '
            let summary = matchstr(line, '^summary \zs.\+$')
            break
        endif
    endfor

    let author = matchstr(git_blame[1], 'author \zs.\+$')
    let author_mail = matchstr(git_blame[2], 'author-mail \zs.\+$')
    let author_time = strftime("%Y-%m-%dT%H:%M:%S", matchstr(git_blame[3], 'author-time \zs.\+$'))
    let author_tz = matchstr(git_blame[4], 'author-tz \zs.\+$')

    echo '['.commit_hash[0:8].'] '.author.' '.author_time.author_tz.' '.summary
endf


" function! common#search(...)
"     let force = a:0 >= 1 ? 1 : 0
"     let cword = expand("<cword>")
"     let search_cmd = ":AsyncRun! ag "
"     if len(cword) > 0 && force == 0
"         let search_cmd = search_cmd."-w ".cword
"         let file_suffix = "".expand("%:e")
"         if len(file_suffix) > 0
"             let search_cmd = search_cmd." -G ".file_suffix."$"
"         endif
"     else
"         let user_input = input("ag ")
"         if len(user_input) == 0
"             return
"         endif
"         let search_cmd = search_cmd.user_input
"     endif
"     execute search_cmd." --vimgrep"
" endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""

func! s:get_selected_str()
    let [startline, startcol, endline, endcol] = [line("'<"), col("'<"), line("'>"), col("'>")]
    let lines = []
    for linenr in range(startline, endline)
        call add(lines, getline(linenr))
    endfor
    if len(lines) == 0
        return ''
    endif
    let endcol -= 1
    let lines[-1] = lines[-1][:-(len(lines[-1])-endcol+1)]
    let lines[0] = lines[0][startcol-1:]
    let select = substitute(join(lines, ' '), '\s\+', ' ', 'ge')
    return select
endfunction


let s:line_number_status = 1
function! ToggleLineNumber()
    if s:line_number_status == 1
        let s:line_number_status = 0
        execute("set nonumber")
        execute("set norelativenumber")
        execute("set wrap")
    else
        let s:line_number_status = 1
        execute("set number")
        execute("set relativenumber")
        execute("set nowrap")
    endif
endfunction


function! s:has_vimproc()
    if !exists('s:exists_vimproc')
        try
            call vimproc#version()
            let s:exists_vimproc = 1
        catch
            let s:exists_vimproc = 0
        endtry
    endif
    return s:exists_vimproc
endfunction


function! s:system(str, ...)
    let command = a:str
    let input = a:0 >= 1 ? a:1 : ''
    if a:0 == 0
        let output = s:has_vimproc() ? vimproc#system(command) : system(command)
    elseif a:0 == 1
        let output = s:has_vimproc() ? vimproc#system(command, input) : system(command, input)
    else
        " ignores 3rd argument unless you have vimproc.
        let output = s:has_vimproc() ? vimproc#system(command, input, a:2) : system(command, input)
    endif
    return output
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
