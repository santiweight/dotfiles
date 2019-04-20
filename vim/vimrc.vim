"PLUGINS
set nocompatible
filetype off
set rtp+=~/dotfiles/vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-commentary'
Plugin 'itchyny/lightline.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'wellle/targets.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'valloric/youcompleteme'

" Add plugins before this line
call vundle#end()
filetype plugin indent on


" Header commands
	let mapleader=","

" Tab settings
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set expandtab
    set smarttab

" Presentation settings
    set textwidth=80

	syntax on
    set colorcolumn+=80
    highlight ColorColumn ctermbg=0 guibg=lightgrey

    set dir=/tmp/
	set number

    set autochdir
	set laststatus=2
    set showcmd

" Autocomplete file opening
    set path+=**
    set wildmenu
    set wildmode=longest:full,full

" Tag jumping
    command! MakeTags !ctags -R .

    set complete+=k

	autocmd Filetype html setlocal sw=2 expandtab
	autocmd Filetype javascript setlocal sw=4 expandtab

	set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

	set hlsearch
    hi Search ctermbg=LightYellow
    hi Search ctermfg=Red

    nnoremap <silent> <esc><esc> <esc>:nohlsearch<CR><esc>
    nnoremap <C-n> :NERDTreeToggle<CR>

   func! WordProcessor()
        map j gj
        map k gk
        setlocal textwidth=80

        setlocal formatoptions=1
        setlocal noexpandtab
        setlocal wrap
        setlocal linebreak
        setlocal nonumber
        setlocal spell spelllang=en_us
    endfunction

	nnoremap n nzzzv
	nnoremap N Nzzzv
    autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

    nnoremap <C-l> }
    nnoremap <C-h> {
    vnoremap <C-l> }
    vnoremap <C-h> {

	nnoremap H ^
	nnoremap L $
	vnoremap H ^
	vnoremap L $

	set backspace=indent,eol,start
    set pastetoggle=<leader>sp

	nnoremap <Space> za
	nnoremap <leader>zz zf}

    nn Y y$

	nnoremap vv 0v
	nnoremap <leader>l :set list!<cr>
	set mouse=a
	set incsearch

" Language Specific
	" Tabs
		so ~/dotfiles/vim/tabs.vim

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
 
" this is a piece of tester text for parenthesising function
	" General
		" inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
		" inoremap <leader>pfor <esc>Ifor i in range(0, <esc>A):  <enter><esc>O<tab>
		" inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
    
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
	nnoremap <leader>q :q<CR>
	nnoremap <leader>x :x<CR>

    nnoremap <D-y> y$

	nnoremap <leader>rso :mapc<CR>:w<CR>:so $MYVIMRC<CR>
	nnoremap <leader>r. :edit!<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
    nnoremap <leader>cw <C-w><C-c>
    
    " Mode cursor settings
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

        "Cursor settings:
        "  1 -> blinking block
        "  2 -> solid block 
        "  3 -> blinking underscore
        "  4 -> solid underscore
        "  5 -> blinking vertical bar
        "  6 -> solid vertical bar

    nnoremap <tab> <C-w><C-w>
    vnoremap <tab> <C-w><C-w>

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
    " vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

	nnoremap <m-k> :m .-2<CR>==
    nnoremap <m-j> :m .+1<CR>==

    nmap <m-p> <Plug>yankstack_substitute_older_paste
    nmap <m-P> <Plug>yankstack_substitute_newer_paste
     
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    if has("gui_macvim")
        set macmeta
        nmap π <m-p>
        nmap ∏ <m-P>
        nmap ˚ <m-k>
        nmap ∆ <m-j>
        nmap ˜ <m-n>
        nmap ø <m-o>
        nmap œ <m-q>
    endif

    nnoremap <leader><tab> :tabnext<CR>
    nnoremap <leader>tp :tabprevious<CR>
    nnoremap <leader>tn :tabnew<CR>
    nnoremap <leader>tq :tabclose<CR>
