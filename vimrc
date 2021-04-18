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

execute(":source ".expand(g:vimfiles)."/config/plug.vim")
execute(":source ".expand(g:vimfiles)."/config/basic.vim")
execute(":source ".expand(g:vimfiles)."/config/auto_function.vim")
execute(":source ".expand(g:vimfiles)."/config/key_binding.vim")
execute(":source ".expand(g:vimfiles)."/config/plug_with_config.vim")

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

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=false }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
  --   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- end
  -- if client.resolved_capabilities.document_range_formatting then
  --   buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  -- end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local pid = vim.fn.getpid()
local omnisharp_bin = "c:/dev/vimfiles/ls/omnisharp-win-x64/OmniSharp.exe"
nvim_lsp['omnisharp'].setup{
    cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
    on_attach = on_attach;
}
EOF

" 微信小程序
au BufNewFile,BufRead *.wxml set filetype=html
au BufNewFile,BufRead *.wxss set filetype=css
" csharp project
au BufNewFile,BufRead *.props set filetype=html
au BufNewFile,BufRead *.proj set filetype=html
