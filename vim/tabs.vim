" Global tab settings
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set expandtab
    set smarttab

" Language specific tab settings
    autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/
	autocmd Filetype html setlocal sw=2 expandtab
	autocmd Filetype javascript setlocal sw=4 expandtab
    autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
    autocmd FileType vue set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
    autocmd FileType js set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
    autocmd FileType html set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
    autocmd FileType go set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab
    autocmd FileType tex,txt set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 smarttab smartcase linebreak spell nocul colorcolumn=0 | nnoremap j gj| nnoremap k gk

au BufNewFile,BufRead *.py
    \ set tabstop=4  |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
