" ALE options
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['eslint'],
    \   'python' : ['yapf']
    \}

    " Set this variable to 1 to fix files when you save them.
    let g:ale_fix_on_save = 1

    " Set this in your vimrc file to disabling highlighting
    let g:ale_set_highlights = 0

" Syntastic options
    " remove highlighting for python
    autocmd FileType py
                highlight SyntasticWarning NONE |
              \ highlight SyntasticError NONE

" vim-latex options
    autocmd Filetype tex setl updatetime=1
    let g:lisepreview_previewer = 'latexmk -f'

" NERDTree options
    nnoremap <C-n> :NERDTreeToggle<CR>

    " check for other NERDTrees?
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" MRU options
    nnoremap <leader>m :MRU<CR>

" Yankstack options
    nmap <m-p> <Plug>yankstack_substitute_older_paste
    nmap <m-P> <Plug>yankstack_substitute_newer_paste

" Gundo toggle
    nnoremap <leader>u :GundoToggle<CR>

" Airline  options
    let g:airline_theme='simple'
    function! LinterStatus() abort
        let l:counts = ale#statusline#Count(bufnr(''))

        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors

        return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
    endfunction

    set statusline=%{LinterStatus()}

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

" Sideways Settings
nnoremap <m-h> :SidewaysLeft<cr>
nnoremap <m-l> :SidewaysRight<cr>
