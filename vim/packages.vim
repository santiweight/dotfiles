" Syntastic options
    " remove highlighting for python
    autocmd FileType py 
                highlight SyntasticWarning NONE |
              \ highlight SyntasticError NONE

" vim-latex options
    autocmd Filetype tex setl updatetime=1
    let g:lisepreview_previewer = 'open -a Preview'

" NERDTree options
    nnoremap <C-n> :NERDTreeToggle<CR>

    " check for other NERDTrees?
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" MRU options
    nnoremap <leader>m :MRU<CR>

" Yankstack options
    nmap <m-p> <Plug>yankstack_substitute_older_paste
    nmap <m-P> <Plug>yankstack_substitute_newer_paste
 
"Gundo toggle
    nnoremap <leader>u :GundoToggle<CR>     

" Function to edit raw text
    func! WordProcessor()
        map j gj
        map k gk
        setlocal textwidth=80

        setlocal formatoptions=1
        setlocal noexpandtab
        setlocal wrap
        setlocal linebreak
        setlocal spell spelllang=en_us
    endfunction
