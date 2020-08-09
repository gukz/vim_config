" csharp特定的键绑定
nnoremap gn :OmniSharpGlobalCodeCheck<CR>
nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap gh :OmniSharpSignatureHelp<CR>
nnoremap gr :OmniSharpFindUsages<CR>

setlocal omnifunc=OmniSharp#Complete
" 让omnisharp使用roslyn
let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_prefer_global_sln = 1

" 设置omnisharp
let g:OmniSharp_timeout = 1
set noshowmatch
set completeopt=longest,menuone,preview
let g:syntastic_cs_checkers = ['code_checker']
set updatetime=500
augroup omnisharp_commands
    autocmd!
    autocmd FileType cs call s:SetCSharpOptions()
    setlocal omnifunc=OmniSharp#Complete
    fun! s:SetCSharpOptions()
        autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
        autocmd BufWritePost *.cs call OmniSharp#AddToProject()
        autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
        " 设置快捷键
        " F12转到定义
        nnoremap <F12> :OmniSharpGotoDefinition<cr>
        nnoremap gd :OmniSharpGotoDefinition<cr>
        " Ctrl+F12转到实现
        nnoremap <C-F12> :OmniSharpFindImplementations<cr>
        nnoremap fi :OmniSharpFindImplementations<cr>
        " F11查找使用
        nnoremap <F11> :OmniSharpFindUsages<cr>
        nnoremap fu :OmniSharpFindUsages<cr>
        nnoremap ft :OmniSharpFindType<cr>
        nnoremap fs :OmniSharpFindSymbol<cr>
        nnoremap fm :OmniSharpFindMembers<cr>
        nnoremap fx  :OmniSharpFixIssue<cr>
        nnoremap fxu :OmniSharpFixUsings<cr>
        nnoremap tt :OmniSharpTypeLookup<cr>
        nnoremap dc :OmniSharpDocumentation<cr>
        nnoremap <C-Up> :OmniSharpNavigateUp<cr>
        nnoremap <C-Down> :OmniSharpNavigateDown<cr>
        nnoremap gc :OmniSharpGetCodeActions<cr>
        vnoremap gcv :call OmniSharp#GetCodeActions('visual')<cr>
        " F2重命名
        nnoremap <F2> :OmniSharpRename<cr>
        nnoremap rl :OmniSharpReloadSolution<cr>
        nnoremap cf :OmniSharpCodeFormat<cr>
        nnoremap tp :OmniSharpAddToProject<cr>
        nnoremap ss :OmniSharpStartServer<cr>
        nnoremap sp :OmniSharpStopServer<cr>
        nnoremap th :OmniSharpHighlightTypes<cr>
        " F1切换buffer
        nnoremap <F1> :buffers<CR>:buffer
        " F5编译+运行
        nnoremap <F5> :make<CR>
        " Enter选择提示内容+显示文档
        inoremap <expr><Enter> pumvisible() ? "\<C-Y>\<Esc>:OmniSharpDocumentation<CR>a" : "\<Enter>"
        " Tab切换提示内容
        inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        " (选择提示内容+显示文档
        inoremap <expr>( pumvisible() ? "\<Esc>:OmniSharpDocumentation<CR>a(" : "("
        " 添加多行注释
        inoremap /// ///<Space><summary><CR><CR></summary><Esc>kA<Space>
        " 设置即时提示
        set completeopt+=menu
        set completeopt+=menuone
        set completeopt+=noinsert
        autocmd InsertCharPre * call s:TypeComplete()
        fun! s:TypeComplete()
            if pumvisible() && v:char !~ '\.'
                return ''
            endif
            if v:char =~ '\(\K\|\.\)'
                call feedkeys("\<C-x>\<C-o>", 'n')
            endif
        endfun
    endfun
augroup END
