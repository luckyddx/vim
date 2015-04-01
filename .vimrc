filetype on                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' "包管理
Plugin 'Command-T'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'scrooloose/nerdtree' "目录
Plugin 'scrooloose/nerdcommenter'
Plugin 'digitaltoad/vim-jade' "jade 的配色
Plugin 'jlanzarotta/bufexplorer' ",b查看打开过的文件
"Plugin 'vim-scripts/cscope.vim' "跳转 查找什么的
Plugin 'vim-scripts/AutoComplPop' "自动弹出关联
Plugin 'vim-scripts/vcscommand.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'junegunn/vim-easy-align'
Bundle 'klen/python-mode.git'
"竖线
"Bundle 'Yggdroot/indentLine'
"代码错误，优化提示
Bundle 'mxw/vim-jsx'            
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'blerins/flattown'       
"配色
Bundle 'gmarik/ingretu'         
"配色
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ==================
" Custom configration
" ==================
set hlsearch   " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase  " Ignore case when searching lowercase
" }}}
syntax enable
"set background=dark
"colorscheme solarized
"colorscheme flattown
"colorscheme railscasts
colorscheme ingretu

set noswapfile
set nocompatible
set nopaste
set pastetoggle=<F3>
set number            " 显示行号
set autoindent        " 自动缩进
set smartindent       " 智能缩进
set hidden            " 隐藏缓冲区
set shiftwidth=4      " sw  设置自动缩进 2 个空格, 当然要设自动缩进先
set softtabstop=4     " sts 设置 softtabstop 为 4. 输入 tab 后就跳了 4 格
set tabstop=4         " 实际的 tab 即为 4 个空格, 而不是缺省的 8 个
set expandtab         " 在输入 tab 后, vim 用恰当的空格来填充这个 tab
set diffopt+=vertical
set virtualedit=all   " 光标可以定位在没有实际字符的地方
set isfname-==
set backspace=indent,eol,start

set directory=~/tmp/vim/swap    " Set Swap directory
set nobk "关闭自动备份
set cot=menuone ",preview  "全能补全的时候只显示菜单，preview预览窗口

" Status Line ************************************************************ {{{
set showcmd
set ruler " Show ruler
" set ch=2 " Make command line two lines high
" match LongLineWarning '\%120v.*' " Error format when a line is longer than 120
                                   " 对一些中文行不起作用
" }}}

" Invisible characters *************************************************** {{{
set listchars=trail:.,tab:>-,eol:$,nbsp:%,extends:>,precedes:<
set wildignore=*.swp,*.bak,*.pyc,*.class
set nolist
" }}}
" 竖线的配置 nathanaelkane/vim-indent-guides begin ******************************************
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" 竖线的配置 end ******************************************
" Mappings *************************************************************** {{{
let mapleader = ","
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @
imap <up> <C-o>gk
imap <down> <C-o>gj
imap .. ->
map <S-Enter> O<Esc>
map <CR> o<Esc>
nmap <silent> <Leader>h :vsplit<CR>
nmap <silent> <Leader>v :split<CR>

" 选中后按/向后(?向前)直接搜索
vmap / y/<C-R>"<CR>
vmap ? y?<C-R>"<CR>
nmap <silent> <Leader>, :nohlsearch<CR>

"vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" 缩排
nmap <Tab> v>
" nmap <S-Tab> v<
nmap <bs> v<
vmap <Tab> >gv
" vmap <S-Tab> <gv
vmap <bs> <gv

" 多个 terminal 间复制
vmap y :w !pbcopy<CR><CR>
nmap yy :.w !pbcopy<CR><CR>
" nyy 会失效，不过这个命令也不常用
nmap p :r !pbpaste<CR><CR>

" 查找下一个匹配点
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>

" 插入模式下按F2插入时间戳
if exists("*strftime")
   "imap <F2> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
endif

" }}}
" format json
vmap <Leader>j !python -m json.tool<CR>


