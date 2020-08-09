set nocompatible              " required
filetype off                  " required
"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'              " let Vundle manage Vundle, required
"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " A tree explorer plugin for vim
Plugin 'Shougo/unite.vim'               " Navigation between buffers and files
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'                " Search text in files
Plugin 'kana/vim-arpeggio'              " Key mappings for simultaneously pressed keys
"---------------=== Languages support ===-------------
Plugin 'w0rp/ale' 			" Syntax checking plugin for Vim
"Plugin 'scrooloose/syntastic'           " Syntax checking plugin for Vim
Plugin 'mitsuhiko/vim-sparkup'          " Sparkup (XML/jinja/html-django/etc.) support
Plugin 'scrooloose/nerdcommenter'

" --- CSS ---
Plugin 'JulesWang/css.vim'              " CSS syntax file
Plugin 'groenewege/vim-less'            " Vim syntax for LESS (dynamic CSS)

" --- JavaScript ---
Plugin 'pangloss/vim-javascript'        " Vastly improved Javascript indentation and syntax support in Vim

" --- HTML ---
Plugin 'othree/html5.vim'               " HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'            " Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation
Plugin 'chrisbra/matchit'               " Navigate between tags

" --- Python ---
Plugin 'davidhalter/jedi-vim'           " Awesome Python autocompletion with VIM
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'   " PEP8 indent
Plugin 'jmcantrell/vim-virtualenv'      " Virtualenv support in VIM
Plugin 'vim-scripts/indentpython.vim'
Plugin 'heavenshell/vim-pydocstring'

" --- Lisp ---
Plugin 'l04m33/vlime', {'rtp': 'vim/'}
Plugin 'bhurlow/vim-parinfer'
Plugin 'junegunn/rainbow_parentheses.vim'

" --- Elixir ---
Plugin 'elixir-editors/vim-elixir'

" --- XML ---
Plugin 'xni/vim-beautifiers'            " JSON/XML beautifier
" --- JSON ---
Plugin 'elzr/vim-json'
" --- Go ---
"Plugin 'fatih/vim-go'

" --- SQL ---
Plugin 'vim-scripts/SQLUtilities'
Plugin 'vim-scripts/Align'

"------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'        " Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'             " Parentheses, brackets, quotes, XML tags, and more
Plugin 'airblade/vim-gitgutter' 	" GIT
Plugin 'tpope/vim-fugitive'
Plugin 'chr4/nginx.vim'                 " Nginx
Plugin 'robbles/logstash.vim'           " logstash
Plugin 'mtdl9/vim-log-highlighting'     " log highlight
Plugin 'wakatime/vim-wakatime'

call vundle#end() " required
filetype on
filetype plugin on
filetype plugin indent on
call arpeggio#load()


"=====================================================
" User custom functions 
"=====================================================
"

fu BashRun() range
  echo system('bash -c ' . shellescape(join(getline(a:firstline, a:lastline), "\n")))
endf

" Delete all trailing whitespaces
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function LastCommitChangesToggle()
    if g:gitgutter_diff_base
      let g:gitgutter_diff_base=''
    else
      let g:gitgutter_diff_base=system("git rev-parse HEAD")
    endif
    call gitgutter#all(1)
endfunction


"=====================================================
" User hotkeys
"=====================================================
"
nmap <silent> <C-_> <Plug>(pydocstring)
nnoremap <space> viw
imap jj <Esc>
let mapleader = ","
" ` is tmux leader, so swap ' and `
nnoremap ` '
nnoremap ' `
" Работа буфферами
" CTRL+Q - закрыть текущий буффер
map <C-q> :bd<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" remove trailing whitespaces
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"nnoremap <silent> <F7> :!docker exec net640kb_web_1 kill -SIGHUP 9 > /dev/null <CR><CR>

" set list/ set nolist
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set iminsert=0
" set imsearch=0
"set timeoutlen=200
map <leader>y "*y
map <leader>p "*p

" higlight current line
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
Arpeggio nnoremap df :set cursorline! cursorcolumn!<CR>

Arpeggio inoremap jk  <Esc>
Arpeggio vmap ad :call BashRun()<CR>


"=====================================================
" General settings
"=====================================================
" Enable folding
set foldmethod=manual
set foldlevel=99
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
autocmd BufEnter * silent! lcd %:p:h

set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
set linespace=5
set autoread

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


set t_Co=256
set background=dark
colorscheme monokai_pro
"colorscheme preto
if &term =~ '256color'
      " disable Background Color Erase (BCE) so that color schemes
      " render properly when inside 256-color tmux and GNU screen.
      " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
     set t_ut=
endif
syntax enable
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

" Enable Syntax Colors
syntax on

tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set hlsearch            " highlighted search results
set nu                  " line numbers
set scrolloff=5         " keep some more lines for scope
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching


" ALE
let g:ale_enabled = 1
let g:ale_lint_delay = 3000
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint']}
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" TagBar настройки
map <F4> :TagbarToggle<CR>

let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" TaskList настройки
"map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

" NerdTree
map <F3> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" GitGutter
set updatetime=100
map <leader>G :GitGutterLineHighlightsToggle<CR>
"map <F6> :GitGutterPreviewHunk<CR>
map <F6> :call LastCommitChangesToggle()<CR>

" Jedi-vim
let g:jedi#show_call_signatures = 1 " Show call signatures
let g:jedi#popup_on_dot = 0         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete
let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#force_py_version = 3


" Vim-Airline
let g:airline_theme='powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
" LIGHTLINE
set laststatus=2
" AG
let g:ackprg = 'ag --nogroup --nocolor --column'


"=====================================================
" Languages support
"=====================================================
" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd BufWrite *.py :call DeleteTrailingWS()
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721 --max-line-length=80'
let g:pydocstring_doq_path = 'doq'
let g:pydocstring_template_path = '/home/ilya/.vim/pydoctemplates'

" -- Lisp ---
let g:syntastic_lisp_checkers = ['sbcl']
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END


" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- template language support (SGML / XML too) ---
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
"let g:syntastic_html_checkers = []

" --- Go ---
au BufNewFile,BufRead *.go
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set number

" --- SQL ---
let g:syntastic_sql_checkers = ['sqlint']
autocmd! BufNewFile,BufReadPre,FileReadPre  *.sql    so ~/.vim/sql.vim
"au BufNewFile,BufRead *.sql
    "\ set tabstop=4 |
    "\ set softtabstop=4 |
    "\ set shiftwidth=2 |
    "\ set textwidth=120 |
    "\ set expandtab |
    "\ set autoindent |
    "\ set fileformat=unix |
    "\ set number

" --- conf files ---
au BufNewFile,BufRead *.conf
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set number

" --- JSON files ---
let g:vim_json_syntax_conceal = 0
