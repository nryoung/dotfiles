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
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

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
au BufNewFile,BufRead *.tsx set filetype=javascript

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
set termguicolors
set background=dark
colorscheme gruvbox

" Prettier setup
autocmd BufWritePre *.js,*.jsx Neoformat
let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--parser babylon', '--single-quote', '--trailing-comma es5', '--arrow-parens always'],
            \ }
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_only_msg_on_error = 1

" Elixir formatter
autocmd BufWritePre *.ex,*.exs Neoformat
let g:neoformat_elixir = {
        \ 'exe': 'mix',
        \ 'args': ['format', "-"],
        \ 'stdin': 1
        \ }
let g:neoformat_enabled_elixir = ['mixformat']

" Rust formatter
autocmd BufWritePre *.rs, Neoformat
let g:neoformat_rust = {
        \ 'exe': 'rustfmt',
        \ 'stdin': 1
        \ }
let g:neoformat_enabled_rust = ['rustfmt']

" Share clipboard with system
set clipboard+=unnamed

" Enable hybrid relative line numbers
set relativenumber
set number

" Map fzf to something simple
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)
let $FZF_DEFAULT_COMMAND= 'ag --hidden --ignore .git -l -g ""'
nnoremap <leader>f :FZF<cr>

" Ale
let g:ale_emit_conflict_warnings = 0
let g:ale_rust_cargo_use_check = 1

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

" deoplete-ternjs
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

" Persistent Undo
if has('persistent_undo')
  set undofile
  exec 'set undodir=~/.config/nvim/.undo'
endif

" Map undotree to ,u
nnoremap <leader>u :UndotreeToggle<cr>

" Vim-Sneak
let g:sneak#label = 1

" set gf to actually work
set path=.,src,node_modules
set suffixesadd=.js,.jsx

" ranger
nnoremap <leader>r :RangerEdit<cr>
nnoremap <leader>rv :RangerVSplit<cr>
nnoremap <leader>rs :RangerSplit<cr>
nnoremap <leader>rt :RangerTab<cr>
nnoremap <leader>ri :RangerInsert<cr>
nnoremap <leader>ra :RangerAppend<cr>
nnoremap <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
nnoremap <leader>rd :RangerCD<cr>
nnoremap <leader>rld :RangerLCD<cr>

" === Denite setup ==="
" Use ag for searching within files in the current directory
" By default, ag will respect rules in .gitignore

" Use ag in place of 'grep'
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" Custom options for ag
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--hidden', '--heading'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ:',
\ 'statusline': 0,
\ 'highlight_matched_char': 'WildMenu',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'StatusLine',
\ 'highlight_prompt': 'StatusLine',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

call denite#custom#option('default', s:denite_options)

nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nmap ; :Denite buffer<CR>

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-x>
  \ denite#do_map('do_action', 'split')
endfunction