" Omni Completion ******************************************************** {{{
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VCSCommand ********************************************************** {{{
" nmap ,ca <Plug>VCSAdd
"
" The default mappings are begin with c:
"
nmap <Leader>va <Plug>VCSAdd
nmap <Leader>vn <Plug>VCSAnnotate
nmap <Leader>vN <Plug>VCSAnnotate!
nmap <Leader>vc <Plug>VCSCommit
nmap <Leader>vD <Plug>VCSDelete
nmap <Leader>vd <Plug>VCSDiff
nmap <Leader>vg <Plug>VCSGotoOriginal
nmap <Leader>vG <Plug>VCSGotoOriginal!
nmap <Leader>vi <Plug>VCSInfo
nmap <Leader>vl <Plug>VCSLog
nmap <Leader>vL <Plug>VCSLock
nmap <Leader>vr <Plug>VCSReview
nmap <Leader>vs <Plug>VCSStatus
nmap <Leader>vu <Plug>VCSUpdate
nmap <Leader>vU <Plug>VCSUnlock
nmap <Leader>vv <Plug>VCSVimDiff
" For JSHint
let JSHintUpdateWriteOnly=1
nmap co :copen
nmap cu :JSHintUpdate
nmap cc :cclose
nmap cc :cclose
nmap cn :cc[!] [nr]

" NERDTreDTree********************************************************** {{{
map <F10> :NERDTreeToggle<CR>
noremap <silent> <Leader>n :NERDTreeToggle<CR>


" User instead of Netrw when doing an edit /foobar
"let NERDTreeHijackNetrw=1

" Single click for everything
"let NERDTreeMouseMode=1

" Set ignore file regex
"let NERDTreeIgnore=['\.vim$', '\.pyc$', '\.class$', '\.beam$', '^CVS$', '\~$', '\.lo$', '\.o$', '\.so$']
" }}}

" Netrw ****************************************************************** {{{
" let g:netrw_list_hide='^\..*'
" }}}

"" Taglist *************************************************************** {{{
"let Tlist_Ctags_Cmd='/usr/bin/ctags'

""定义Tlist的快捷键为tl
"map <F8> :Tlist<CR><C-W><C-W>
"map <silent> <Leader>f :Tlist<CR><C-W><C-W>

"let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
"let Tlist_Compact_Format = 0
"let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
"let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1            "如果taglist窗口是最后一个显示的窗口，则1退出vim;0不退出vim
"let Tlist_File_Fold_Auto_Close = 0
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Hightlight_Tag_On_BufEnter = 1
"let Tlist_Inc_Winwidth = 0
"let Tlist_Max_Submenu_Items = 1
"let Tlist_Max_Tag_Length = 30
"let Tlist_Process_File_Always = 0
"let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1              "同时(0)/不同时(1)显示多个文件的tag，只显示当前文件的
let Tlist_Sort_Type = "name"             " order:以tag名字在tag文件中出现的位置排序，name:以名字排序
"let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1           " 1在右侧显示taglist窗口，0在左侧
let Tlist_WinWidth = 40
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'
" }}}


" BufExplorer *********************************************************** {{{
:command BE BufExplorer
map <F5>  :BufExplorer<CR>
map <silent> <Leader>b :BufExplorer<CR>
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
" }}}



" Cscope **************************************************************** {{{
if has("cscope")
        set csprg=/usr/local/bin/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
           cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
           cs add $CSCOPE_DB
        endif
        set csverb
endif
"map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
"map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
nmap s<C-]> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap g<C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap c<C-]> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap t<C-]> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap e<C-]> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap f<C-]> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap i<C-]> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap d<C-]> :cs find d <C-R>=expand("<cword>")<CR><CR>
" }}}

" SnipMate ************************************************************ {{{
"ino <tab> <c-r>=TriggerSnippet()<cr>
"snor <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>
" }}}

" garbas/vim-snipmate ***************************************************{{{
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
"}}}


" SnippetsEmu ************************************************************ {{{
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.
" }}}


" fuzzyfinder_textmate *************************************************** {{{
"map ,f :FuzzyFinderTextMate<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" FuzzyFinder
"map <silent> <Leader>b :FufBuffer<CR>
"map <silent> <Leader>ab :FufAddBookmark<CR>
"map <silent> <Leader>ob :FufBookmark<CR>
" }}}

" autocomplpop *********************************************************** {{{
" complete option
set complete=.,w,b,u,t,k

"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

let g:acp_completeOption = '.,w,b,u,t,k'
let g:acp_ignorecaseOption = 0
let g:acp_behaviorKeywordLength = 2
" }}}
" zen coding ************************************************************* {{{
let g:user_zen_settings = { 'php' : { 'extends' : 'html', 'filters' : 'c', }, 'xml' : { 'extends' : 'html', } }
"let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
\    'indentation' : '    ',
\    'html': {
\        'indentation' : '  ',
\    },
\}
" }}}

" pyditcion ************************************************************** {{{
" python 自动补全插件(未安装)
let g:pydiction_location = '~/etc/vimrc/vim/bundle/Pydiction/complete-dict'
" }}}

" markdown filetype syntax ************************************************************** {{{
"augroup mkd
"    autocmd BufRead *.mkd,*.md,*.mdown  set ai formatoptions=tcroqn2 comments=n:&gt;
"augroup END
" }}}

" jslint settings
let g:JSLintHighlightErrorLine = 0
let b:did_jslint_plugin = 1

" Align settings
let g:Align_xstrlen = 3 "handle multibyte characters :h align-strlen
"==================
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
let g:indentLine_char = '|'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Function define
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 在保存时自动修改Last modified的时间
""autocmd BufWritePre,FileWritePre * ks|call LastModified()|'s
"fun! LastModified()
    "let l = line("$")
    "exe "1," . l . 'g/^\s*\(\*\|#\|"\|\/\/\)\?\s*[L]ast modified:\s/s/^\(\s*\(\*\|#\|"\|\/\/\)\?\s*[L]ast modified:\s\).*/\1' .
                "\ strftime("%Y-%m-%d %H:%M%S")
""    \ strftime("%F %T")
""    \ strftime("%Y %b %d %X")

"endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" GUI Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" See ~/.gvimrc
""source ~/.vim/gvimrc

"" load .vimrc in current directory
""set exrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Host specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""if filereadable(expand("~/.vimrc.local"))
  ""source ~/.vimrc.local
""endif

""if hostname() == "foo"
  "" do something
""endif
""vim: fdm=marker
""au BufWritePost *.coffee silent CoffeeMake!
execute pathogen#infect()
" JSDoc
let g:jsdoc_allow_input_prompt      = 1
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
