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



" =======以下是插件设置===========================================================================================

" YouCompleteMe设置
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" NERDTree设置
let NERDTreeShowBookmarks=1	" 打开bookmark
autocmd VimEnter * nested :NERDTree	" 打开vim时候自动打开树
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F2> :NERDTreeToggle<CR>	" 显示或隐藏树

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
" let g:tagbar_autofocus = 1  "自动焦点定位
autocmd VimEnter * nested :TagbarOpen	" 打开vim时候自动打开
 
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


" ===========以下是vim设置==========================================================================================

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

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

