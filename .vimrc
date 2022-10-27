set encoding=utf-8
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

let mapleader=','
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif


set fencs=utf-8,gbk
"Persistent Undo
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone


"原作者: ChenLei
"========================================================================="
let template_load=1
let template_tags_replacing=1
let T_AUTHOR=""
let T_DATE_FORMAT="%Y-%m-%d %H:%m:%S"
"==================================================================i=======
set nocompatible            " 关闭 vi 兼容模式

syntax on                   " 自动语法高亮
"colorscheme mirai             " 设定配色方案
set number                  " 显示行号
"set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set ts=4
set expandtab


set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启插件
filetype plugin on
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本

set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
                            " 设置在状态行显示的信息
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
"set foldcolumn=0            " 设置折叠区域的宽度
"setlocal foldlevel=1        " 设置折叠层数为
"set foldclose=all           " 设置为自动关闭折叠                            
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠



" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>



"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>

" set fileformats=unix,dos,mac
" nmap <leader>fd :se fileformat=dos<CR>
" nmap <leader>fu :se fileformat=unix<CR>

" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
" map <C-x>l <ESC>:cl<CR>
" map <C-x>n <ESC>:cn<CR>
" map <C-x>p <ESC>:cp<CR>
" map <C-x>c <ESC>:cc<CR>


" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

" Python 文件的一般设置，比如不要 tab 等
" autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict

"-----------------------------------------------------------------
" plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"-----------------------------------------------------------------

call plug#begin('~/.vim/plugged')

"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m  mark or unmark the word under (or before) the cursor
" \r  manually input a regular expression. 用于搜索.
" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \*  当前MarkWord的下一个     \#  当前MarkWord的上一个
" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :NERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
"map <F3> :NERDTreeToggle<CR>
"imap <F3> <ESC>:NERDTreeToggle<CR>


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 ,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看


"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a <LEFT><LEFT><LEFT>


"-----------------------------------------------------------------
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – checksyntax.vim    JavaScript常见语法错误检查
" 默认快捷方式为 F5
"-----------------------------------------------------------------
let g:checksyntax_auto = 0 " 不自动检查


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim    自动补全插件
"-----------------------------------------------------------------
let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
" <TAB> completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)


"-----------------------------------------------------------------
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - vcscommand.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" SVN/git管理工具
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – a.vim
"----------------------------------------------------------------- 



"-----------------------------------------------------------------
" 自定义配置
"----------------------------------------------------------------- 
:highlight Folded ctermfg=0 ctermbg=7
set t_Co=256

func! CompileCpp()
    exec "w"
    if filereadable("Makefile")
        exec "!make -j8"
    elseif filereadable("build.sh")
        exec "!bash ./build.sh"
    else
        exec "!g++ % -o %< -g -lpthread -std=c++17 -Wno-invalid-source-encoding"
    endif
endfunc

func! Run()
    if filereadable("app")
        exec "!./app"
    else
        let file_name = expand("%:p")
        let file_ext = expand("%:e")
        if file_ext == "tex" || file_ext == "xtex"
            exec "!evince %<.pdf &"
        else
            exec "!./%<"
        endif
    endif
endfunc

func! ComAndRun()
    exec "w"
    let file_name = expand("%:p")
    let file_ext = expand("%:e")
    " vim中.号为字符串连接？
    if filereadable("build.sh")
        exec "!bash ./build.sh"
    else
        if filereadable("../build.sh")
            exec "!cd .. && bash ./build.sh"
        elseif file_ext == "py"
            if filereadable(".py2")
                exec "!python2 ".file_name
            else
                exec "!python3 ".file_name
            endif
        elseif file_ext == "scala"
            exec "!scalac -deprecation ".file_name
            exec "!scala Solution"
        elseif file_ext == "asm"
            exec "!nasm ".file_name
        elseif file_ext == "sh"
            exec "!bash ".file_name
        elseif file_ext == "tex"
            exec "!pdflatex ".file_name
            "exec "!evince %<.pdf &"
        elseif file_ext == "xtex"
            exec "!xelatex ".file_name
            "exec "!evince %<.pdf &"
        elseif file_ext == "m"
            exec "!octave ".file_name
        elseif file_ext == "jl"
            exec "!julia ".file_name
        elseif file_ext == "md"
            exec "!marktext ".file_name." &"
        elseif file_ext == "rs"
            exec "!rustc ".file_name
            call Run()
        elseif file_ext == "go"
            exec "!go run ".file_name
        else
            call CompileCpp()
            call Run()
        endif
    endif
