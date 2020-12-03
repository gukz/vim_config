" g:cursystem 0:windows 1:linux 2:osx
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:cursystem = 0
else
    let g:cursystem = 1
endif

if g:cursystem == 0
    so c:\\dev\\vimfiles\\config\\basic.vim
    so c:\\dev\\vimfiles\\config\\auto_function.vim
    so c:\\dev\\vimfiles\\config\\key_binding.vim
    so c:\\dev\\vimfiles\\config\\plug_with_config.vim
else
    so ~/.vim/config/basic.vim
    so ~/.vim/config/auto_function.vim
    so ~/.vim/config/key_binding.vim
    so ~/.vim/config/plug_with_config.vim
endif

" 微信小程序
au BufNewFile,BufRead *.wxml set filetype=html
au BufNewFile,BufRead *.wxss set filetype=css
" csharp project
au BufNewFile,BufRead *.props set filetype=html
au BufNewFile,BufRead *.proj set filetype=html
