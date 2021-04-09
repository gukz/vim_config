" g:cursystem 
" 0:windows 
" 1:linux 
" 2:osx
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:cursystem = 0
else
    let g:cursystem = 1
endif

if g:cursystem == 0
    let g:vimfiles = 'c:/dev/vimfiles'
    let g:BackUpDir = ''
else
    let g:vimfiles = '~/.vim'
    let g:BackUpDir = '~/.vim/vimbackup'
endif

execute(":source ".expand(g:vimfiles)."/config/basic.vim")
execute(":source ".expand(g:vimfiles)."/config/plug_with_config.vim")
execute(":source ".expand(g:vimfiles)."/config/auto_function.vim")
execute(":source ".expand(g:vimfiles)."/config/key_binding.vim")

if !argc()
    if g:cursystem == 0
        let SessionPath = expand(g:vimfiles)."/session_win.vim"
    else
        let SessionPath = expand(g:vimfiles)."/session_linux.vim"
    endif
    if filereadable(SessionPath)
        silent! execute(":source ".expand(SessionPath))
    endif
    silent! execute(":Obsession ".expand(SessionPath))
endif

" 微信小程序
au BufNewFile,BufRead *.wxml set filetype=html
au BufNewFile,BufRead *.wxss set filetype=css
" csharp project
au BufNewFile,BufRead *.props set filetype=html
au BufNewFile,BufRead *.proj set filetype=html
