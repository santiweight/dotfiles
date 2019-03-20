" General Vim settings
	syntax on
	let mapleader=","
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set dir=/tmp/
	set relativenumber 
	set number
    set showcmd

	set statusline=current:\ %F
	set laststatus=2

	autocmd Filetype html setlocal sw=2 expandtab
	autocmd Filetype javascript setlocal sw=4 expandtab

	set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	"nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	nnoremap n nzzzv
	nnoremap N Nzzzv

    nnoremap <C-l> }
    nnoremap <C-h> {
    inoremap <C-l> <esc>}i
    inoremap <C-h> <esc>{i
    vnoremap <C-l> }
    vnoremap <C-h> {
    nnoremap j gj
    nnoremap k gk
	nnoremap 0 0
	nnoremap H 0w
	nnoremap L $
	vnoremap H 0w
	vnoremap L $
	nnoremap J 10j
	nnoremap K 10k
	vnoremap J 10j
	vnoremap K 10k

	set backspace=indent,eol,start
    set pastetoggle=<F2>


	nnoremap <Space> za
	nnoremap <leader>zz zf}

	nnoremap vv 0v$

	set listchars=tab:\|\ 
	nnoremap <leader><tab> :set list!<cr>
	set mouse=a
	set incsearch

" Language Specific
	" Tabs
		so ~/dotfiles/vim/tabs.vim

" Implementing brace matching commands
    let g:brace_dict = {
        \ "(" : ")",
        \ "[" : "]",
        \ "{" : "}",
        \ "<" : ">",
        \ "\"" : "\"",
        \ "\'" : "\'"
    \}

    for [key, val] in items(brace_dict)
		exe "nnoremap <leader>".val." :<c-u>let n=v:count1<CR>bea".val."<esc>:exe 'normal'.n.'B'<CR>i".key."<esc>%"
		exe "nnoremap <leader>".key." :<c-u>let n=v:count1<CR>wbi".key."<esc>:exe 'normal'.n.'E'<CR>a".val."<esc>%"
		exe "nnoremap <leader>.".val." :<c-u>let n=v:count1<CR>a".val."<esc>:exe 'normal'.n.'B'<CR>i".key."<esc>%"
		exe "nnoremap <leader>.".key." :<c-u>let n=v:count1<CR>i".key."<esc>:exe 'normal'.n.'E'<CR>a".val."<esc>%"
		exe "inoremap <leader>".val." <esc>:<c-u>let n=v:count1<CR>bea".val."<esc>:exe 'normal'.n.'B'<CR>i".key."<esc>%"
		exe "inoremap <leader>".key." <esc>:<c-u>let n=v:count1<CR>wbi".key."<esc>:exe 'normal'.n.'E'<CR>a".val."<esc>%"
		exe "inoremap <leader>.".val." <esc>l:<c-u>let n=v:count1<CR>a".val."<esc>:exe 'normal'.n.'B'<CR>i".key."<esc>%"
		exe "inoremap <leader>.".key." <esc>l:<c-u>let n=v:count1<CR>i".key."<esc>:exe 'normal'.n.'E'<CR>a".val."<esc>%"
    endfor
    nmap ) <leader>)
    nmap ( <leader>(
    nmap " <leader>"
    nmap ' <leader>'
    nmap [ <leader>[
    nmap ] <leader>]

" this is a piece of tester text for parenthesising function
	" General
		inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
		inoremap <leader>pfor <esc>Ifor i in range(0, <esc>A):  <enter><esc>O<tab>
		inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
    
	" Java
	"   inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
	"   vnoremap <leader>sys yOSystem.out.println(<esc>pA);

	" Java
	"   inoremap <leader>con <esc>Iconsole.log(<esc>A);
	"   vnoremap <leader>con yOconsole.log(<esc>pA);

	" C++
	"   inoremap <leader>cout <esc>Istd::cout << <esc>A << std::endl;
	"   vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;

	" C
	"   inoremap <leader>out <esc>Iprintf(<esc>A);<esc>2hi
	"   vnoremap <leader>out yOprintf(, <esc>pA);<esc>h%a

	" Typescript
	"   autocmd BufNewFile,BufRead *.ts set syntax=javascript
	"   autocmd BufNewFile,BufRead *.tsx set syntax=javascript

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>


" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	nmap cL c$
	nmap yL y$
	nmap dL d$

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>
	inoremap <leader>.q <ESC>:wq<CR>
	nnoremap <leader>.q :wq<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>so :mapc<CR>:w<CR>:so $MYVIMRC<CR>
	nnoremap <leader>rel :edit!<CR>
    nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
    nnoremap <leader>cw <C-w><C-c>

    nmap <leader><tab> <C-w><C-w>
    nmap <C-tab> <C-w><C-w>

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Auto load
	" Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	" Notification after file change
	set autoread 
	" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Future stuff
	"Swap line
	"Insert blank below and above
    nnoremap <C-j> :m .+1<CR>==
	nnoremap <C-k> :m .-2<CR>==

