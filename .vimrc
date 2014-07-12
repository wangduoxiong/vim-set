set helplang=cn   			"用于显示中文
set encoding=utf-8			"显示utf-8编码
set tags=./tags				"设置tags
set autoindent 				"自动对齐
set cindent 				"使用c/c++语言的自动缩进方式
set smartindent 			"智能对齐方式
set tabstop=4 				"设置Tab的宽度为4
set softtabstop=4  			"设置软制表符的宽度
set shiftwidth=4 			"设置自动缩进为4个空格
set number 					"显示行号
set cul 					"显示当前下划线
set nobackup 				"禁止生成临时文件
set noswapfile 				"禁止生成临时文件
set mouse=a 				"可以在buffer的任何地方使用鼠标
set smarttab 		

set fencs=utf-8,gbk			"显示中文编码
set termencoding=utf-8
set encoding=utf-8

syntax enable       		"语法高亮i
syntax on 					"语法高亮
colorscheme desert			"高亮的配色方案

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1   		"安装Taglist

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

set nocompatible
set backspace=indent,eol,start		"设置backspace键

set cscopequickfix=s-,c-,d-,i-,t-,e-	"添加Cscope插件


filetype plugin indent on		"打开文件检测
set completeopt=longest,menu		"关闭智能补全时的预览窗口



let g:miniBufExplMapCTabSwitchBufs=1	"添加以下功能:
					"<C-Tab>向前循环切换到每一个buffer上，并在当前窗口打开

					"<C-S-Tab>向后循环切换到每一个buffer上，并在当前窗口打开

let g:miniBufExplMapWindowNavVim=1	"可以用<C-h,j,k,l>切换窗口
let g:miniBufExplMapWindowNavArrows=1	"用<C-箭头键>切换到上下左右窗口中去

"自动补全clang插件的配置
set completeopt=longest,menu
let g:clang_complete_copen=0
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_complete_macros=1
let g:clang_use_library=1

"设置SuperTab键
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-U>"
"设置按下<Tab>后默认的补全方式,系统默认的是<C-P>
"现在改为<C-X><C-O>
"可以看帮助
":help ins-completion
":help compl-omni
let g:SuperTabRetainCompletionType=2
"0	不记录上次的补全方式
"1	记录上次的补齐方式，直到用其他命令改变他
"2	记住上次的补全方式，直到按ESC退出插入模式

"设置注释快速补齐插件NERD Commen
let mapleader=","

"powerline的设置
let g:Powerline_symbols='fancy'
set rtp+={path_to_powerline}/powerline/bindings/vim
set laststatus=2
set noshowmode
set t_Co=256
set nocompatible
let g:Powerline_symbols = 'unicode'


"按下F3,在当前代码的.c/.h之间切换
nnoremap <silent><F3> :A<CR>


"C,C++的调试
map <F4> :call Rungdb()<CR>
func! Rungdb()
        exec "w"
        exec "!g++ % -g -o %<"
        exec "!gdb ./%<"
endfunc

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java' 
                exec "!javac %" 
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
        endif
endfunc

"按下F6,在当前目录递归生成tag文件
map <F6> :!ctags -R<CR><CR>
imap <F6> <ESC> :!ctags -R<CR><CR>

"设置ctags
set tags+=~/.vim/tags/cpp 
set tags+=~/.vim/tags/gtk2
set tags+=~/.vim/tags/gtk3

set tags=tags
set tags+=./tags
set tags+=/usr/include/tags
set tags+=/usr/include/acl/tags
set tags+=/usr/include/gnome-keyring-1/tags
set tags+=/usr/include/mm/tags
set tags+=/usr/include/pixman-1/tags
set tags+=/usr/include/arpa/tags
set tags+=/usr/include/c++/tags
set tags+=/usr/include/python2.7/tags
set tags+=/usr/include/net/tags
set tags+=/usr/include/readline/tags
set tags+=/usr/include/netinet/tags
set tags+=/usr/include/selinux/tags
set tags+=/usr/include/sys/tags
set tags+=/usr/include/gconf/tags
set tags+=/usr/include/linux/tags
set tags+=/usr/inlcude/gtk-2.0/gtk/tags
set tags+=/usr/include/gtk-2.0/gdk/tags
set tags+=/usr/include/gtk-3.0/gtk/tags
set tags+=/usr/include/gtk-3.0/gdk/tags
set tags+=/usr/include/gtk-3.0/unix-print/gtk/tags
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 


" OmniCppComplete 
let OmniCpp_NamespaceSearch = 1 
let OmniCpp_GlobalScopeSearch = 1 
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters 
let OmniCpp_MayCompleteDot = 1 " autocomplete after . 
let OmniCpp_MayCompleteArrow = 1 " autocomplete after -> 
let OmniCpp_MayCompleteScope = 1 " autocomplete after :: 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"] 
" automatically open and close the popup menu / preview window 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest,preview 

let g:devhelpSearch=1 
let g:devhelpAssistant=1 
"按下F7,执行make编译程序，并打开quickfix窗口，显示编译信息
"map <F7> :make<CR><CR><CR> :copen<CR><CR>
"按下F8，光标移到上一个错误所在的行
map <F8> :cp<CR>
"按下F9，光标移到下一个错误所在的行
map <F9> :cn<CR>
"按下F10,执行make clean
map <F10> :make clean<CR><CR>

"以下的映射是使上面的快捷键在插入模式下也能使用
imap <F7> <ESC>:make clean<CR><CR><CR>
imap <F8> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <F9> <ESC>:cp<CR>
imap <F10> <ESC>:cn<CR>



"设置vundle管理器
"set nocompatible               " be iMproved
"filetype off                   " required!

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'
"Bundle 'a.vim'
"Bundle 'c.vim'
"Bundle 'winmanager'
"Bundle 'clang'
"Bundle 'SuperTab'
"Bundle 'clang-complete'
"Bundle 'minibufexpl.vim'
"Bundle 'taglist.vim'
"Bundle 'ctags.vim'
"Bundle 'The-NERD-Commenter'

" My Bundles here:
"
" original repos on github
" vim-scripts repos
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

"filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


"设置NeoComplCache不自动弹出不全列表
let g:NeoComplCache_DisableAutoComplete = 1
