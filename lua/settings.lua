vim.bo.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart

vim.wo.wrap = false -- Display long lines as just one line
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.wo.signcolumn = "no" -- Always show the signcolumn, otherwise it would shift the text each time

vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.backup = false -- This is recommended by coc
vim.o.backupcopy = "no"
vim.o.writebackup = false -- This is recommended by coc
vim.o.swapfile = false
vim.o.undodir = CONFIG_PATH .. '/undo'
vim.o.undofile = true  -- Enable persistent undo
vim.o.scrolloff = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.mouse = "a" -- Enable your mouse
vim.o.selection = "exclusive"
vim.o.selectmode = "key"
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.updatetime = 300 -- Faster completion
vim.o.updatecount = 100
vim.o.laststatus = 2
vim.o.showtabline = 1 -- Never show tabs
vim.o.showcmd = true
vim.o.showmode = false
vim.o.cmdheight = 1 -- More space for displaying messages
vim.o.ruler = true
vim.o.magic = true
vim.o.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 5
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.confirm = true
vim.o.backspace = "indent,eol,start"
vim.o.gdefault = true
vim.o.timeoutlen = 300 -- By default timeoutlen is 1000 ms
vim.o.ttimeoutlen = 0  -- By default timeoutlen is 1000 ms
vim.o.showmatch = true -- highlight the matching quota
vim.o.matchtime = 1
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.wildmenu = true
vim.o.autowrite = true
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.title = true
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.syntax = "on"  -- syntax highlighting
-- vim.o.t_Co = "256" -- Support 256 colors
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
-- vim.o.guifont = "Hack\\ Nerd\\ Font\\ Mono"
-- vim.o.guifont = "SauceCodePro Nerd Font:h17"
-- vim.o.guifont = "JetBrains\\ Mono\\ Regular\\ Nerd\\ Font\\ Complete"
-- vim.o.guifont = "FiraCode Nerd Font:h17"

-- set fillchars=vert:\ ,stl:\ ,stlnc:\   
-- vim.cmd("set fillchars=vert:\\ ,stl:\\ ,stlnc:\\ ")
vim.cmd('set iskeyword+=_,@,%,#,-') -- treat dash separated words as a word text object"
vim.cmd('set whichwrap+=<,>,[,],h,l')  -- move to next line with theses keys
vim.cmd("set viminfo='1000,f1")
-- vim.cmd("set viminfo^=%")
-- vim.cmd("set viminfo+=!")
vim.cmd('set colorcolumn=99999') -- fix indentline for now

TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
-- vim.cmd('set ts=4') -- Insert 2 spaces for a tab
-- vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set inccommand=split') -- Make substitution work in realtime
