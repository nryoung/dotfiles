" ______     ______     __   __     ______   __     ______    
"/\  ___\   /\  __ \   /\ "-.\ \   /\  ___\ /\ \   /\  ___\   
"\ \ \____  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \ \  \ \ \__ \  
" \ \_____\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_\  \ \_____\ 
"  \/_____/   \/_____/   \/_/ \/_/   \/_/     \/_/   \/_____/ 
"                                                             

" === Functionality ===
" Map leader to comma
let mapleader=','
" Automatically reload file when changed outside buffer
set autoread
" Change buffers without saving them
set hidden
" Use the already open buffer if it exists
set switchbuf=useopen,usetab
" Visual bell and no beep
set vb
set noerrorbells
" Disable backup and swap
set noswapfile
set nobackup
set nowritebackup
" Turn on mouse
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif
" Disable Ex mode
nnoremap Q <Nop>
" Make Y and D yank until EOL like other capital letters
map Y y$
map D d$
" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
vnoremap <space> zf
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
" After shifting a visual block, reselect it to be able to shift again
vnoremap > >gv
vnoremap < <gv
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
" Share clipboard with system
set clipboard+=unnamed
" Reload .vimrc mapped to something easy
nnoremap <leader>rl :so $MYVIMRC<cr>
" set gf to actually work
set path=.,src,node_modules
set suffixesadd=.js,.jsx

" === Syntax / UI ===
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
autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype rst setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
" Turn on modelines
set modeline
set modelines=3
" Filetype detection
au BufNewFile,BufRead *.tem set filetype=cpp
au BufNewFile,BufRead *.json set filetype=json
au BufNewFile,BufRead *.tsx set filetype=javascript
" Set terminal width to 80 chars when looking at md or rst files
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist textwidth=80
au BufRead,BufNewFile *.rst setlocal wrap linebreak nolist textwidth=80
" Allow backspacing over all the things in insert mode
set bs=indent,eol,start
" No wrap
set nowrap
" Hide toolbar
set go-=T
" Enable status bar
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Space between current line and window frame
set scrolloff=4
" 4 spaces, exand tab by default
set sw=4 sts=4 ts=4 expandtab
" See line numbers, ruler, and current line
set number
set ruler
set cursorline
set cursorcolumn
" List special chars such as whitespace and tabs
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:#
" When splitting window, split to bottom and right
set splitright
set splitbelow
" Resize windows when loading sessions
set sessionoptions+=resize
" Turn on 256 colors if this is xterm or xterm compatible
set t_Co=256
" Don't flicker when executing macros/functions
set lazyredraw
" Color theme
syntax enable
set termguicolors
set background=dark
colorscheme gruvbox
" Enable hybrid relative line numbers
set relativenumber
set number

" === Plugins ===
" json-vim
let g:vim_json_syntax_conceal=0
" Enable Airline
let g:airline_powerline_fonts=1
" Enable rainbow parens
let g:rainbow_active=1

" === FZF ===
" Use fzf and ripgrep to search within files
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <leader>g :Rg<cr>
" Use fzf and ripgrep to find files
let $FZF_DEFAULT_COMMAND= 'rg --files --hidden --follow --glob "!.git/*"'
nnoremap <leader>f :FZF<cr>
" Use fzf to find buffers
nnoremap <leader>b :Buffers<cr>

" === Persistent Undo ===
if has('persistent_undo')
  set undofile
  exec 'set undodir=~/.config/nvim/.undo'
endif
" Map undotree to ,u
nnoremap <leader>u :UndotreeToggle<cr>

" === Vim-Sneak ===
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" === Ranger ===
nnoremap <leader>r :RangerEdit<cr>
nnoremap <leader>rv :RangerVSplit<cr>
nnoremap <leader>rs :RangerSplit<cr>
nnoremap <leader>rt :RangerTab<cr>
nnoremap <leader>ri :RangerInsert<cr>
nnoremap <leader>ra :RangerAppend<cr>
nnoremap <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
nnoremap <leader>rd :RangerCD<cr>
nnoremap <leader>rld :RangerLCD<cr>

" === HardTime ===
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 10

" === coc.nvim ===
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
