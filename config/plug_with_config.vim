if g:cursystem == 0
    call plug#begin(expand(g:vimfiles)."/user_plug_win")
else
    call plug#begin(expand(g:vimfiles)."/user_plug")
endif

"""""""""""""""""""""""""""""""""""""
" syntax
Plug 'sheerun/vim-polyglot'
"""""""""""""""""""""""""""""""""""""
Plug 'neovim/nvim-lspconfig'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"""""""""""""""""""""""""""""""""""""
" 浮动窗口命令行
Plug 'voldikss/vim-floaterm'
"""""""""""""""""""""""""""""""""""""
Plug 'norcalli/nvim-colorizer.lua'
"""""""""""""""""""""""""""""""""""""
Plug 'dstein64/vim-startuptime'
" Launch vim-startuptime with :StartupTime. 
" Press K on events to get additional information. 
" Press gf on sourcing events to load the corresponding file in a new split.
"""""""""""""""""""""""""""""""""""""
Plug 'deris/vim-shot-f'
" Highlight characters to move directly with f/t/F/T
"""""""""""""""""""""""""""""""""""""
" 输入 :{number} 直接预览buffer
Plug 'nacro90/numb.nvim'
"""""""""""""""""""""""""""""""""""""
" neovim 公共icon插件
Plug 'kyazdani42/nvim-web-devicons'
"""""""""""""""""""""""""""""""""""""
" 一些自定义的插件
Plug 'gukz/customVimPlug'
"""""""""""""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
"""""""""""""""""""""""""""""""""""""
Plug 'kien/rainbow_parentheses.vim'
"""""""""""""""""""""""""""""""""""""
" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName)!= -1) | q | endif
"let NERDTreeShowLineNumbers=1                 " 显示行号
let g:NERDTreeAutoCenter=1
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0                       " 是否显示隐藏文件
let g:NERDTreeWinSize=30                       " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree
let g:NERDTreeIgnore=['\.pyc','\~$','\.swp', '__pycache__', '\bin', '\cache']     " 忽略一下文件的显示
" let NERDTreeShowBookmarks=1                    " 显示书签列表
" 显示目录
"""""""""""""""""""""""""""""""""""""
" 在echo中打印帮助文档
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'
highlight link EchoDocPopup Pmenu
"""""""""""""""""""""""""""""""""""""
" 搜索神器
Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary!' }
let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }
let g:clap_disable_run_rooter=v:true
let g:clap_open_action = { 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'  }
"""""""""""""""""""""""""""""""""""""
Plug 'rhysd/accelerated-jk'
let g:accelerated_jk_acceleration_table = [2, 4, 7, 15]
"""""""""""""""""""""""""""""""""""""
Plug 'godlygeek/tabular'
"""""""""""""""""""""""""""""""""""""
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_fenced_languages = ["c=cpp", "c++=cpp", "viml=vim", "bash=sh", "ini=dosini", "golang=go"]
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_style_pythonic = 1
"""""""""""""""""""""""""""""""""""""
Plug 'itchyny/lightline.vim'

     " \ 'colorscheme': 'wombat',
     " \   'lineinfo': '%3l:%-2v%<',
     " \ 'component': {
     " \   'charvaluehex': '0x%B',
     " \ },

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'fileformat', 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component': {
      \ },
      \ }
