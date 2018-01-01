" ______     ______     __   __     ______   __     ______    
"/\  ___\   /\  __ \   /\ "-.\ \   /\  ___\ /\ \   /\  ___\   
"\ \ \____  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \ \  \ \ \__ \  
" \ \_____\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_\  \ \_____\ 
"  \/_____/   \/_____/   \/_/ \/_/   \/_/     \/_/   \/_____/ 
"                                                             

" Map leader to comma
let mapleader=','

" Syntax highlighting
syntax on

" Turn on indent rules
filetype plugin indent on
set smartindent

" indent per file type
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype elm setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype rst setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2

" Automatically reload file when changed outside buffer
set autoread

" Turn on modelines
set modeline
set modelines=3

" Change buffers without saving them
set hidden

" Use the already open buffer if it exists
set switchbuf=useopen,usetab

" Filetype detection
au BufNewFile,BufRead *.tem set filetype=cpp
au BufNewFile,BufRead *.json set filetype=json

" Set terminal width to 80 chars when looking at md or rst files
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist textwidth=80
au BufRead,BufNewFile *.rst setlocal wrap linebreak nolist textwidth=80

" Visual bell and no beep
set vb
set noerrorbells

" Allow backspacing over all the things in insert mode
set bs=indent,eol,start

" Disable backup and swap
set noswapfile
set nobackup

" Turn on mouse
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif
" No wrap
set nowrap

" Allow L and H to go to beginning and end of line
nnoremap H 0
nnoremap L $

" Disable Ex mode
nnoremap Q <Nop>

" Make Y and D yank until EOL like other capital letters
map Y y$
map D d$

" Hide toolbar
set go-=T

" Enable status bar
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Space between current line and window frame
set scrolloff=4

" 4 spaces, exand tab by default
set sw=4 sts=4 ts=4 expandtab

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
vnoremap <space> zf

" See line numbers, ruler, and current line
set number
set ruler
set cursorline

" Set bash style word completion
set wildmode=longest:full
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class

" Enable search highlighting
set hlsearch

" Enable incremental search
set incsearch

" Case-insensitive search
set ignorecase

" Match uppercase when searched for
set smartcase

" Do not move the cursor when highlighting
noremap * *N
noremap # #N

" Clear the search highlight with <leader> n
nmap <silent> <leader>n :noh<CR>

" Paste mode toggle
nmap <silent> <leader>p :set paste!<CR>

" Softwrap text
nmap <silent> <leader>w :set wrap! linebreak! textwidth=0<CR>

" NERDTree toggle
map <leader>t :NERDTreeToggle<CR>

" NERDTree ignore files
let NERDTreeIgnore=['\.pyc']

" NERDTree see hidden files
let NERDTreeShowHidden=1

" Sorting
vmap <leader>s :sort<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a split command with the path of the currently edited file filled in
" Normal mode: <Leader>s
map <Leader>se :split <C-R>=expand("%:p:h") . "/" <CR>
" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>v
map <Leader>ve :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" List special chars such as whitespace and tabs
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:#

" When splitting window, split to bottom and right
set splitright
set splitbelow

" Resize windows when loading sessions
set sessionoptions+=resize

" After shifting a visual block, reselect it to be able to shift again
vnoremap > >gv
vnoremap < <gv

" Run current line/selection as Python code and replace with output
nmap gp :.!python<CR>
vmap gp :!python<CR>

" Split to the file under the cursor and line number
" map gs <C-W>F

" Turn on 256 colors if this is xterm or xterm compatible
set t_Co=256

" Automatically reload vimrc on save
autocmd! BufWritePost .vimrc source %
autocmd! BufWritePost .gvimrc source %

" Remember cursor postions on files
autocmd BufReadPost * normal `"

" Disable help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap C-c to ESC
inoremap <C-c> <ESC>

" Autocomplete on dashed words
set iskeyword+=-

" Don't flicker when executing macros/functions
set lazyredraw

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" json-vim
let g:vim_json_syntax_conceal=0

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1

" Enable Airline
let g:airline_powerline_fonts=1

" Enable rainbow parens
let g:rainbow_active=1

" Color theme
syntax enable
colorscheme jellybeans

" Prettier setup
autocmd BufWritePre *.js,*.jsx Neoformat
let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--single-quote', '--trailing-comma es5'],
            \ }
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_only_msg_on_error = 1

" Share clipboard with system
set clipboard+=unnamed

" Enable hybrid relative line numbers
set relativenumber
set number

" Map fzf to something simple
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
nnoremap <leader>f :FZF<cr>

" Ale
let g:ale_emit_conflict_warnings = 0

" Scratch
let g:scratch_persistence_file = '~/.scratch'

" Reload .vimrc mapped to something easy
nnoremap <leader>rl :so $MYVIMRC<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Persistent Undo
if has('persistent_undo')
  set undofile
  exec 'set undodir=~/.config/nvim/.undo'
endif

" Map undotree to ,u
nnoremap <leader>u :UndotreeToggle<cr>

" Map grepper with ag to ,g
nnoremap <leader>g :Grepper -tool ag<cr>
