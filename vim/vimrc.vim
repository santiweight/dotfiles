"PLUGINS
set nocompatible
filetype off

so $DOTDIR/vim/tabs.vim
so $DOTDIR/vim/packages.vim
set rtp+=$DOTDIR/vim/bundle/Vundle.vim

" Function to vundle all plugins
call vundle#begin()
    "Plugin 'vim-syntastic/syntastic'
    Plugin 'VundleVim/Vundle.vim'

    " Make vim an IDE
    Plugin 'w0rp/ale'
    Plugin 'valloric/youcompleteme'

    Plugin 'scrooloose/nerdtree'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'maxbrunsfeld/vim-yankstack'
    Plugin 'yegappan/mru'
    Plugin 'sjl/gundo.vim'

    " Language specific
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'tbastos/vim-lua'
    Plugin 'lervag/vimtex'
    Plugin 'xuhdev/vim-latex-live-preview'

    " Visual
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

    " Add vim objects
    Plugin 'wellle/targets.vim'
    Plugin 'michaeljsmith/vim-indent-object'
    Plugin 'AndrewRadev/sideways.vim'

    " Tim Pope
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'tpope/vim-fugitive'

" Add plugins before this line
call vundle#end()
call yankstack#setup()

filetype plugin indent on

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Header commands
	let mapleader=","

" Presentation settings
    set relativenumber

    set textwidth=0
	set breakindent

	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

    set colorcolumn+=80
    highlight ColorColumn ctermbg=0 guibg=lightgrey
	set cursorline

	set display+=lastline

	syntax on

    set synmaxcol=10000

    set dir=/tmp/

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

" Highlight options
	set hlsearch
    hi Search ctermbg=LightYellow ctermfg=Red
    set smartcase

    nnoremap <silent> <esc><esc> <esc>:nohlsearch<CR><esc>

    nnoremap j gj
    nnoremap k gk

	nnoremap n nzzzv
	nnoremap N Nzzzv

    nnoremap <S-l> }
    nnoremap <S-h> {
    vnoremap <S-l> }
    vnoremap <S-h> {

	nnoremap H ^
	nnoremap L $
	vnoremap H ^
    vnoremap L $

	set backspace=indent,eol,start
    set pastetoggle=<leader>op

	nnoremap <Space> za
	nnoremap <leader>zz zf}

    nn T ct
    nn Y y$

	nnoremap vv 0v
	nnoremap <leader>l :set list!<cr>
	set mouse=a
	set incsearch

" Language Specific
	" Tabs

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>


" File and Window Management
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>
	nnoremap <leader>q :q<CR>
	nnoremap <leader>x :x<CR>

    "nnoremap <D-y> y$

	nnoremap <leader>rso :mapc<CR>:w<CR>:so $MYVIMRC<CR>
	nnoremap <leader>r. :edit!<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
    nnoremap <leader>cw <C-w><C-c>

	nnoremap <leader>2 2s

    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>eb :vsp $MYBASHRC<CR>

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


" Tmux options
    " mouse compatibility with tmux
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end

" Mac settings
    " set alt key bindings
    if has("gui_macvim")
        set macmeta
        nmap π <m-p>
        nmap ∏ <m-P>
        nmap ˚ <m-k>
        nmap ∆ <m-j>
        nmap ˜ <m-n>
        nmap ø <m-o>
        nmap œ <m-q>
        nmap ˙ <m-h>
        nmap ¬ <m-l>
    endif

" Colour edits
    hi clear Folded
    hi Folded ctermfg=191 ctermbg=235
    hi clear SignColumn " ctermbg=234
    hi ALEErrorSign ctermbg=234 ctermfg=160
    hi ALEWarningSign ctermbg=234 ctermfg=11
    hi ALEStyleSign ctermbg=234 ctermfg=11
    hi ALEWarning cterm=underline ctermfg=green

    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = ':('
    let g:ale_sign_style_error = ':('

    let g:ale_completion_delay = 10
    let g:ale_completion_enabled = 1



" Window management
    nnoremap <leader><tab> :tabnext<CR>
    nnoremap <leader><s-tab> :tabprevious<CR>
    nnoremap <leader>tp :tabprevious<CR>
    nnoremap <leader>tn :tabnew<CR>
    nnoremap <leader>tq :tabclose<CR>
