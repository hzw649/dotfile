set nocompatible
set nu
set ruler
set mouse=a
set shiftwidth=4
set tabstop=4
set number
set t_Co=256
set completeopt-=preview
set shortmess+=I
set clipboard=unnamed
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
" Pretty UI
Plug 'mhartington/oceanic-next'
"Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" Search Effeciency
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" manual patch it https://github.com/jistr/vim-nerdtree-tabs/issues/102#issuecomment-1412841300
Plug 'mkitt/tabline.vim'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'bazelbuild/vim-bazel'

Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

" Git Support
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'

" Language Highlight
"Plug 'sheerun/vim-polyglot'
Plug 'google/vim-jsonnet'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'jjo/vim-cue'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'hashivim/vim-terraform'

" Auto Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
call plug#end()

syntax enable
if (has("termguicolors"))
  set termguicolors
endif
colorscheme OceanicNext

filetype plugin on
set showmatch
set cindent
set autoindent
set smartindent
set gfn=Menlo:h15
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fdm=marker
set laststatus=2
set hlsearch
set cursorline
set expandtab
set wildmenu
set wildmode=list:longest

" compile and run-------------
func! Compile()
    exec "w"
    if expand("%:e")=="cpp"
		exec "!g++ % -o %< -O2 -lm --std=c++11"
	elseif expand("%:e")=="tex"
		exec "!xelatex %"
		exec "!open %<.pdf"
	elseif expand("%:e")=="py"
		exec "!python %"
	elseif expand("%:e")=="m"
		exec "!octave %"
	elseif expand("%:e")=="java"
		exec "!javac %"
	endif
endfunc

func! Run()
	exec "w"
	if expand("%:e")=="cpp"
        exec "!time ./%<"
	elseif expand("%:e")=="java"
		exec "!time java %<"
	endif
endfunc

noremap <F9> :call Compile()<CR>
noremap <F10> :call Run()<CR>
noremap + <C-W>10+
noremap - <C-W>10-

execute "set <M-q>=\eq"
execute "set <M-w>=\ew"
noremap <M-q> :tabp<CR>
noremap <M-w> :tabn<CR>

autocmd FileType python nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
autocmd BufEnter,InsertLeave * :syntax sync fromstart

" Mac
noremap œ :tabp<CR>
noremap ∑ :tabn<CR>
noremap <ESC>f w
nnoremap ¡ 1gt
nnoremap ™ 2gt
nnoremap £ 3gt
nnoremap ¢ 4gt
nnoremap ∞ 5gt
nnoremap § 6gt

map <F3> :call yapf#YAPF()<cr>

"NERDTree
"F2开启和关闭树"
map <F2> :NERDTreeTabsToggle<CR>
map <F5> :NERDTreeTabsFind<CR>

"map <F2> :NERDTreeToggle<CR>
"map <F5> :NERDTreeFind<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25
"indentLine
let g:indentLine_char='|'
let g:indentLine_enabled = 1
let g:indentLine_setConceal = 1
let g:indentLine_conceallevel = 2

"YouCompleteMe
"let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let g:NERDTreeChDirMode = 2

call glaive#Install()
" C++
Glaive codefmt clang_format_style="{BasedOnStyle: Google, IndentWidth: 2, ColumnLimit: 100, BinPackArguments: false, BinPackParameters: false, DerivePointerAlignment: false, PointerAlignment: Left}"

" Python: Disable autopep8 to let plugin pick up yapf.
Glaive codefmt autopep8_executable="null"

let g:coc_disable_startup_warning = 1

let g:Lf_RootMarkers = ['WORKSPACE']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'bottom'
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
"let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1

set tags=./tags,tags;

let g:tablineclosebutton=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

function! GerritFugitiveUrl(...) abort
  if a:0 == 1 || type(a:1) == type({})
    let opts = a:1
    let root = "https://git-av.nvidia.com/"
  else
    return ''
  endif
  let path = substitute(opts.path, '^/', '', '')
  let ref = matchstr(opts.path, '^/\=\.git/\zsrefs/.*')
  echom path
  echom ref
  return "https://gerrit.com/r/plugins/gitiles/maglev/+/main/" . path
endfunction

if !exists('g:fugitive_browse_handlers')
  let g:fugitive_browse_handlers = []
endif

if index(g:fugitive_browse_handlers, function('GerritFugitiveUrl')) < 0
  call insert(g:fugitive_browse_handlers, function('GerritFugitiveUrl'))
endif
