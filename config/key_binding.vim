let mapleader=" "
"""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" ga 或者 :as[cii] 打印光标位置字符编码
" za 快速折叠、取消折叠代码
" zm 快速折叠全部代码
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
" 需要光标先选择
" 翻译选中的内容
vnoremap <leader>t :call common#visual_trans()<CR>
" 把选中的字符进行base64解码
vnoremap <leader>d :call common#base64_d()<CR>
inoremap jj <esc>
" 终端模式下按两次esc退出
tnoremap <esc><esc> <c-\><c-n>
" 翻译
nnoremap <leader>t :call common#trans(expand("<cword>"))<CR>
nnoremap <leader>T :call common#normal_trans()<CR>
" 检索
nnoremap <leader>s :call common#search()<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>j :AnyJump<CR>
" 其他
nnoremap <leader>b :call common#gitblame()<CR>
noremap <leader>; :
" noremap p "0p
nnoremap <CR> :noh<CR><CR>
" quickfix 窗口
nnoremap <leader>q :call asyncrun#quickfix_toggle(8)<CR>
" 异步执行任务，在quick fix 窗口展示结果
nnoremap <leader>r :AsyncRun 
nnoremap <leader>z :!zsh<CR>
" 代码片段
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


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
nnoremap gr :LspRename<CR>
""""""""""""""""""""""