"""""""""""""""""""""""""""""""""""""
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"""""""""""""""""""""""""""""""""""""
" vim寄存器
Plug 'tversteeg/registers.nvim'
"""""""""""""""""""""""""""""""""""""
Plug 'gennaro-tedesco/nvim-peekup'
"""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 8
"""""""""""""""""""""""""""""""""""""
Plug 'skywind3000/vim-terminal-help'
"""""""""""""""""""""""""""""""""""""
" 注释
Plug 'preservim/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" [count]<leader>cc |NERDCommenterComment|
" Comment out the current line or text selected in visual mode.
" [count]<leader>cn |NERDCommenterNested|
" Same as cc but forces nesting.
" [count]<leader>c<space> |NERDCommenterToggle|
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
" [count]<leader>cm |NERDCommenterMinimal|
" Comments the given lines using only one set of multipart delimiters.
" [count]<leader>ci |NERDCommenterInvert|
" Toggles the comment state of the selected line(s) individually.
" [count]<leader>cs |NERDCommenterSexy|
" Comments out the selected lines with a pretty block formatted layout.
" [count]<leader>cy |NERDCommenterYank|
" Same as cc except that the commented line(s) are yanked first.
" <leader>c$ |NERDCommenterToEOL|
" Comments the current line from the cursor to the end of line.
" <leader>cA |NERDCommenterAppend|
" Adds comment delimiters to the end of line and goes into insert mode between them.
" |NERDCommenterInsert|
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
" <leader>ca |NERDCommenterAltDelims|
" Switches to the alternative set of delimiters.
" [count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
" Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
" [count]<leader>cu |NERDCommenterUncomment|
" Uncomments the selected line(s).
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配色
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark='soft'
"""""""""""""""""""""""""""""""""""""
" 键绑定
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"""""""""""""""""""""""""""""""""""""
" 禁止使用jjjjjjjj来移动光标
" Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 0
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_ignore_quickfix = 1
"""""""""""""""""""""""""""""""""""""
" 扩充vim text object
Plug 'wellle/targets.vim'
"""""""""""""""""""""""""""""""""""""
" Plug 'codota/tabnine-vim'
"""""""""""""""""""""""""""""""""""""
" vim session 保存相关
Plug 'tpope/vim-obsession'
"""""""""""""""""""""""""""""""""""""
" jump code
Plug 'pechorin/any-jump.vim'
let g:any_jump_disable_default_keybindings = 1
let g:any_jump_remove_comments_from_results = 1
let g:any_jump_ignored_files = ['*.tmp', '*.temp', '*.pyc', '*.dll', '*/bin/*', '*/obj/*']
let g:any_jump_disable_vcs_ignore = 0
"""""""""""""""""""""""""""""""""""""
" 多光标选中
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"""""""""""""""""""""""""""""""""""""
" vim使用情况统计
" Plug 'wakatime/vim-wakatime'
"""""""""""""""""""""""""""""""""""""
" quickfix 预览
Plug 'bfrg/vim-qf-preview'
augroup qfpreview
    autocmd!
    autocmd FileType qf nmap <buffer> p <plug>(qf-preview-open)
augroup END
let g:qfpreview = {
    \ 'scrollup': 'k',
    \ 'scrolldown': 'j',
    \ 'halfpageup': 'u',
    \ 'halfpagedown': 'd',
    \ 'fullpageup': 'b',
    \ 'fullpagedown': 'f',
    \ 'close': 'q',
    \ 'scrollbar': 0,
    \ 'mouseclick': 'none',
    \ 'height': 20
    \ }
"""""""""""""""""""""""""""""""""""""
" 快速跳转
Plug 'easymotion/vim-easymotion'

let g:EasyMotion_do_mapping = 1 " Disable default mappings
let g:EasyMotion_startofline = 1 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
"""""""""""""""""""""""""""""""""""""
Plug 'fidian/hexmode'
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.png,*.jpg,*.jpeg,*.gif,*.pdf'
"""""""""""""""""""""""""""""""""""""
Plug 'psliwka/vim-smoothie'
"""""""""""""""""""""""""""""""""""""
Plug 'itchyny/vim-cursorword'
"""""""""""""""""""""""""""""""""""""
" csharp
Plug 'vim-syntastic/syntastic'
let g:syntastic_cs_checkers = ['OmniSharp']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" """""""""""""""""""""""""""""""""""""
Plug 'OmniSharp/omnisharp-vim'
let g:OmniSharp_selector_ui = 'clap'
let g:OmniSharp_selector_findusages = 'clap'
let g:OmniSharp_diagnostic_exclude_paths = [
\ 'obj\\',
\ 'bin\\',
\ 'packages\\',
\ 'TestResults\\',
\ 'out\\',
\ 'Debug\\',
\ 'Release\\',
\ '[Tt]emp\\',
\ '\.nuget\\',
\ '\<AssemblyInfo\.cs\>'
\]
let g:OmniSharp_diagnostic_overrides = {
\ 'IDE0010': {'type': 'I'},
\ 'IDE0055': {'type': 'W', 'subtype': 'Style'},
\ 'CS8019': {'type': 'None'},
\ 'RemoveUnnecessaryImportsFixable': {'type': 'None'}
\}

"""""""""""""""""""""""""""""""""""""
" " 替换功能及时预览
Plug 'markonm/traces.vim'
"""""""""""""""""""""""""""""""""""""
" leader ww快速交换窗口
Plug 'wesQ3/vim-windowswap'
"""""""""""""""""""""""""""""""""""""
" lsp
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
"
" let g:lsp_signs_enabled = 0
" let g:lsp_diagnostics_echo_cursor = 1
" highlight link LspErrorText GruvboxRedSign " requires gruvbox
" highlight clear LspWarningLine
" let g:lsp_highlight_references_enabled = 1
" highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green
"
"
" " python
" " pip install python-language-server
" if executable('pyls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
"     autocmd! BufWritePre *.py silent call LspFormat()
"     function! LspFormat()
"         exec "LspDocumentFormat"
"         sleep 300m
"         " exec "w"
"     endfunction
" endif
" " golang
" " go get -u golang.org/x/tools/cmd/gopls
" " go get -u github.com/sourcegraph/go-langserver
" if executable('gopls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'gopls',
"         \ 'cmd': {server_info->['gopls']},
"         \ 'whitelist': ['go'],
"         \ })
"     autocmd! BufWritePre *.go silent call LspFormat()
"     function! LspFormat()
"         exec "LspDocumentFormat"
"         sleep 300m
"         " exec "w"
"     endfunction
" endif

call plug#end()

colorscheme gruvbox
