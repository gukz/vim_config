"""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本配置
so ~/.vim/config/basic.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义功能
so ~/.vim/config/auto_function.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
" 按键绑定
so ~/.vim/config/key_binding.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
so ~/.vim/config/plug_with_config.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
" 微信小程序
au BufNewFile,BufRead *.wxml set filetype=html
au BufNewFile,BufRead *.wxss set filetype=css
" csharp project
au BufNewFile,BufRead *.props set filetype=html
au BufNewFile,BufRead *.proj set filetype=html
"""""""""""""""""""""""""""""""""""""""""""""""""""
