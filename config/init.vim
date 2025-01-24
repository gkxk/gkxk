"vmap ;y : !/mnt/c/Windows/System32/clip.exe<cr>u''
"map ;p :read !/mnt/c/Windows/System32/paste.exe <cr>
"map! ;p <esc>:read !/mnt/c/Windows/System32/paste.exe <cr>
vmap ;y : !clip.exe<cr>u''
map ;p :read !paste.exe <cr>
map! ;p <esc>:read !paste.exe <cr>

set mouse=a
set nu
set tabstop=4
set smartindent
set shiftwidth=4
set noexpandtab
set autoindent 
set history=1000
syntax enable
syntax on
set foldmethod=indent
set smartcase
set ignorecase
set showmatch
set clipboard+=unnamedplus
set so=10
set softtabstop=4
"set foldnestmax=1
set foldlevel=5
set hlsearch
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set colorcolumn=110
" set cursorcolumn

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

call plug#begin('~/.vim/plugged')

Plug 'tmhedberg/SimpylFold'
Plug 'szw/vim-maximizer'
Plug 'Yggdroot/indentLine'

call plug#end()

map z1  :set foldlevel=0<CR><Esc>
map z2  :set foldlevel=1<CR><Esc>
map z3  :set foldlevel=2<CR><Esc>
map z4  :set foldlevel=3<CR><Esc>
map z5  :set foldlevel=4<CR><Esc>
map z6  :set foldlevel=5<CR><Esc>
map z7  :set foldlevel=6<CR><Esc>
map z8  :set foldlevel=7<CR><Esc>
map z9  :set foldlevel=8<CR><Esc>
nnoremap <space> za

nnoremap <silent><C-w>z :MaximizerToggle<CR>
vnoremap <silent><C-w>z :MaximizerToggle<CR>gv
inoremap <silent><C-w>z <C-o>:MaximizerToggle<CR>

map <PageUp> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <PageDown> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

let g:indentLine_char_list = ['|', '¦']
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

function Temp()
endfunction

inoremap <C-A> <Home>
inoremap <C-E> <End>

" indentLine 
autocmd FileType json,markdown let g:indentLine_conceallevel = 0
" vim-json
autocmd FileType json,markdown let g:vim_json_syntax_conceal = 0

noremap W 5w
noremap B 5b
noremap E 5e

noremap J 5j
noremap K 5k

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

noremap <C-J> 5<C-e>
noremap <C-K> 5<C-y>

let g:markdown_fenced_languages = ['python']

function! JSFolds()
  let thisline = getline(v:lnum)
  if thisline =~? '\v^\s*$'
    return '-1'
  endif

  if thisline =~ '^import.*$'
    return 1
  else
    return indent(v:lnum) / &shiftwidth
  endif
endfunction
autocmd FileType javascript setlocal foldmethod=expr
autocmd FileType javascript setlocal foldexpr=JSFolds()

set autoread | au CursorHold * checktime | call feedkeys("lh")











