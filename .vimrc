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

" Plugin on GigHub tagbar
Plugin 'majutsushi/tagbar'

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



" =======以下是设置===========================================================================================

" 显示行号
set nu

" YouCompleteMe设置
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" NERDTree设置
let NERDTreeShowBookmarks=1	" 打开bookmark
autocmd VimEnter * nested :NERDTree	" 打开vim时候自动打开树
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