endfunc

au BufRead,BufNewFile *.asm set filetype=nasm

au BufRead,BufNewFile *.h call Tab2()
au BufRead,BufNewFile *.c call Tab2()
au BufRead,BufNewFile *.cu call Tab2()
au BufRead,BufNewFile *.cuh call Tab2()
au BufRead,BufNewFile *.cpp call Tab2()
au BufRead,BufNewFile *.cc call Tab2()
au BufRead,BufNewFile *.hpp call Tab2()

func! ComAll()
    exec "w"
    exec "!g++ *.cpp -o app -g -lpthread -std=c++17 -Wno-invalid-source-encoding"
endfunc

func! Debug()
    if filereadable("app")
        exec "!gdb app"
    else
        exec "!gdb %<"
    endif
endfunc

function! Tab2()
    set shiftwidth=2            " 设定 << 和 >> 命令移动时的宽度为 2
    set softtabstop=2           " 使得按退格键时可以一次删掉 2 个空格
    set tabstop=2               " 设定 tab 长度为 2
    set ts=2
endfunction

function! Tab4()
    set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
    set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
    set tabstop=4               " 设定 tab 长度为 4
    set ts=4
endfunction

map <F5> :call ComAndRun()<CR>
map <C-F5> :call CompileCpp()<CR>
map <F6> :call Run()<CR>
map <F7> :call ComAll()<CR>
map <C-F7> :call RunApp()<CR>
map <F8> :call Debug()<CR>
map <F2> ggVG"+y<CR>
map <F3> "+p<CR>
map <F9> :%s/\s\+$//<CR>
"vmap <c-c> "+y
"set directory=/tmp

"let g:SuperTabDefaultCompletionType="context"   

let g:ycm_confirm_extra_conf = 0
" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_collect_identifiers_from_tag_files = 1

set completeopt=menu

Plug 'terryma/vim-multiple-cursors'
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"语法检查
"Plug 'scrooloose/syntastic'
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" vim-gutentags 配置
" 作者：韦易笑
" 链接：https://www.zhihu.com/question/47691414/answer/373700711
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', 'data', 'dataset', 'datasets']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"Plug 'msanders/snipmate.vim'
"Plug 'tmhedberg/matchit'
Plug 'bling/vim-airline'
let g:airline_theme="luna" 

nnoremap <C-l> :TagbarToggle<CR>

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nnoremap <F4> :NERDTreeMirror<CR>
nnoremap <F4> :NERDTreeToggle<CR>

Plug 'pbrisbin/vim-mkdir'
"Plug 'godlygeek/tabular'
"Plug 'suan/vim-instant-markdown'
Plug 'morhetz/gruvbox'
Plug 'preservim/tagbar'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'

" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code
" Install yarn from https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'zxqfl/tabnine-vim'
" Plug 'rust-lang/rust.vim'
nnoremap <silent> K :call CocActionAsync('doHover')<cr>

Plug 'gioele/vim-autoswap'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'github/copilot.vim'

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

call plug#end()

colorscheme gruvbox
set bg=dark



set mouse-=a
set textwidth=512
set wrap

set tags=./.tags;,.tags
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>

"python 代码折叠
set foldmethod=indent

au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
au BufNewFile,BufRead *.xtex set ft=tex

:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

" for easy using sliver search
" author: ballack_linux
" 原文链接：https://blog.csdn.net/ballack_linux/article/details/53187283
nmap <leader>f :norm yiw<CR>:!ag -t -Q "<C-R>""<CR>


" Locate and return character "above" current cursor position.
function! LookUpwards()
    let column_num = virtcol('.')
    let target_pattern = '\%' . column_num . 'v.'
    let target_line_num = search(target_pattern . '*\S', 'bnW')


    if !target_line_num
        return ""
    else
        return matchstr(getline(target_line_num), target_pattern)
    endif
endfunction


imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>
let g:coc_disable_startup_warning = 1
set mouse=
