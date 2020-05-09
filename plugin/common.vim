let s:save_cpo = &cpo
set cpo&vim


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


func! common#gitblame()
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
        echo 'blame failed'
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

function! common#base64_d()
    let select = s:get_selected_str()
    if len(select) > 0
        let cmd = 'echo -n "'.select.'"|base64 -d'
        let res = split(s:system(cmd), "\n")
        if len(res) > 0
            echo res
        endif
    endif
endfunction

function! common#search()
    let cword = expand("<cword>")
    let search_cmd = ":AsyncRun ag "
    if len(cword) > 0
        let search_cmd = search_cmd." -w ".cword
        let file_suffix = "".expand("%:e")
        if len(file_suffix) > 0
            let search_cmd = search_cmd." -G ".file_suffix."$"
        endif
    else
        let user_input = input("ag ")
        if len(user_input) == 0
            return
        endif
        let search_cmd = search_cmd.user_input
    endif
    execute search_cmd
endfunction

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


func! common#visual_trans()
    let select = s:get_selected_str()
    call common#trans(select)
endf


function! common#normal_trans()
    let user_input = input("Translate: ")
    echo ""
    if len(user_input) == 0
        return
    endif
    call common#trans(user_input)
endfunction


function! common#trans(...)
    let user_input = ""
    for word in a:000
        let user_input = user_input." ".word
    endfor
    let user_input = substitute(user_input, '\v[\"]+', ' ', 'ge')
    let match_eng = matchstr(user_input, "\v[ a-zA-Z0-9\(\)\[\]\{\}\<\>\t'\"\&\^\%\$\#\@\*\/\\,\.:\?\!\-\+=]+")
    if len(match_eng) * 2 > len(user_input)
        " is en
        " split(s:system('trans -b :zh "'.user_input.'"'), "\n")
        let cmd = 'trans -b -no-auto :zh "'.user_input.'"'
    else
        " is zh
        " echo split(s:system('trans -b :en "'.user_input.'"'), "\n")
        " let cmd = 'trans -b -no-auto :en "'.user_input.'"'
        let cmd = 'trans -b -no-auto :zh "'.user_input.'"'
    endif
    call job_start(['/bin/bash', '-c', cmd], {'callback': 'DisplayTransResult'})
endfunction

function! DisplayTransResult(channel, msg)
    let trans_result = split(a:msg, "\n")
    if len(trans_result) < 1
        echo 'Network error'
        return
    endif
    echo trans_result[0]
endfunction


let s:line_number_status = 1
function! common#ToggleLineNumber()
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


let &cpo = s:save_cpo
unlet s:save_cpo
