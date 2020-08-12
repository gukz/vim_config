call plug#begin('~/.vim/user_plug')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'skywind3000/asyncrun.vim'
" 注释
Plug 'preservim/nerdcommenter'
" 配色
Plug 'morhetz/gruvbox'
" 键绑定
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" 禁止使用jjjjjjjj来移动光标
Plug 'takac/vim-hardtime'
" 扩充vim text object
Plug 'wellle/targets.vim'
" 补全整合插件
Plug 'codota/tabnine-vim'
" vim session 保存相关
Plug 'tpope/vim-obsession'
" jump code
Plug 'pechorin/any-jump.vim'
" vim使用情况统计
Plug 'wakatime/vim-wakatime'
" quickfix 预览
Plug 'bfrg/vim-qf-preview'
" 快速跳转
Plug 'easymotion/vim-easymotion'
Plug 'fidian/hexmode'
Plug 'Chiel92/vim-autoformat'
Plug 'psliwka/vim-smoothie'
Plug 'itchyny/vim-cursorword'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'OmniSharp/omnisharp-vim'
" 替换功能及时预览
Plug 'markonm/traces.vim'
" leader ww快速交换窗口
Plug 'wesQ3/vim-windowswap'
Plug 'skywind3000/vim-terminal-help'
" 实验性的使用csharp 插件
" Plug 'OmniSharp/omnisharp-vim'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'skywind3000/vim-terminal-help'
let g:terminal_key='<m-t>'
let g:terminal_cwd=0
let g:asynctasks_term_pos='thelp'
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'Chiel92/vim-autoformat'
let g:autoformat_verbosemode=1
autocmd BufWrite *.sql,*.c,*.java,*.js,*.html :Autoformat "设置发生保存事件时执行格式化
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'OmniSharp/omnisharp-vim'
let g:OmniSharp_selector_ui = 'fzf'
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'fidian/hexmode'
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.png,*.jpg,*.jpeg,*.gif,*.pdf'
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'plasticboy/vim-markdown'
let g:vim_markdown_fenced_languages = ["c=cpp", "c++=cpp", "viml=vim", "bash=sh", "ini=dosini", "golang=go"]
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_style_pythonic = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'itchyny/lightline.vim'
     " \ 'colorscheme': 'wombat',
     " \   'lineinfo': '%3l:%-2v%<',
     " \ 'component': {
     " \   'charvaluehex': '0x%B',
     " \ },

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 1 " Disable default mappings
let g:EasyMotion_startofline = 1 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'bfrg/vim-qf-preview'
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
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'pechorin/any-jump.vim'
" Show line numbers in search rusults
let g:any_jump_list_numbers = 1

" Auto search references
let g:any_jump_references_enabled = 1
let g:any_jump_definitions_enables = 0
" Auto group results by filename
let g:any_jump_grouping_enabled = 1

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'ag'


" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Customize any-jump colors with extending default color scheme:
let g:any_jump_colors = { "help": "Comment" }

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Normal",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 1

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp', '__pycache__']

" Search references only for current file type
" (default: false, so will find keyword in all filetypes)
let g:any_jump_references_only_for_current_filetype = 1

" Disable search engine ignore vcs untracked files
" (default: false, search engine will ignore vcs untracked files)
let g:any_jump_disable_vcs_ignore = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'mattn/vim-lsp-settings'
" 支持的语言以及安装方法
" https://github.com/mattn/vim-lsp-settings#supported-languages
" let g:lsp_settings = {
" \  'pyls': {'cmd': {server_info->['pyls']}},
" \  'gopls': {'cmd': {server_info->['gopls']}},
" \}
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'prabirshrestha/vim-lsp'
let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine
let g:lsp_highlight_references_enabled = 1
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

function! LspFormat()
    exec "LspDocumentFormat"
    sleep 300m
    " exec "w"
endfunction

" python
" pip install python-language-server
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
    autocmd! BufWritePre *.py silent call LspFormat()
endif
" golang
" go get -u golang.org/x/tools/cmd/gopls
" go get -u github.com/sourcegraph/go-langserver
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd! BufWritePre *.go silent call LspFormat()
endif
" csharp
if executable('omnisharp.sh')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'omnisharp',
        \ 'cmd': {server_info->['omnisharp.sh']},
        \ 'whitelist': ['cs'],
        \ })
    autocmd! BufWritePre *.cs silent call LspFormat()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""
" takac/vim-hardtime
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 0
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_ignore_quickfix = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""
" liuchengxu/vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""
" skywind3000/asyncrun.vim
let g:asyncrun_open = 8
"""""""""""""""""""""""""""""""""""""""""""""""""""
" morhetz/gruvbox
let g:gruvbox_contrast_dark='soft'
if !has('gui_running')
  set t_Co=256
endif

colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""
" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName)!= -1) | q | endif
"let NERDTreeShowLineNumbers=1                  " 显示行号
let g:NERDTreeAutoCenter=1
"let NERDTreeShowHidden=1                       " 是否显示隐藏文件
let g:NERDTreeWinSize=30                         " 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree
let g:NERDTreeIgnore=['\.pyc','\~$','\.swp', '__pycache__']     " 忽略一下文件的显示
" let NERDTreeShowBookmarks=1                    " 显示书签列表
" 显示目录
nnoremap <C-n> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf 配置
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'CursorLine'],
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'Search', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine'],
  \ 'hl+':     ['fg', 'Statement'], }
  " \ 'info':    ['fg', 'PreProc'],
  " \ 'border':  ['fg', 'Ignore'],
  " \ 'prompt':  ['fg', 'Conditional'],
  " \ 'pointer': ['fg', 'Exception'],
  " \ 'marker':  ['fg', 'KeyWord'],
  " \ 'spinner': ['fg', 'Label'],
  " \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
"""""""""""""""""""""""""""""""""""""""""""""""""""
" preservim/nerdcommenter
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
"""""""""""""""""""""""""""""""""""""""""""""""""""
