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
call plug#begin('~/.vim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-powerline'

"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
"Plug 'suan/vim-instant-markdown', 	{'for': 'markdown'}
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang',  'for': ['c', 'cpp'] }
"Plug 'vim-syntastic/syntastic'
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

"NERDTree
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
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
let g:indentLine_concealcursor = ' '


"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"map <F4> :InstantMarkdownPreview<CR>



"YouCompleteMe
"let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'  
" 自动补全配置  
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"     

