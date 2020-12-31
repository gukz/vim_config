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
" .*贪婪  .{-}不贪婪
"""""""""""""""""""""""""""""""""""""""""""""""""""
" easy motion
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" nmap <leader>l <Plug>(easymotion-lineforward)
" nmap <leader>j <Plug>(easymotion-j)
" nmap <leader>k <Plug>(easymotion-k)
" nmap <leader>h <Plug>(easymotion-linebackward)
" nmap s <Plug>(easymotion-overwin-f2)

nnoremap <leader>b :call common#gitblame()<CR>
nnoremap <leader>c :call common#CleanBuffer()<CR>
noremap <leader>; :
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
nnoremap <leader>o :call common#OpenInNewTab()<CR>
nnoremap <cr> :noh<cr><cr>
noremap <leader>ga :argadd **/*.
noremap <leader>gd :argdo e

tnoremap <esc><esc> <c-\><c-n>
" 输入模式下移动光标
imap <c-l> <right>
imap <c-j> <down>
imap <c-k> <up>
imap <c-h> <left>
noremap <leader>t :term<CR>
" 全文检索
nnoremap <leader>s :call common#search()<CR>
" nnoremap <leader>S :call common#search("")<CR>
nnoremap <leader>S :Clap grep<CR>
nnoremap <leader>f :Clap files<CR>
" 查找文件、引用
nnoremap <leader>a :AnyJump<CR>
nnoremap <leader>p :echo expand("%:p")<CR>
" quickfix 窗口
nnoremap <leader>q :call asyncrun#quickfix_toggle(8)<CR>
" 异步执行任务，在quick fix 窗口展示结果
nnoremap <leader>r :AsyncRun 
if g:cursystem == 0
    nnoremap <leader>z :!powershell<CR>
else
    nnoremap <leader>z :!bash<CR>
endif
" Ctrl + hjkl 切换窗口
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap = <c-w>=
nnoremap - <c-w>-
nnoremap + <c-w>+
nnoremap <F3> :call common#ToggleLineNumber()<CR>
nnoremap <F4> :Autoformat<CR>
autocmd! FileType qf nnoremap <buffer> <c-x> <C-w><Enter>
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
nnoremap gr :LspReferences<CR>
""""""""""""""""""""""
