let mapleader=" "
""""""""""""""""""""""""""""""""""""""""""""""""""" " 
" ga 或者 :as[cii] 打印光标位置字符编码
" za 快速折叠、取消折叠代码" zm 快速折叠全部代码
" zn 快速解除折叠全部代码
"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim 正则环视和固化分组
" vim               perl           含义
" pattern@=         (?=pattern)    顺序环视
" pattern@!         (?!pattern)    顺序否定环视
" pattern@<=        (?<=pattern)   逆序环视
" pattern@<!        (?<!pattern)   逆序否定环视
" pattern@>         (?>pattern)    固化分组
" pattern%(atom)    (?:pattern)    非捕获型括号
"""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <expr> q exists('b:mad_number') ? '1' : 'q'
nnoremap <expr> w exists('b:mad_number') ? '2' : 'w'
nnoremap <expr> e exists('b:mad_number') ? '3' : 'e'
nnoremap <expr> r exists('b:mad_number') ? '4' : 'r'
nnoremap <expr> t exists('b:mad_number') ? '5' : 't'
nnoremap <expr> y exists('b:mad_number') ? '6' : 'y'
nnoremap <expr> u exists('b:mad_number') ? '7' : 'u'
nnoremap <expr> i exists('b:mad_number') ? '8' : 'i'
nnoremap <expr> o exists('b:mad_number') ? '9' : 'o'
nnoremap <expr> p exists('b:mad_number') ? '0' : 'p'

fun! ToggleNumberMode()
    if !exists('b:mad_number')
        let b:mad_number=1
        echo "Mad Number"
    else
        unlet b:mad_number
        echo "Leave Mad Number"
    endif
endfun

noremap <tab> :call ToggleNumberMode()<CR>


inoremap jj <esc>
" 翻译
noremap <leader>t :call common#mode_trans()<CR>
noremap <leader>t :call common#mode_trans("")<cr>
" base64编、解码
noremap <leader>e :call common#base64()<CR>
noremap <leader>E :call common#base64("")<CR>
" 全文检索
nnoremap <leader>s :call common#search()<CR>
nnoremap <leader>S :call common#search("")<CR>

" 终端模式下按两次esc退出
tnoremap <esc><esc> <c-\><c-n>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>j :AnyJump<CR>
" 其他
nnoremap <leader>b :call common#gitblame()<CR>
noremap <leader>; :
nnoremap <leader>o :call common#OpenInNewTab()<CR>
" noremap p "0p
nnoremap <CR> :noh<CR><CR>
" quickfix 窗口
nnoremap <leader>q :call asyncrun#quickfix_toggle(8)<CR>
" 异步执行任务，在quick fix 窗口展示结果
nnoremap <leader>r :AsyncRun 
nnoremap <leader>z :!zsh<CR>

" Ctrl + hjkl 切换窗口
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap = <c-w>=
nnoremap - <c-w>-
nnoremap + <c-w>+
nnoremap <F3> :call common#ToggleLineNumber()<CR>
""""""""""""""""""""""
" language server
" :LspCodeAction	Gets a list of possible commands that can be applied to a file so it can be fixed (quick fix)
" :LspDeclaration	Go to the declaration of the word under the cursor, and open in the current window
" :LspDefinition	Go to the definition of the word under the cursor, and open in the current window
" :LspDocumentDiagnostics	Get current document diagnostics information
" :LspDocumentFormat	Format entire document
" :LspDocumentRangeFormat	Format document selection
" :LspDocumentSymbol	Show document symbols
" :LspHover	Show hover information
" :LspImplementation	Show implementation of interface in the current window
" :LspNextError	jump to next error
" :LspNextReference	jump to next reference to the symbol under cursor
" :LspPeekDeclaration	Go to the declaration of the word under the cursor, but open in preview window
" :LspPeekDefinition	Go to the definition of the word under the cursor, but open in preview window
" :LspPeekImplementation	Go to the implementation of an interface, but open in preview window
" :LspPeekTypeDefinition	Go to the type definition of the word under the cursor, but open in preview window
" :LspPreviousError	jump to previous error
" :LspPreviousReference	jump to previous reference to the symbol under cursor
" :LspReferences	Find references
" :LspRename	Rename symbol
" :LspStatus	Show the status of the language server
" :LspTypeDefinition	Go to the type definition of the word under the cursor, and open in the current window
" :LspWorkspaceSymbol	Search/Show workspace symbol
" 键绑定
nnoremap gn :LspNextDiagnostic<CR>
nnoremap gl :LspDocumentDiagnostics<CR>
nnoremap gd :LspDefinition<CR>
nnoremap gh :LspHover<CR>
nnoremap gs :LspStatus<CR>
" nnoremap gr :LspReferences<CR>
""""""""""""""""""""""
