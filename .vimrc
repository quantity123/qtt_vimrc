"vim版本：7.4

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" plugin on GitHub nerdtree
Plugin 'scroolllse/nerdtree'

" plugin on GitHub ctrlp
Plugin 'kien/ctrlp.vim'

" Plugin on GitHub vim-powerline
Plugin 'Lokaltog/vim-powerline'

" Plugin on GitHub tagbar
Plugin 'majutsushi/tagbar'

" Plugin on GitHub delimitMate
Plugin 'Raimondi/delimitMate'

" Plugin on GitHub vim-signature
Plugin 'kshenoy/vim-signature'

" 搜索插件开始
" Plugin on GitHub ack.vim
Plugin 'mileszs/ack.vim'

" Plugin on GitHub ack2
Plugin 'petdance/ack2'

" Plugin on GitHub the_silver_searcher(ag)
Plugin 'ggreer/the_silver_searcher'
" 搜索插件结束

" Plugin on GitHub vim-multiple-cursors多重选择
Plugin 'terryma/vim-multiple-cursors'

" Plugin on GitHub a.vim(.c,.cpp与.h文件切换)
Plugin 'vim-scripts/a.vim'

" Plugin on GitHub syntastic
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"=======以下是插件设置===========================================================================================

" YouCompleteMe设置
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py' "这个是启动项，否则没有补全
let g:ycm_show_diagnostics_ui = 0	"关闭ycm自带的syntastic插件功能
let g:ycm_complete_in_comments=1	"补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0		"允许vim加载.ycm_extra_conf.py文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1	"开启ycm标签补全引擎
inoremap <leader>; <C-x><C-o>		" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
set completeopt-=preview		" 补全内容不以分割子窗口形式出现，只显示补全列表
let g:ycm_min_num_of_chars_for_completion=1	"第一个键入字符就开始列匹配项
let g:ycm_cache_omnifunc=0		"禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	"语法关键字补全

" NERDTree
let NERDTreeShowBookmarks=1	" 打开bookmark
autocmd VimEnter * nested :NERDTree	" 打开vim时候自动打开树
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F2> :NERDTreeToggle<CR>	" 显示或隐藏树
let NERDTreeWinPos='left'		" 设置窗口在左边
let NERDTreeAutoDeleteBuffer=1	"删除文件时自动删除文件对应 Buffer
let NERDTreeWinSize=32	"设置窗口的宽度
" let NERDTreeShowHidden=1	"显示隐藏的文件
" let NERDTreeMinimalUI=1	"不显示帮助面板
" let NERDTreeQuitOnOpen=1 "打开文件后自动隐藏窗口

" ctrlp.vim设置
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore =	{
	\ 'dir':	'\v[\/]\.(git|hg|svn)$',
	\ 'file':	'\v\.(exe|so|dll)$',
	\ 'link':	'some_bad_symbolic_links',
	\ }
let g:ctrlp_user_command = 'find %s -type f'

" tagbar设置
nmap <F3> :TagbarToggle<CR>
"let g:tagbar_autofocus = 1  "自动焦点定位
autocmd VimEnter * nested :TagbarOpen	" 打开vim时候自动打开
" let tagbar_left=1 "设置窗口在左边

" vim-signature设置
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "m<Space>",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" Ag设置
let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'

" syntastic设置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_jump=1	"保存或打开文件时让光标自动跳转到检测到的第一个问题处





"===========以下是vim设置==========================================================================================

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 显示行号
set number

" 开启语法高亮
syntax on

" 自适应不同语言的只能缩进
filetype indent on

" 缩进大小
set shiftwidth=4

" Tab大小
set tabstop=4

" 基于缩进或语法进行代码折叠
"set foldmethod=indent	"基于缩进进行折叠
set foldmethod=syntax	"基于语法进行折叠

" 启动vim时关闭折叠代码
set nofoldenable

" 总是显示状态栏
"set laststatus=2

" 显示光标当前位置
"set ruler

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

