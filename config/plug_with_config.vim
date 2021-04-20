if g:cursystem == 0
    call plug#begin(expand(g:vimfiles)."/user_plug_win")
else
    call plug#begin(expand(g:vimfiles)."/user_plug")
endif

"""""""""""""""""""""""""""""""""""""
" Install this plugin.
Plug 'tjdevries/nlua.nvim'

" (OPTIONAL): If you want to use built-in LSP (requires Neovim HEAD)
"   Currently only supported LSP, but others could work in future if people send PRs :)
Plug 'neovim/nvim-lspconfig'

" (OPTIONAL): This is recommended to get better auto-completion UX experience for builtin LSP.
Plug 'nvim-lua/completion-nvim'

" (OPTIONAL): This is a suggested plugin to get better Lua syntax highlighting
"   but it's not currently required
Plug 'euclidianAce/BetterLua.vim'

" (OPTIONAL): If you wish to have fancy lua folds, you can check this out.
Plug 'tjdevries/manillua.nvim'
"""""""""""""""""""""""""""""""""""""
" tree sitter
Plug 'nvim-treesitter/nvim-treesitter'
"""""""""""""""""""""""""""""""""""""
" syntax
Plug 'sheerun/vim-polyglot'
"""""""""""""""""""""""""""""""""""""
Plug 'kyazdani42/nvim-tree.lua'
let g:nvim_tree_side = 'right' "left by default
let g:nvim_tree_width = 30 "30 by default
" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 0 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
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
Plug 'jiangmiao/auto-pairs'
"""""""""""""""""""""""""""""""""""""
Plug 'kien/rainbow_parentheses.vim'
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
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
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

" Your custom attach function for nvim-lspconfig goes here.
" lua <<<
" local custom_nvim_lspconfig_attach = function(...) end
" 
" " To get builtin LSP running, do something like:
" " NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
" require('nlua.lsp.nvim').setup(require('lspconfig'), {
"   on_attach = custom_nvim_lspconfig_attach,
" 
"   -- Include globals you want to tell the LSP are real :)
"   globals = {
"     -- Colorbuddy
"     "Color", "c", "Group", "g", "s",
"   }
" })
" 
" EOF
