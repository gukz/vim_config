inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
    \ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

nnoremap gu :OmniSharpFindUsages<cr>
nnoremap gi :OmniSharpFindImplementations<cr>
nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap gh :OmniSharpSignatureHelp<CR>
nnoremap gn :OmniSharpGlobalCodeCheck<CR>
nnoremap gp :OmniSharpPreviewDefinition<CR>

let g:Omnisharp_lookup_metadata = 1
