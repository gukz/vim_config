这是一篇介绍如何使用vim的笔记。
# vim 是啥
- vim 是一个可配置的文本编辑器，可以灵活的编辑任何格式的文本。
- vim 很稳定并且不断发展以变得更好。

# vim 的基本使用
略

# vim 还能干啥

## 撤销/重做 undo tree
- 当你使用vim时，你总是可以使用`u`命令撤销操作。也可以通过`<c-r>`重新执行这个操作。
- 通过`:undolist`查看所有的undo分支。
- 当你的撤销记录中出现分叉时，可以使用`g-/+`跳转到时间线上的上/下一个操作。
- 还可以通过时间命令进行快速切换。`:earlier 20m` 将文档变更到20分钟前。类似的还有`later`命令以及`dhms`等单位。
- 通过配置，undo tree 可以配置成固化到本地，因此你可以无限undo。
- undo tree [文档](https://vimhelp.org/usr_32.txt.html#usr_32.txt)

## 缓冲区 标签页 窗口
### 缓冲区 buffer
- buffer是指一个文件的内容占用的那部分vim内存。
- 进入vim前 vim <文件名> 直接将多个文件的内容读取进vim形成相应的buffer。

- :ls, :buffers       列出所有缓冲区
- :bn[ext]            下一个缓冲区
- :bp[revious]        上一个缓冲区
- :b {number, expression}     跳转到指定缓冲区
- :b `<Tab>`  查看Vim提供的备选文件列表，配合wildmenu使得这成为buffer最强大的功能之一

```
set wildmenu
set wildmode=full
set wildchar=<Tab>
set wildcharm=<C-Z>
```

buffer之间的光标位置跳转通过`<c-o>/<c-i>`来实现。
如果使用跳转到定义功能，可以使用`<c-t>`来回到跳转前。

### 标签页 tab
- 进入vim前 vim -p `<filename>` 以多标签形式打开文件。如vim -p * 就是编辑当前目录的所有文件。
- :tabe `<filename>`  在新标签页中打开指定的文件。
- :tabnew `<filename>`  在新标签页中编辑新的文件。
- :tabf  允许你在当前目录搜索文件，并在新标签页中打开。比如`tabf img.*`。此命令只能打开一个文件.
> 通过`set tabpagemax=15`设定最多可打开的标签数量。默认是10.

- :tabs  显示已打开标签页的列表，并用“>”标识出当前页面，用“+”标识出已更改的页面
- :tabc  关闭当前标签页
- :tabo  关闭所有的标签页
- :tabn或gt  移动到下一个标签页
- :tabp或gT  移动到上一个标签页
- :{num}gt 快速跳转到相应的标签页
- :tabfirst或:tabr  移动到第一个标签页
- :tablast  移动到最后一个标签页
- :tabm [次序]  移动当前文件的标签页次序。比如:tabm 1将把当前标签页移动到第2的位置。如:tabm不指定参数将被移动到最后。
- :set showtabline=[1,2,3]  标签页在窗口上方显示标签栏。
> =0完全不显示标签栏，=1只有用户新建时才显示，=2总是显示标签栏。

- :tabdo <命令>  同时在多个标签页中执行命令。
> 比如`:tabdo %s/food/drink/g` 命令把当前多个标签页文件中的“food”都替换成“drink”。

### 窗口 window
水平、垂直分屏。
- :sp <file> 垂直分屏
- :vsp <file> 水平分屏

## 文件类型检测 filetype
通过`:filetype`命令查看你的文件类型检测功能有没有打开。

```
filetype on        打开文件类型检测
filetype plugin on 允许vim加载文件类型插件
filetype indent on 允许vim为使用特定文件类型的缩进
```

可以简写成`filetype plugin indent on` 。

## 语法高亮 syntax
[官方文档](https://vimhelp.org/usr_44.txt.html#usr_44.txt)

## 按键映射 map
按键映射是vim中一个十分强大的功能，为我们提供了极大的便利性。
### 常用模式中的按键映射
| Command      | Normal | Visual + Select | operator pending | Insert Only | Command Line |
| ------------ | -----: | :-------------: | :--------------: | :---------: | :----------: |
|  [nore]map   | x      | x               | x                |             |              |
| n[nore]map   | x      |                 |                  |             |              |
| v[nore]map   |        | x               |                  |             |              |
| o[nore]map   |        |                 | x                |             |              |
|  [nore]map!  |        |                 |                  | x           | x            |
| i[nore]map   |        |                 |                  | x           |              |
| c[nore]map   |        |                 |                  |             | x            |
### 非递归映射 nore
递归映射某些场景下可能比较有用，但是由于终止条件不好把握，因此可能会导致一些问题。
### 其他的不常用的模式中的按键映射
> - tmap(终端模式)
> - lmap(语言字符映射，包含map!以及search模式和命令的参数，例如r和f)
> - smap(选择模式Only)
> - xmap(可视模式Only)

### 前缀键 leader
vim本身自带很多快捷键，再加上插件的快捷键，用户自定义的快捷键等。大量的快捷键出现在单层空间中必然会引起冲突。
前缀键就是为了解决这个问题。
通过 `let mapleader=` 来定义前缀键，定义好后可以使用前缀键进行按键映射。
> `map! <leader>c :`

### 带参数的映射
vim 的map不仅仅可以映射按键，还可以支持多种参数。这些参数需要写在map命令后面。

| 参数     | 作用                                                     |
| -------: | :------------------------------------------------------: |
|`<buffer>`  | 这个映射只作用于当前buffer                             |
|`<nowait>`  | vim立即响应命令，不等待后续命令                        |
|`<silent>`  | 使键绑定的对象不输出内容                               |
|`<special>` | 用于:map `<special>` `<F12>`                           |
|`<script>`  | 只使用`<SID>`开头的脚本中的定义，避免外部脚本干扰      |
|`<expr>`    | 接收参数来给以计算出实际的映射结果                     |
|`<unique>`  | 仅仅当映射不存在时映射成功                             |

更多的映射参数可以查阅 [官方文档](http://vimcdoc.sourceforge.net/doc/map.html)

## 自动命令 autocommand 
自动命令由一些行为触发，这些行为包括：
读取文件，写入文件，缓冲区内容变更等。
灵活使用自动命令可以帮助我们更方便的完成任务。
`:autocmd [group] {events} {file_pattern} [nested] {command}`
- group: 可以将一些自动命令放到一个组里，然后通过
- events: 指由vim的某些行为触发的事件，例如打开文件，写入文件等。
- file\_pattern: 一个筛选文件的正则。
- nested: 允许循环调用自动命令，当你的自动命令中会触发自身时。
[官方文档](https://vimhelp.org/autocmd.txt.html#autocmd-events)

## quickfix
quickfix 将编译过程中产生的错误信息保存到文件中，然后vim利用这些信息跳转到源文件的对应位置。
### 例子
> 写入python文件自动校验flake8.
> vim全局内容检索。

## vim的插件系统
### vim的插件目录结构。
- 通用插件：      plugin
- 文件类型插件：  ftpplugin
> 在编辑特定文件类型时，这类插件才会启用。

- 语法插件：      syntax
> 主要是语法高亮的定义，用户可以自定义高亮规则。

- 延迟加载插件：      autoload
> 延迟加载插件代码，到需要时才加载。

### 与多种工具集成
vim 可以调用bash
> gitblame
> translate
> 模糊检索文件名
> ag全文检索

## vim script
vim script 是vim负责解释、执行的一种脚本语言，语法类似python。
[官方文档](https://vimhelp.org/usr_41.txt.html#usr_41.txt)


## 使用python代码编写vim插件
```
function! Bar()
python << EOF
import vim
cur_buf = vim.current.buffer
print "Lines: {0}".format(len(cur_buf))
print "Contents: {0}".format(cur_buf[-1])
EOF
endfunction
```

## neovim 与 vim8

# 参考资料
- [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)
- [vim帮助手册](https://vimhelp.org/)
- [Vim Scripting through Python](http://heather.cs.ucdavis.edu/~matloff/Python/PyVimscript.html)
