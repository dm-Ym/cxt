" leader
let mapleader=' '
" source init.vim
noremap <leader>r :source %<CR>
" map
nnoremap <leader>w :w!<CR>
noremap H 0
noremap L $
noremap m 5j
noremap M 4k
nnoremap <leader>' 0i"<esc>
nnoremap <leader>3 0i#<esc>
" 显示颜色
set t_Co=256
set laststatus=2
" 语法高亮
syntax on
" 上下保持五行(等号两边不能有空格)
set scrolloff=5
" 一边输入一边高亮 
set incsearch               
set smartcase
noremap <leader>h :nohlsearch<CR>
" 显示行号
set nu
" 相对行号
set relativenumber
" 显示当前按下的cmd
set showcmd
" 命令补全提示
set wildmenu
" 显示文件中的tab和空白符 (It's doesn't seem to work)
set listchars=tab:>-,trail:-
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 突出显示当前行
set cursorline
" 打开回到上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"寻找搜索结果，并将其置于屏幕中心
noremap = nzz               
noremap - Nzz

"右分屏，聚焦右窗口
noremap zl :set splitright<CR>:vsplit<CR>
"左分屏，聚焦左窗口
noremap zj :set nosplitright<CR>:vsplit<CR>
"上分屏，聚焦上窗口
noremap zu :set nosplitbelow<CR>:split<CR>
"下分屏，聚焦下窗口
noremap zk :set splitbelow<CR>:split<CR>
"光标移至右窗口
noremap <C-L> <C-w>l
"光标移至上窗口
noremap <C-K> <C-w>k
"光标移至下窗口
noremap <C-J> <C-w>j
"光标移至左窗口
noremap <C-H> <C-w>h
" window resize
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>
" 分屏切换
map zh <C-W>t<C-W>K
map zv <C-W>t<C-w>H
" quit
nnoremap Q :q<CR>

" 新标签
noremap tu :tabe<CR>
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>

" vim-plug 
call plug#begin('~/.config/nvim/plugged')
" status bar
Plug 'vim-airline/vim-airline'

Plug 'davidhalter/jedi-vim'

" theme 
Plug 'mhartington/oceanic-next'
"Plug 'connorholyday/vim-snazzy'

call plug#end()

" snazzy
color snazzy
let g:SnazzyTransparent = 1
hi Normal guibg=NONE ctermbg=NONE
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }

" 
" nerdcommenter
"
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1



" 
" jedi-vim
"
let g:jedi#auto_initialization = 0



" 
" Oceanic-next
"
if (has("termguicolors"))
 set termguicolors
endif
" Theme
syntax enable
colorscheme OceanicNext
" transparent
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
